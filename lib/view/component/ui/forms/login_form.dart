import '../../../../utils/imports/common_libs.dart';
import '../../../../components/glass_input.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? _submissionError;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
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
      await userProvider.login(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );
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
    final String? errorMessage =
        _submissionError ??
        (providerError == null ? null : l10n.loginGenericError);

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GlassInput(
            controller: _emailController,
            hintText: 'email@example.com',
            labelText: l10n.labelEmail,
            semanticsLabel: l10n.labelEmail,
            enabled: !isLoading,
            height: uiConstants.glassInputHeightMedium,
            borderRadius: uiConstants.glassInputBorderRadius,
            contentPadding: uiConstants.glassInputContentPadding,
            keyboardType: TextInputType.emailAddress,
            autofillHints: const [AutofillHints.email],
            textInputAction: TextInputAction.next,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return l10n.errorRequiredField;
              }
              if (!value.contains('@')) {
                return l10n.errorInvalidEmail;
              }
              return null;
            },
            prefixIcon: const Icon(Icons.email_outlined),
          ),
          SizedBox(height: uiConstants.spacing4),
          GlassInput(
            controller: _passwordController,
            hintText: '********',
            labelText: l10n.labelPassword,
            semanticsLabel: l10n.labelPassword,
            enabled: !isLoading,
            height: uiConstants.glassInputHeightMedium,
            borderRadius: uiConstants.glassInputBorderRadius,
            contentPadding: uiConstants.glassInputContentPadding,
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            autofillHints: const [AutofillHints.password],
            textInputAction: TextInputAction.done,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return l10n.errorRequiredField;
              }
              return null;
            },
            onSubmitted: (_) => _handleSubmit(),
            prefixIcon: const Icon(Icons.lock_outline),
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
            variant: ButtonVariant.glass,
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
