import '../../utils/imports/common_libs.dart';
import '../component/ui/button/custom_button.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: uiConstants.spacing4),
      child: Center(
        child: CustomButton(
          variant: ButtonVariant.secondary,
          iconAlignment: IconAlignment.end,
          icon: Icon(Icons.arrow_forward_ios_rounded),
          label: context.l10n.proceed,
          onPressed: () {
            context.read<OnboardingProvider>().setOnboardingComplete(true);
            context.go(Routes.home);
          },
        ),
      ),
    );
  }
}
