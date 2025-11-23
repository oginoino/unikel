import 'package:flutter/material.dart';
import 'package:glassy/view/component/ui/glassmorphism/glass_container.dart';
import 'package:glassy/view/theme/glass_theme_extention.dart';

class GlassBottomBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const GlassBottomBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
      child: GlassmorphismContainer(
        variant: GlassSurfaceVariant.navigation,
        borderRadius: BorderRadius.circular(32),
        height: 64,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _NavBarItem(
              icon: Icons.stream_rounded,
              label: 'Flow',
              isSelected: currentIndex == 0,
              onTap: () => onTap(0),
            ),
            _NavBarItem(
              icon: Icons.tag_rounded,
              label: 'Fragments',
              isSelected: currentIndex == 1,
              onTap: () => onTap(1),
            ),
            _NavBarItem(
              icon: Icons.person_outline_rounded,
              label: 'Profile',
              isSelected: currentIndex == 2,
              onTap: () => onTap(2),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavBarItem({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = isSelected
        ? theme.colorScheme.primary
        : theme.colorScheme.onSurface.withValues(alpha: 0.5);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color, size: 24),
            if (isSelected) ...[
              const SizedBox(height: 4),
              Container(
                width: 4,
                height: 4,
                decoration: BoxDecoration(color: color, shape: BoxShape.circle),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
