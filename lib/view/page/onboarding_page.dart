import '../../utils/imports/common_libs.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: uiConstants.spacing4),
      child: Center(
        child: FilledButton.icon(
          iconAlignment: IconAlignment.end,
          icon: Icon(Icons.arrow_forward_ios_rounded),
          label: Text('Next'),
          onPressed: () {
            context.read<OnboardingProvider>().setOnboardingComplete(true);
            context.go(Routes.home);
          },
        ),
      ),
    );
  }
}
