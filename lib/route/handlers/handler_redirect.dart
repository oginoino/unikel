import '../../utils/imports/common_libs.dart';

class HandleRedirect {
  String? get initialDeeplink => _initialDeeplink;
  String? _initialDeeplink;

  String? handleRedirect(BuildContext context, GoRouterState state) {
    _initialDeeplink ??= state.uri.toString();

    final onboardingProvider = context.read<OnboardingProvider>();
    final isOnboardingComplete = onboardingProvider.isOnboardingComplete;
    final isFirstAccessComplete = onboardingProvider.isFirstAccessComplete;
    final path = state.uri.path;

    if (!isOnboardingComplete) {
      if (path != Routes.onboarding) {
        return Routes.onboarding;
      }
      return null;
    }

    if (!isFirstAccessComplete) {
      if (path != Routes.firstAccessCtaToRegister) {
        return Routes.firstAccessCtaToRegister;
      }
      return null;
    }

    if (path == Routes.firstAccessCtaToRegister || path == Routes.onboarding) {
      return Routes.home;
    }

    return null;
  }
}
