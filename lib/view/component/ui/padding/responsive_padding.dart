import '../../../../utils/imports/common_libs.dart';

class ResponsivePadding extends StatelessWidget {
  const ResponsivePadding({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).orientation == Orientation.landscape
          ? EdgeInsets.symmetric(horizontal: uiConstants.spacing24)
          : EdgeInsets.symmetric(horizontal: uiConstants.spacing4),
      child: child,
    );
  }
}
