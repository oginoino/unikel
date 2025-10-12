import 'dart:async';
import 'dart:math' as math;

import '../../../../utils/imports/common_libs.dart';
import '../../../../utils/constants/image_paths.dart';
import '../page_indicator/page_indicator.dart';

class OnboardingHero extends StatefulWidget {
  const OnboardingHero({super.key});

  @override
  State<OnboardingHero> createState() => _OnboardingHeroState();
}

class _OnboardingHeroState extends State<OnboardingHero> {
  final PageController _pageController = PageController();
  Timer? _timer;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: uiConstants.animationDurationDefault),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> onboardingData = [
      {
        'image': ImagePaths.dollarDynamicColor,
        'text': context.l10n.onboarding_subtitle_1,
      },
      {
        'image': ImagePaths.dollarIsoColor,
        'text': context.l10n.onboarding_subtitle_2,
      },
      {
        'image': ImagePaths.dollarFrontColor,
        'text': context.l10n.onboarding_subtitle_3,
      },
    ];

    return Column(
      spacing: uiConstants.spacing16,
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.3,
          child: PageView.builder(
            controller: _pageController,
            itemCount: onboardingData.length,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemBuilder: (BuildContext context, int index) {
              return Stack(
                children: [
                  Positioned(
                    top: MediaQuery.sizeOf(context).height * 0.05 * (0.5),
                    left: MediaQuery.sizeOf(context).width * 0.6 * (0.9),
                    child: Transform.rotate(
                      angle: 0.5 * math.pi,
                      child: Image.asset(
                        onboardingData[index]['image']!,
                        width: 100,
                      ),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.sizeOf(context).height * 0.2 * (0.8),
                    right: MediaQuery.sizeOf(context).width * 0.1 * (0.2),
                    child: Transform.rotate(
                      angle: 0.5 * math.pi,
                      child: Image.asset(
                        onboardingData[index]['image']!,
                        width: 120,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: MediaQuery.sizeOf(context).height * 0.2 * (0.3),
                    left: MediaQuery.sizeOf(context).width * 0.5 * (0.6),
                    child: Transform.rotate(
                      angle: 0.8 * math.pi,
                      child: Image.asset(
                        onboardingData[index]['image']!,
                        width: 80,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: MediaQuery.sizeOf(context).height * 0.2 * (0.6),
                    left: MediaQuery.sizeOf(context).width * 0.1 * (0.6),
                    child: Transform.rotate(
                      angle: 0.3 * math.pi,
                      child: Image.asset(
                        onboardingData[index]['image']!,
                        width: 60,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),

        Text(
          onboardingData[_currentPage]['text']!,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        PageIndicator(
          currentPage: _currentPage,
          itemCount: onboardingData.length,
        ),
      ],
    );
  }
}
