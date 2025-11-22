import '../../../../utils/imports/common_libs.dart';
import '../glassmorphism/glass_container.dart';

class GlassmorphismFloatingActionButton extends StatelessWidget {
  const GlassmorphismFloatingActionButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.tooltip,
    this.blurAmount,
    this.glassBackgroundColor,
    this.glassBorderColor,
    this.size = 56.0,
  });

  final VoidCallback? onPressed;
  final Widget child;
  final String? tooltip;
  final double? blurAmount;
  final Color? glassBackgroundColor;
  final Color? glassBorderColor;
  final double size;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GlassmorphismContainer(
      borderRadius: BorderRadius.circular(size / 2),
      width: size,
      height: size,
      blurAmount: blurAmount,
      backgroundColor: glassBackgroundColor,
      child: Material(
        color: Colors.transparent,
        shape: const CircleBorder(),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onPressed,
          child: Container(
            width: size,
            height: size,
            alignment: Alignment.center,
            child: IconTheme(
              data: IconThemeData(color: theme.colorScheme.primary, size: 24.0),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
