import 'package:glassy/view/theme/glass_theme_extention.dart';

import '../../../../utils/imports/common_libs.dart';
import '../../../../components/glass_input.dart';
import '../glassmorphism/glass_container.dart';

class RegisterUserForm extends StatefulWidget {
  const RegisterUserForm({super.key});

  @override
  State<RegisterUserForm> createState() => _RegisterUserFormState();
}

class _RegisterUserFormState extends State<RegisterUserForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? _submissionError;

  @override
  void dispose() {
    _nameController.dispose();
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
      await userProvider.registerConsumer(
        name: _nameController.text.trim(),
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );
      if (!mounted) return;
      context.go(Routes.home);
    } catch (error) {
      setState(() {
        _submissionError = l10n.registerGenericError;
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

    return SingleChildScrollView(
      child: ResponsivePadding(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: uiConstants.spacing8),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Semantics(
                  header: true,
                  child: Text(
                    l10n.registerTitle,
                    style: textTheme.displaySmall?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(height: uiConstants.spacing2),
                Text(
                  l10n.registerSubtitle,
                  style: textTheme.bodyLarge?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                SizedBox(height: uiConstants.spacing6),
                GlassmorphismContainer(
                  variant: GlassSurfaceVariant.elevated,
                  padding: EdgeInsets.all(uiConstants.spacing6),
                  child: Column(
                    children: [
                      GlassInput(
                        controller: _nameController,
                        hintText: l10n.nameValue,
                        labelText: l10n.labelName,
                        enabled: !isLoading,
                        height: uiConstants.glassInputHeightMedium,
                        borderRadius: uiConstants.glassInputBorderRadius,
                        contentPadding: uiConstants.glassInputContentPadding,
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return l10n.errorRequiredField;
                          }
                          return null;
                        },
                        prefixIcon: const Icon(Icons.person_outline),
                      ),
                      SizedBox(height: uiConstants.spacing4),
                      GlassInput(
                        controller: _emailController,
                        hintText: 'email@example.com',
                        labelText: l10n.labelEmail,
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
                        enabled: !isLoading,
                        height: uiConstants.glassInputHeightMedium,
                        borderRadius: uiConstants.glassInputBorderRadius,
                        contentPadding: uiConstants.glassInputContentPadding,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        autofillHints: const [AutofillHints.newPassword],
                        textInputAction: TextInputAction.done,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return l10n.errorRequiredField;
                          }
                          if (value.length < 6) {
                            return l10n.errorPasswordTooShort;
                          }
                          return null;
                        },
                        onSubmitted: (_) => _handleSubmit(),
                        prefixIcon: const Icon(Icons.lock_outline),
                      ),
                      if (_submissionError != null) ...[
                        SizedBox(height: uiConstants.spacing3),
                        Text(
                          _submissionError!,
                          style: textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.error,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                      SizedBox(height: uiConstants.spacing6),
                      CustomCTAButton(
                        label: l10n.register,
                        onPressed: isLoading ? null : _handleSubmit,
                        isLoading: isLoading,
                        variant: ButtonVariant.glass,
                      ),
                      SizedBox(height: uiConstants.spacing2),
                      TextButton(
                        onPressed: isLoading
                            ? null
                            : () => context.go(Routes.login),
                        child: Text(l10n.registerPageLoginCta),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
