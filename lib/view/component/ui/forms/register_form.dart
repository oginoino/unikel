import 'package:unikel/view/component/ui/button/custom_cta_button.dart';
import 'package:unikel/view/component/ui/page_indicator/page_indicator.dart';

import '../../../../utils/form_validators.dart';
import '../../../../utils/imports/common_libs.dart';
import '../padding/responsive_padding.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:pinput/pinput.dart';

class RegisterUserForm extends StatefulWidget {
  const RegisterUserForm({super.key});

  @override
  State<RegisterUserForm> createState() => _RegisterUserFormState();
}

class _RegisterUserFormState extends State<RegisterUserForm> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  CountryCode _selectedCountryCode = CountryCode.fromCountryCode('BR');
  final List<GlobalKey<FormState>> _formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _phoneCodeController = TextEditingController();
  final TextEditingController _securityCodeController = TextEditingController();

  // Novos estados para feedback de verificação
  bool _isVerifying = false;
  bool _verificationComplete = false;
  String? _verificationMessage;

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
    _securityCodeController.dispose();
    super.dispose();
  }

  void _onSecurityCodeChanged() {
    // Trigger verification quando o código completo for inserido
    if (_securityCodeController.text.length == 4) {
      _verifySecurityCode();
    } else {
      // Reset verification state se o usuário apagar caracteres
      if (_isVerifying || _verificationComplete) {
        setState(() {
          _isVerifying = false;
          _verificationComplete = false;
          _verificationMessage = null;
        });
      }
    }
  }

  Future<void> _verifySecurityCode() async {
    if (_isVerifying || _verificationComplete) return;

    setState(() {
      _isVerifying = true;
      _verificationMessage = null;
    });

    try {
      // Simular chamada à API para verificação do código
      await Future.delayed(const Duration(seconds: 2));

      // Simular sucesso na verificação
      // Em produção, aqui você faria a chamada real à sua API
      final isValid = _validateSecurityCode(_securityCodeController.text);

      setState(() {
        _isVerifying = false;
        _verificationComplete = true;
        _verificationMessage = isValid
            ? 'Código verificado com sucesso!'
            : 'Código inválido. Tente novamente.';
      });

      // Se falhar, resetar estado após alguns segundos
      if (!isValid) {
        await Future.delayed(const Duration(seconds: 2));
        setState(() {
          _verificationComplete = false;
          _verificationMessage = null;
        });
      }
    } catch (e) {
      setState(() {
        _isVerifying = false;
        _verificationComplete = true;
        _verificationMessage = 'Erro ao verificar código. Tente novamente.';
      });
    }
  }

  bool _validateSecurityCode(String code) {
    // Implemente aqui sua lógica de validação
    // Por enquanto, qualquer código com 4 dígitos é considerado válido
    return code.length == 4 && code != '0000';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            children: [
              // Page 1: Name Input
              ResponsivePadding(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: uiConstants.spacing16),
                      Text(
                        context.l10n.registerNameTitle,
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      SizedBox(height: uiConstants.spacing16),
                      Form(
                        key: _formKeys[0],
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextFormField(
                              controller: _nameController,
                              decoration: InputDecoration(
                                labelText: context.l10n.labelName,
                                border: OutlineInputBorder(),
                                labelStyle: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.onSurfaceVariant,
                                    ),
                              ),
                              validator: (value) =>
                                  FormValidators.validateRequired(
                                    value,
                                    context.l10n.nameValue,
                                    context,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Page 2: Phone Input
              ResponsivePadding(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: uiConstants.spacing16),
                      Text(
                        context.l10n.registerPhoneTitle,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      SizedBox(height: uiConstants.spacing16),
                      Padding(
                        padding: EdgeInsets.all(uiConstants.spacing4),
                        child: Form(
                          key: _formKeys[1],
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: uiConstants.buttonHeight * 1.9,
                                    child: CountryCodePicker(
                                      dialogTextStyle: Theme.of(
                                        context,
                                      ).textTheme.bodyMedium,
                                      dialogBackgroundColor: Theme.of(
                                        context,
                                      ).canvasColor,
                                      headerText:
                                          context.l10n.selectCountryCode,
                                      boxDecoration: BoxDecoration(
                                        border: Border.all(
                                          color: Theme.of(context).dividerColor,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                          uiConstants.radius16,
                                        ),
                                      ),
                                      flagWidth: uiConstants.spacing4,
                                      padding: EdgeInsets.zero,
                                      margin: EdgeInsets.symmetric(
                                        horizontal: uiConstants.spacing1,
                                      ),
                                      textStyle: Theme.of(
                                        context,
                                      ).textTheme.bodyMedium,
                                      onChanged: (countryCode) {
                                        setState(() {
                                          _selectedCountryCode = countryCode;
                                          _phoneCodeController.text =
                                              countryCode.dialCode ?? '';
                                        });
                                      },
                                      initialSelection:
                                          _selectedCountryCode.code,
                                      favorite: const ['+55', 'BR'],
                                      showCountryOnly: false,
                                      showOnlyCountryWhenClosed: false,
                                      alignLeft: true,
                                    ),
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      controller: _phoneController,
                                      keyboardType: TextInputType.phone,
                                      decoration: InputDecoration(
                                        labelText: context.l10n.labelPhone,
                                        border: OutlineInputBorder(),
                                      ),
                                      validator: (value) =>
                                          FormValidators.validatePhone(
                                            value,
                                            context,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Page 3: Phone Code Input com Feedback
              ResponsivePadding(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: uiConstants.spacing16),
                      Text(
                        context.l10n.registerSecurityCodeTitle,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      SizedBox(height: uiConstants.spacing16),
                      Padding(
                        padding: EdgeInsets.all(uiConstants.spacing4),
                        child: Form(
                          key: _formKeys[2],
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Pinput(
                                autofillHints: const [
                                  AutofillHints.oneTimeCode,
                                ],
                                controller: _securityCodeController,
                                length: 4,
                                enabled: !_verificationComplete,
                                defaultPinTheme: PinTheme(
                                  width: 56,
                                  height: 56,
                                  textStyle: Theme.of(
                                    context,
                                  ).textTheme.headlineSmall,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color:
                                          Theme.of(context)
                                              .inputDecorationTheme
                                              .enabledBorder
                                              ?.borderSide
                                              .color ??
                                          Theme.of(context).dividerColor,
                                      width:
                                          Theme.of(context)
                                              .inputDecorationTheme
                                              .enabledBorder
                                              ?.borderSide
                                              .width ??
                                          1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(
                                      uiConstants.radius16,
                                    ),
                                  ),
                                ),
                                focusedPinTheme: PinTheme(
                                  padding: EdgeInsets.all(uiConstants.spacing6),
                                  width: 56,
                                  height: 56,
                                  textStyle: Theme.of(
                                    context,
                                  ).textTheme.headlineSmall,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color:
                                          Theme.of(context)
                                              .inputDecorationTheme
                                              .focusedBorder
                                              ?.borderSide
                                              .color ??
                                          Theme.of(context).primaryColor,
                                      width:
                                          Theme.of(context)
                                              .inputDecorationTheme
                                              .focusedBorder
                                              ?.borderSide
                                              .width ??
                                          2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(
                                      uiConstants.radius16,
                                    ),
                                  ),
                                ),
                                submittedPinTheme: PinTheme(
                                  width: 56,
                                  height: 56,
                                  textStyle: Theme.of(
                                    context,
                                  ).textTheme.headlineSmall,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color:
                                          Theme.of(context)
                                              .inputDecorationTheme
                                              .focusedBorder
                                              ?.borderSide
                                              .color ??
                                          Theme.of(context).primaryColor,
                                      width:
                                          Theme.of(context)
                                              .inputDecorationTheme
                                              .focusedBorder
                                              ?.borderSide
                                              .width ??
                                          2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(
                                      uiConstants.radius16,
                                    ),
                                  ),
                                ),
                                validator: (value) =>
                                    FormValidators.validateRequired(
                                      value,
                                      context.l10n.labelSecurityCode,
                                      context,
                                    ),
                                keyboardType: TextInputType.number,
                              ),
                              SizedBox(height: uiConstants.spacing20),
                              // Feedback de Verificação
                              if (_isVerifying)
                                Column(
                                  children: [
                                    SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2.5,
                                      ),
                                    ),
                                    SizedBox(height: uiConstants.spacing12),
                                    Text(
                                      context.l10n.verifyingCode,
                                      style: Theme.of(
                                        context,
                                      ).textTheme.bodyMedium,
                                    ),
                                  ],
                                )
                              else if (_verificationComplete)
                                Column(
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color:
                                            _verificationMessage ==
                                                context.l10n.codeVerifiedSuccess
                                            ? Theme.of(
                                                context,
                                              ).colorScheme.primary
                                            : Theme.of(
                                                context,
                                              ).colorScheme.error,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        _verificationMessage ==
                                                context.l10n.codeVerifiedSuccess
                                            ? Icons.check
                                            : Icons.close,
                                        color: Colors.white,
                                        size: 28,
                                      ),
                                    ),
                                    SizedBox(height: uiConstants.spacing12),
                                    Text(
                                      _verificationMessage ?? '',
                                      textAlign: TextAlign.center,
                                      style: Theme.of(
                                        context,
                                      ).textTheme.bodyMedium,
                                    ),
                                  ],
                                )
                              else
                                const SizedBox.shrink(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        PageIndicator(currentPage: _currentPage, itemCount: _formKeys.length),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: uiConstants.spacing4,
            vertical: uiConstants.spacing20,
          ),
          child: SizedBox(
            height: uiConstants.buttonHeight,
            child: Row(
              spacing: uiConstants.spacing4,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (_currentPage > 0 && _currentPage < _formKeys.length - 1)
                  Expanded(
                    child: CustomCTAButton(
                      onPressed: () {
                        _pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      },
                      variant: ButtonVariant.secondary,
                      label: context.l10n.previous,
                      icon: Icon(Icons.arrow_back_rounded),
                    ),
                  ),

                if (_currentPage < _formKeys.length - 1)
                  Expanded(
                    child: CustomCTAButton(
                      onPressed: () {
                        if (_formKeys[_currentPage].currentState!.validate()) {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                          );
                        }
                      },
                      icon: Icon(Icons.arrow_forward_rounded),
                      variant: ButtonVariant.primary,
                      label: context.l10n.next,
                    ),
                  ),

                if (_currentPage == _formKeys.length - 1)
                  Expanded(
                    child: CustomCTAButton(
                      onPressed: () {
                        // clear piped data
                        _verificationComplete = false;
                        _verificationMessage = '';
                        _securityCodeController.clear();

                        // back to last page
                        _pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      },
                      variant: ButtonVariant.secondary,
                      label: context.l10n.editarTelefoneTextMessage,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
