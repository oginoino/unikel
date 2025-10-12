import '../../../../utils/imports/common_libs.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator({
    super.key,
    required this.currentPage,
    required this.itemCount,
  });

  final int currentPage;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        itemCount,
        (index) => AnimatedContainer(
          duration: Duration(
            milliseconds: uiConstants.animationDurationDefault,
          ),
          curve: Curves.easeInOut,
          margin: EdgeInsets.symmetric(horizontal: uiConstants.spacing1),
          height: uiConstants.spacing2,
          width: currentPage == index
              ? uiConstants.spacing6
              : uiConstants.spacing2,
          decoration: BoxDecoration(
            color: currentPage == index
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.primary.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(uiConstants.radius4),
          ),
        ),
      ),
    );
  }
}
