import '../utils/imports/common_libs.dart';
import '../view/page/first_access_cta_to_register_page.dart';
import '../view/page/onboarding_page.dart';
import '../view/page/register_user_page.dart';
import '../view/page/profile_page.dart';
import '../view/page/login_page.dart';

final GoRouter appRouter = GoRouter(
  redirect: HandleRedirect().handleRedirect,
  observers: [],
  routes: [
    ShellRoute(
      builder: (context, state, widget) {
        return ScaffoldSliver(
          state: state,
          child: widget,
        );
      },
      routes: [
        AppRoute(Routes.home, (state) => HomePage()),
        AppRoute(Routes.onboarding, (state) => OnboardingPage()),
        AppRoute(
          Routes.firstAccessCtaToRegister,
          (state) => FirstAccessCtaToRegisterPage(),
        ),
        AppRoute(Routes.registerUser, (state) => RegisterUserPage()),
        AppRoute(Routes.profile, (state) => ProfilePage()),
        AppRoute(Routes.login, (state) => LoginPage()),
      ],
    ),
  ],
);
