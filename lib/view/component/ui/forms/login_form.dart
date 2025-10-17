import 'package:country_code_picker/country_code_picker.dart';

import '../../../../utils/imports/common_libs.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();
  CountryCode _selectedCountryCode = CountryCode.fromCountryCode('BR');

  String? _submissionError;

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  String _composeFullPhoneNumber() {
    final dialCode = _selectedCountryCode.dialCode ?? '';
    final trimmedPhone = _phoneController.text.trim();
    final rawValue = '$dialCode$trimmedPhone';
    return rawValue.replaceAll(RegExp(r'[^0-9+]'), '');
  }

  Future<void> _handleSubmit() async {
    final formState = _formKey.currentState;
    if (formState == null || !formState.validate()) {
      return;
    }

    FocusScope.of(context).unfocus();
    setState(() {
      _submissionError = null;
    });

    final userProvider = context.read<UserDataProvider>();
    final l10n = context.l10n;
    try {
      await userProvider.login(phone: _composeFullPhoneNumber());
      if (!mounted) return;
      context.go(Routes.home);
    } on StateError catch (_) {
      setState(() {
        _submissionError = l10n.loginUserNotFound;
      });
    } catch (error) {
      setState(() {
        _submissionError = l10n.loginGenericError;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final l10n = context.l10n;
    final userProvider = context.watch<UserDataProvider>();

    final bool isLoading = userProvider.isLoading;
    final String? providerError = userProvider.errorMessage;
    final String? errorMessage = _submissionError ??
        (providerError == null ? null : l10n.loginGenericError);

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.loginPageTitle,
            style: textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: uiConstants.spacing2),
          Text(
            l10n.loginPageSubtitle,
            style: textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          SizedBox(height: uiConstants.spacing6),
          Text(
            l10n.labelPhone,
            style: textTheme.labelLarge,
          ),
          SizedBox(height: uiConstants.spacing1),
          Row(
            children: [
              SizedBox(
                width: 112,
                height: uiConstants.buttonHeight,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(uiConstants.radius12),
                    border: Border.all(
                      color: theme.colorScheme.outlineVariant,
                      width: uiConstants.borderWidth1,
                    ),
                    color: theme.colorScheme.surfaceContainerLowest,
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: uiConstants.spacing2),
                  child: Center(
                    child: CountryCodePicker(
                      onChanged: (countryCode) {
                        setState(() {
                          _selectedCountryCode = countryCode;
                        });
                      },
                      initialSelection: _selectedCountryCode.code,
                      favorite: const ['BR', 'US'],
                      showCountryOnly: false,
                      showOnlyCountryWhenClosed: false,
                      alignLeft: false,
                      padding: EdgeInsets.zero,
                      textStyle: textTheme.bodyLarge,
                    ),
                  ),
                ),
              ),
              SizedBox(width: uiConstants.spacing2),
              Expanded(
                child: TextFormField(
                  controller: _phoneController,
                  enabled: !isLoading,
                  decoration: InputDecoration(
                    hintText: l10n.phoneValue,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(uiConstants.radius12),
                    ),
                  ),
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.done,
                  validator: (value) =>
                      FormValidators.validatePhone(value, context),
                  onFieldSubmitted: (_) => _handleSubmit(),
                ),
              ),
            ],
          ),
          if (errorMessage != null) ...[
            SizedBox(height: uiConstants.spacing3),
            Text(
              errorMessage,
              style: textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.error,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
          SizedBox(height: uiConstants.spacing6),
          CustomCTAButton(
            label: l10n.login,
            onPressed: isLoading ? null : _handleSubmit,
            isLoading: isLoading,
          ),
          SizedBox(height: uiConstants.spacing2),
          Align(
            alignment: Alignment.center,
            child: TextButton(
              onPressed: isLoading
                  ? null
                  : () => context.go(Routes.registerUser),
              child: Text(l10n.loginPageRegisterCta),
            ),
          ),
        ],
      ),
    );
  }
}
