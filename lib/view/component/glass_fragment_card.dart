import 'package:flutter/material.dart';
import 'package:glassy/model/glass_fragment.dart';
import 'package:glassy/view/component/ui/glassmorphism/glass_container.dart';
import 'package:glassy/view/theme/glass_theme_extention.dart';

class GlassFragmentCard extends StatelessWidget {
  final GlassFragment fragment;
  final VoidCallback? onTap;

  const GlassFragmentCard({super.key, required this.fragment, this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: GlassmorphismContainer(
        variant: GlassSurfaceVariant.elevated,
        borderRadius: BorderRadius.circular(20),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon / Cover
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.tertiary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    fragment.isPrivate
                        ? Icons.lock_outline_rounded
                        : Icons.tag_rounded, // Hashtag for channel feel
                    color: theme.colorScheme.tertiary,
                    size: 20,
                  ),
                ),
                if (fragment.subscriberCount > 0)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surface.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      '${fragment.subscriberCount}',
                      style: theme.textTheme.labelSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.onSurface.withValues(
                          alpha: 0.7,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const Spacer(),

            // Title
            Text(
              fragment.title,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),

            // Description
            Text(
              fragment.description,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 12),

            // Footer (Post Count)
            Row(
              children: [
                Icon(
                  Icons.article_outlined,
                  size: 14,
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
                ),
                const SizedBox(width: 4),
                Text(
                  '${fragment.posts.length} posts',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
