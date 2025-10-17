import '../../../../utils/imports/common_libs.dart';

class ScaffoldSliver extends StatelessWidget {
  const ScaffoldSliver({
    super.key,
    required this.child,
    required this.state,
  });

  final Widget child;
  final GoRouterState state;

  bool get _isAuthenticatedRoute {
    final location = state.matchedLocation;
    return location == Routes.home || location == Routes.profile;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomSliverAppBar(
            showAuthenticatedActions: _isAuthenticatedRoute,
            isProfileRoute: state.matchedLocation == Routes.profile,
          ),
          const SliverToBoxAdapter(),
          SliverFillRemaining(child: child),
        ],
      ),
    );
  }
}
