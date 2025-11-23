import 'package:flutter/material.dart';
import 'package:glassy/model/glass_collection.dart';
import 'package:glassy/view/component/ui/glassmorphism/glass_container.dart';
import 'package:glassy/view/theme/glass_theme_extention.dart';

class GlassCollectionCard extends StatelessWidget {
  final GlassCollection collection;
  final VoidCallback? onTap;

  const GlassCollectionCard({super.key, required this.collection, this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          // Stack effect (cards behind)
          if (collection.posts.length > 1)
            Positioned(
              top: 4,
              left: 4,
              right: 4,
              bottom: 0,
              child: GlassmorphismContainer(
                variant: GlassSurfaceVariant.surface,
                borderRadius: BorderRadius.circular(20),
                blurAmount: 2,
                child: Container(
                  color: theme.colorScheme.surface.withValues(alpha: 0.1),
                ),
              ),
            ),

          // Main Card
          GlassmorphismContainer(
            variant: GlassSurfaceVariant.elevated,
            borderRadius: BorderRadius.circular(20),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Icon / Cover
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    collection.isPrivate
                        ? Icons.lock_outline_rounded
                        : Icons.folder_open_rounded,
                    color: theme.colorScheme.primary,
                    size: 20,
                  ),
                ),
                const Spacer(),

                // Title
                Text(
                  collection.title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),

                // Description
                Text(
                  collection.description,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 12),

                // Footer (Count)
                Row(
                  children: [
                    Text(
                      '${collection.posts.length} items',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: theme.colorScheme.onSurface.withValues(
                          alpha: 0.5,
                        ),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
