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

    // 1. Handle onboarding redirection
    if (!isOnboardingComplete) {
      if (path != Routes.onboarding) {
        return Routes.onboarding;
      }
      // If onboarding is not complete and we are on the onboarding page, stay there.
      return null;
    }

    // 2. Handle first access redirection (only if onboarding is complete)
    if (!isFirstAccessComplete) {
      if (path != Routes.firstAccessCtaToRegister) {
        return Routes.firstAccessCtaToRegister;
      }
      // If first access is not complete and we are on the first access page, stay there.
      return null;
    }

    // 3. If both are complete, and user is on first access or onboarding page, redirect to home
    if (path == Routes.firstAccessCtaToRegister || path == Routes.onboarding) {
      return Routes.home;
    }

    // No redirection needed
    return null;
  }
}
