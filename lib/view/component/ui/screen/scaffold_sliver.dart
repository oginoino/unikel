import '../../../../utils/imports/common_libs.dart';

class ScaffoldSliver extends StatelessWidget {
  const ScaffoldSliver({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomSliverAppBar(),

          const SliverToBoxAdapter(),
          SliverFillRemaining(child: child),
        ],
      ),
    );
  }
}
