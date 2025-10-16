import '../../../../utils/imports/common_libs.dart';


class CtaToRegisterScreen extends StatelessWidget {
  const CtaToRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ResponsivePadding(
        child: Column(
          spacing: uiConstants.spacing4,
          children: [
            SizedBox(height: uiConstants.spacing4),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.5,
              child: Text(
                context.l10n.cta_to_register_screen_text,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),

            CustomCTAButton(
              variant: ButtonVariant.primary,
              label: context.l10n.register,
              onPressed: () {
                context.read<OnboardingProvider>().setFirstAccessComplete(true);
                context.go(Routes.registerUser);
              },
            ),
            CustomCTAButton(
              variant: ButtonVariant.secondary,
              label: context.l10n.login,
              onPressed: () {
                // context.go(Routes.login);
              },
            ),
          ],
        ),
      ),
    );
  }
}
