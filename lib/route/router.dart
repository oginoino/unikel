import '../utils/imports/common_libs.dart';
import '../view/page/onboarding_page.dart';

final GoRouter appRouter = GoRouter(
  redirect: HandleRedirect().handleRedirect,
  observers: [],
  routes: [
    ShellRoute(
      builder: (context, router, widget) {
        return ScaffoldSliver(child: widget);
      },
      routes: [
        AppRoute(Routes.home, (state) => HomePage()),
        AppRoute(Routes.onboarding, (state) => OnboardingPage()),
      ],
    ),
  ],
);
