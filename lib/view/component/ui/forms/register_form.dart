import 'package:country_code_picker/country_code_picker.dart';
import 'package:pinput/pinput.dart';
import '../../../../utils/imports/common_libs.dart';

class RegisterUserForm extends StatefulWidget {
  const RegisterUserForm({super.key});

  @override
  State<RegisterUserForm> createState() => _RegisterUserFormState();
}

class _RegisterUserFormState extends State<RegisterUserForm> {
  static const Duration _pageTransitionDuration = Duration(milliseconds: 300);
  static const Curve _pageTransitionCurve = Curves.easeIn;
  static const int _resendDelaySeconds = 30;

  final PageController _pageController = PageController();
  final List<GlobalKey<FormState>> _formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _phoneCodeController = TextEditingController();
  final TextEditingController _securityCodeController = TextEditingController();

  int _currentPage = 0;
  int _resendCountdown = 0;
  Timer? _resendTimer;
  CountryCode _selectedCountryCode = CountryCode.fromCountryCode('BR');

  VerificationState _verificationState = VerificationState.idle;
  String? _verificationMessage;

  bool get _isOnFirstPage => _currentPage == 0;
  bool get _isOnLastPage => _currentPage == _formKeys.length - 1;

  @override
  void initState() {
    super.initState();
    _phoneCodeController.text = _selectedCountryCode.dialCode ?? '';
    _securityCodeController.addListener(_onSecurityCodeChanged);
  }

  @override
  void dispose() {
    _pageController.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    _phoneCodeController.dispose();
    _securityCodeController.removeListener(_onSecurityCodeChanged);
    _securityCodeController.dispose();
    _cancelResendTimer();
    super.dispose();
  }

  void _safeSetState(VoidCallback updates) {
    if (!mounted) return;
    setState(updates);
  }

  void _onSecurityCodeChanged() {
    final code = _securityCodeController.text;

    if (code.length == 4 && _verificationState == VerificationState.idle) {
      _verifySecurityCode();
    } else if (code.length < 4 && _verificationState != VerificationState.idle) {
      _resetVerificationState();
    }
  }

  void _updateSelectedCountryCode(CountryCode countryCode) {
    _safeSetState(() {
      _selectedCountryCode = countryCode;
      _phoneCodeController.text = countryCode.dialCode ?? '';
    });
  }

  void _setVerificationStatus(VerificationState state, {String? message}) {
    if (_verificationState == state && _verificationMessage == message) {
      return;
    }

    _safeSetState(() {
      _verificationState = state;
      _verificationMessage = message;
    });
  }

  void _resetVerificationState() {
    _setVerificationStatus(VerificationState.idle);
  }

  void _startResendTimer() {
    _cancelResendTimer();

    _safeSetState(() {
      _resendCountdown = _resendDelaySeconds;
    });

    _resendTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_resendCountdown <= 1) {
        timer.cancel();
        _safeSetState(() {
          _resendCountdown = 0;
        });
        return;
      }

      _safeSetState(() {
        _resendCountdown--;
      });
    });
  }

  void _cancelResendTimer() {
    _resendTimer?.cancel();
    _resendTimer = null;
  }

  void _onPageChanged(int page) {
    if (_currentPage == page) {
      return;
    }

    _safeSetState(() {
      _currentPage = page;
    });
  }

  void _goToNextPage() {
    _pageController.nextPage(
      duration: _pageTransitionDuration,
      curve: _pageTransitionCurve,
    );
  }

  void _goToPreviousPage() {
    _pageController.previousPage(
      duration: _pageTransitionDuration,
      curve: _pageTransitionCurve,
    );
  }

  void _handleNextStep() {
    final formState = _formKeys[_currentPage].currentState;
    if (formState == null || !formState.validate()) {
      return;
    }

    if (_currentPage == _formKeys.length - 2) {
      _resetVerificationState();
      _securityCodeController.clear();
      _startResendTimer();
    }

    _goToNextPage();
  }

  void _handleEditPhone() {
    _resetVerificationState();
    _securityCodeController.clear();
    _cancelResendTimer();
    _safeSetState(() {
      _resendCountdown = 0;
    });
    _goToPreviousPage();
  }

  Future<void> _navigateToHomeAfterSuccess() async {
    await Future.delayed(const Duration(seconds: 1));
    if (!mounted) return;
    context.go(Routes.home);
  }

  Future<void> _clearVerificationFeedback({required Duration delay}) async {
    await Future.delayed(delay);
    _resetVerificationState();
  }

  Future<void> _resendSecurityCode() async {
    final l10n = context.l10n;
    _setVerificationStatus(VerificationState.verifying);

    try {
      await Future.delayed(const Duration(seconds: 1));
      if (!mounted) return;

      _securityCodeController.clear();
      _startResendTimer();
      _setVerificationStatus(
        VerificationState.idle,
        message: l10n.codeResendSuccess,
      );
      unawaited(
        _clearVerificationFeedback(delay: const Duration(seconds: 2)),
      );
    } catch (_) {
      _setVerificationStatus(
        VerificationState.error,
        message: l10n.errorResendingCode,
      );
      unawaited(
        _clearVerificationFeedback(delay: const Duration(seconds: 2)),
      );
    }
  }

  Future<void> _verifySecurityCode() async {
    if (_verificationState != VerificationState.idle) {
      return;
    }

    final l10n = context.l10n;
    _setVerificationStatus(VerificationState.verifying);

    try {
      await Future.delayed(const Duration(seconds: 2));
      if (!mounted) return;

      final code = _securityCodeController.text;
      final isValid = _validateSecurityCode(code);

      if (isValid) {
        _setVerificationStatus(
          VerificationState.success,
          message: l10n.codeVerifiedSuccess,
        );
        unawaited(_navigateToHomeAfterSuccess());
      } else {
        _setVerificationStatus(
          VerificationState.error,
          message: l10n.invalidPhoneCodeMatch,
        );
        await Future.delayed(const Duration(seconds: 2));
        if (!mounted) return;
        _resetVerificationState();
        _securityCodeController.clear();
      }
    } catch (_) {
      _setVerificationStatus(
        VerificationState.error,
        message: l10n.errorVerifyingCode,
      );
      unawaited(
        _clearVerificationFeedback(delay: const Duration(seconds: 2)),
      );
    }
  }

  bool _validateSecurityCode(String code) {
    return code.length == 4 && code != '0000';
  }

  PinTheme _buildPinTheme({
    required ThemeData theme,
    BorderSide? borderSide,
    EdgeInsetsGeometry? padding,
    double fallbackWidth = 1.0,
    Color? fallbackColor,
  }) {
    final resolvedBorder = borderSide ??
        BorderSide(
          color: fallbackColor ?? theme.dividerColor,
          width: fallbackWidth,
        );
   

    return PinTheme(
      width: 64,
      height: 64,
      textStyle: theme.textTheme.headlineSmall,
      decoration: BoxDecoration(
        border: Border.all(
          color: resolvedBorder.color,
          width: resolvedBorder.width,
        ),
        borderRadius: BorderRadius.circular(uiConstants.radius16),
      ),
     
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final l10n = context.l10n;

    return Column(
      children: [
        Expanded(
          child: PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: _onPageChanged,
            children: [
              _buildNameStep(
                context: context,
                l10n: l10n,
                theme: theme,
                textTheme: textTheme,
              ),
              _buildPhoneStep(
                context: context,
                l10n: l10n,
                theme: theme,
                textTheme: textTheme,
              ),
              _buildSecurityCodeStep(
                context: context,
                l10n: l10n,
                theme: theme,
                textTheme: textTheme,
              ),
            ],
          ),
        ),
        PageIndicator(currentPage: _currentPage, itemCount: _formKeys.length),
        _buildFooterControls(
          context: context,
          l10n: l10n,
        ),
      ],
    );
  }

  Widget _buildNameStep({
    required BuildContext context,
    required AppLocalizations l10n,
    required ThemeData theme,
    required TextTheme textTheme,
  }) {
    return ResponsivePadding(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: uiConstants.spacing16),
            Text(
              l10n.registerNameTitle,
              textAlign: TextAlign.left,
              style: textTheme.headlineMedium,
            ),
            SizedBox(height: uiConstants.spacing16),
            Form(
              key: _formKeys[0],
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: _nameController,
                    style: textTheme.titleLarge,
                    decoration: InputDecoration(labelText: l10n.labelName),
                    validator: (value) => FormValidators.validateRequired(
                      value,
                      l10n.nameValue,
                      context,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPhoneStep({
    required BuildContext context,
    required AppLocalizations l10n,
    required ThemeData theme,
    required TextTheme textTheme,
  }) {
    return ResponsivePadding(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: uiConstants.spacing16),
            Text(
              l10n.registerPhoneTitle,
              style: textTheme.headlineMedium,
            ),
            SizedBox(height: uiConstants.spacing16),
            Padding(
              padding: EdgeInsets.all(uiConstants.spacing4),
              child: Form(
                key: _formKeys[1],
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Flexible(
                            flex: 3,
                            fit: FlexFit.loose,
                            child: SizedBox(
                              height: uiConstants.buttonHeight,
                              child: CountryCodePicker(
                                dialogTextStyle: textTheme.titleMedium,
                                dialogBackgroundColor:
                                    theme.scaffoldBackgroundColor,
                                backgroundColor: theme.cardColor,
                                headerText: l10n.selectCountryCode,
                                boxDecoration: BoxDecoration(
                                  border: Border.all(
                                    color: theme.dividerColor,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    uiConstants.radius16,
                                  ),
                                ),
                                flagWidth: uiConstants.spacing8,
                                padding: EdgeInsets.symmetric(
                                  vertical: uiConstants.spacing3,
                                  horizontal: uiConstants.spacing1,
                                ),
                                margin: EdgeInsets.zero,
                                textStyle: textTheme.titleMedium,
                                onChanged: _updateSelectedCountryCode,
                                initialSelection: _selectedCountryCode.code,
                                favorite: const ['+55', 'BR'],
                                comparator: (a, b) =>
                                    a.name?.compareTo(b.name ?? '') ?? 0,
                                pickerStyle: PickerStyle.dialog,
                                builder: (country) {
                                  final flagUri = country?.flagUri;
                                  return Padding(
                                    padding: EdgeInsets.only(
                                      left: uiConstants.spacing2,
                                    ),
                                    child: flagUri != null ?
                                      Padding(
                                        padding: EdgeInsets.only(
                                          right: uiConstants.spacing1,
                                        ),
                                        child: Image.asset(
                                          flagUri,
                                          package: 'country_code_picker',
                                          width: uiConstants.spacing6,
                                          height: uiConstants.spacing6,
                                          fit: BoxFit.contain,
                                        ),
                                      ) : const SizedBox.shrink()
                                  );
                                },
                              ),
                            ),
                          ),
                          SizedBox(width: uiConstants.spacing3),
                          Expanded(
                            flex: 20,
                            child: TextFormField(
                              controller: _phoneController,
                              keyboardType: TextInputType.phone,
                              style: textTheme.titleLarge,
                              decoration:
                                  InputDecoration(labelText: l10n.labelPhone),
                              validator: (value) => FormValidators.validatePhone(
                                value,
                                context,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSecurityCodeStep({
    required BuildContext context,
    required AppLocalizations l10n,
    required ThemeData theme,
    required TextTheme textTheme,
  }) {
    final dialCode = _selectedCountryCode.dialCode ?? '';
    final phoneDisplay = '$dialCode${_phoneController.text}';
    final inputDecorationTheme = theme.inputDecorationTheme;
    final BorderSide? enabledBorderSide =
        inputDecorationTheme.enabledBorder?.borderSide;
    final BorderSide? focusedBorderSide =
        inputDecorationTheme.focusedBorder?.borderSide;

    return ResponsivePadding(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: uiConstants.spacing16),
            Text(
              l10n.registerSecurityCodeTitle,
              style: textTheme.headlineMedium,
            ),
            SizedBox(height: uiConstants.spacing8),
            Text(
              l10n.verifyPhoneNumberMessage(phoneDisplay),
              style: textTheme.titleMedium,
            ),
            SizedBox(height: uiConstants.spacing16),
            Padding(
              padding: EdgeInsets.all(uiConstants.spacing4),
              child: Form(
                key: _formKeys[2],
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Pinput(
                      autofillHints: const [
                        AutofillHints.oneTimeCode,
                      ],
                      controller: _securityCodeController,
                      length: 4,
                      enabled: _verificationState != VerificationState.success,
                      defaultPinTheme: _buildPinTheme(
                        theme: theme,
                        borderSide: enabledBorderSide,
                        fallbackWidth: enabledBorderSide?.width ?? 1.0,
                      ),
                      focusedPinTheme: _buildPinTheme(
                        theme: theme,
                        borderSide: focusedBorderSide,
                        fallbackWidth: focusedBorderSide?.width ?? 2.0,
                        fallbackColor: theme.primaryColor,
                        padding: EdgeInsets.all(uiConstants.spacing6),
                      ),
                      submittedPinTheme: _buildPinTheme(
                        theme: theme,
                        borderSide: focusedBorderSide,
                        fallbackWidth: focusedBorderSide?.width ?? 2.0,
                        fallbackColor: theme.primaryColor,
                      ),
                      validator: (value) => FormValidators.validateRequired(
                        value,
                        l10n.labelSecurityCode,
                        context,
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: uiConstants.spacing20),
                    _buildVerificationFeedback(
                      l10n: l10n,
                      theme: theme,
                      textTheme: textTheme,
                    ),
                    SizedBox(height: uiConstants.spacing8),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFooterControls({
    required BuildContext context,
    required AppLocalizations l10n,
  }) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: uiConstants.spacing4,
          vertical: uiConstants.spacing20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              spacing: uiConstants.spacing4,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (!_isOnFirstPage && !_isOnLastPage)
                  Expanded(
                    child: CustomCTAButton(
                      onPressed: _goToPreviousPage,
                      variant: ButtonVariant.secondary,
                      label: l10n.previous,
                      icon: const Icon(Icons.arrow_back_rounded),
                    ),
                  ),
                if (!_isOnLastPage)
                  Expanded(
                    child: CustomCTAButton(
                      onPressed: _handleNextStep,
                      icon: const Icon(Icons.arrow_forward_rounded),
                      variant: ButtonVariant.primary,
                      label: l10n.next,
                    ),
                  ),
              ],
            ),
            if (_isOnLastPage)
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildResendCodeButton(l10n),
                  SizedBox(height: uiConstants.spacing4),
                  CustomCTAButton(
                    onPressed: _handleEditPhone,
                    variant: ButtonVariant.secondary,
                    label: l10n.editarTelefoneTextMessage,
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildVerificationFeedback({
    required AppLocalizations l10n,
    required ThemeData theme,
    required TextTheme textTheme,
  }) {
    switch (_verificationState) {
      case VerificationState.idle:
        if (_verificationMessage == null || _verificationMessage!.isEmpty) {
          return const SizedBox.shrink();
        }
        return Text(
          _verificationMessage!,
          textAlign: TextAlign.center,
          style: textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.primary,
          ),
        );
      case VerificationState.verifying:
        return Column(
          children: [
            const SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(strokeWidth: 2.5),
            ),
            SizedBox(height: uiConstants.spacing12),
            Text(
              l10n.verifyingCode,
              style: textTheme.bodyMedium,
            ),
          ],
        );
      case VerificationState.success:
        return Column(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: theme.colorScheme.primary,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.check, color: Colors.white, size: 28),
            ),
            SizedBox(height: uiConstants.spacing12),
            Text(
              _verificationMessage ?? '',
              textAlign: TextAlign.center,
              style: textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.primary,
              ),
            ),
          ],
        );
      case VerificationState.error:
        return Column(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: theme.colorScheme.error,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.close, color: Colors.white, size: 28),
            ),
            SizedBox(height: uiConstants.spacing12),
            Text(
              _verificationMessage ?? '',
              textAlign: TextAlign.center,
              style: textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.error,
              ),
            ),
          ],
        );
    }
  }

  Widget _buildResendCodeButton(AppLocalizations l10n) {
    final isCountdownActive = _resendCountdown > 0;
    final label = isCountdownActive
        ? '${l10n.resendCode} (${_resendCountdown}s)'
        : l10n.resendCode;

    return SizedBox(
      width: double.infinity,
      child: CustomCTAButton(
        onPressed: isCountdownActive ? null : _resendSecurityCode,
        variant: ButtonVariant.primary,
        label: label,
        icon: isCountdownActive ? null : const Icon(Icons.refresh_rounded),
      ),
    );
  }
}

enum VerificationState { idle, verifying, success, error }
