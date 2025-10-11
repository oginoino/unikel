import '../../providers/onboarding_provider.dart';
import '../../utils/imports/common_libs.dart';

class HandleRedirect {
  String? get initialDeeplink => _initialDeeplink;
  String? _initialDeeplink;

  String? handleRedirect(BuildContext context, GoRouterState state) {
    _initialDeeplink ??= state.uri.toString();

    return _redirectBasedOnState(state, context);
  }

  String? _redirectBasedOnState(GoRouterState state, BuildContext context) {
    return _redirectToOnboardingIfNeeded(context, state);
  }

  String? _redirectToOnboardingIfNeeded(BuildContext context, GoRouterState state) {
    final isOnboardingComplete = context
        .read<OnboardingProvider>()
        .isOnboardingComplete;
    final path = state.uri.path;
    if (!isOnboardingComplete && path != Routes.onboarding) {
      return Routes.onboarding;
    }
    if (isOnboardingComplete && path == Routes.onboarding) {
      return Routes.home;
    }
    return null;
  }
}
