import '../../utils/imports/common_libs.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.symmetric(vertical: uiConstants.spacing8),
            sliver: OnboardingHero(),
          ),
        ],
      ),
    );
  }
}
