import 'dart:math' as math;

import '../../utils/imports/common_libs.dart';

class OnboardingHero extends StatelessWidget {
  const OnboardingHero({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.3,
      child: Stack(
        children: [
          Positioned(
            top: MediaQuery.sizeOf(context).height * 0.05 * (0.5),
            left: MediaQuery.sizeOf(context).width * 0.6 * (0.9),
            child: Transform.rotate(
              angle: 0.5 * math.pi,
              child: Image.asset(
                'assets/images/3dicons-dollar-dynamic-color.png',
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
                'assets/images/3dicons-dollar-iso-color.png',
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
                'assets/images/3dicons-dollar-front-color.png',
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
                'assets/images/3dicons-dollar-dynamic-color.png',
                width: 60,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
