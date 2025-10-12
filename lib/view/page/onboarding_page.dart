import '../../utils/imports/common_libs.dart';
import '../component/ui/button/custom_cta_button.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: uiConstants.spacing8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          OnboardingHero(),
          Center(
            child: CustomCTAButton(
              variant: ButtonVariant.primary,
              iconAlignment: IconAlignment.end,
              icon: Icon(Icons.arrow_forward_ios_rounded),
              label: context.l10n.proceed,
              onPressed: () {
                context.read<OnboardingProvider>().setOnboardingComplete(true);
                context.go(Routes.home);
              },
            ),
          ),
        ],
      ),
    );
  }
}
