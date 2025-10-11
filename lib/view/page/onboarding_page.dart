import '../../utils/imports/common_libs.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FilledButton(
        onPressed: () {
          context.read<OnboardingProvider>().setOnboardingComplete(true);
          context.go(Routes.home);
        },
        child: Text('Next'),
      ),
    );
  }
}
