import 'package:glassy/view/theme/glass_theme_extention.dart';

import '../../../../utils/imports/common_libs.dart';
import '../glassmorphism/glass_container.dart';

class GlassmorphismNavigationBar extends StatelessWidget {
  const GlassmorphismNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    this.items = const [],
    this.blurAmount,
    this.glassBackgroundColor,
    this.glassBorderColor,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;
  final List<BottomNavigationBarItem> items;
  final double? blurAmount;
  final Color? glassBackgroundColor;
  final Color? glassBorderColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GlassmorphismContainer(
      variant: GlassSurfaceVariant.navigation,
      borderRadius: BorderRadius.circular(uiConstants.radius12),
      blurAmount: blurAmount,
      backgroundColor: glassBackgroundColor,
      margin: EdgeInsets.all(uiConstants.spacing4),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(uiConstants.radius12),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: onTap,
          items: items,
          backgroundColor: Colors.transparent,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: theme.colorScheme.primary,
          unselectedItemColor: theme.colorScheme.onSurface.withValues(
            alpha: 0.6,
          ),
          enableFeedback: true,
          selectedLabelStyle: theme.textTheme.labelSmall?.copyWith(
            fontWeight: FontWeight.w600,
          ),
          unselectedLabelStyle: theme.textTheme.labelSmall,
        ),
      ),
    );
  }
}
