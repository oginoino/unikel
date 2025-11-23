import 'package:flutter/material.dart';
import 'package:glassy/model/glassy_post.dart';
import 'package:glassy/view/component/ui/glassmorphism/glass_container.dart';
import 'package:intl/intl.dart';

class GlassPostCard extends StatelessWidget {
  final GlassyPost post;
  final VoidCallback? onApplause;
  final VoidCallback? onRecommend;
  final VoidCallback? onTap;

  const GlassPostCard({
    super.key,
    required this.post,
    this.onApplause,
    this.onRecommend,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final timeString = _formatTimestamp(post.timestamp);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: GlassmorphismCard(
        onTap: onTap,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header: Author & Time
            Row(
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundColor: theme.colorScheme.primary.withValues(
                    alpha: 0.2,
                  ),
                  backgroundImage: post.authorAvatarUrl != null
                      ? NetworkImage(post.authorAvatarUrl!)
                      : null,
                  child: post.authorAvatarUrl == null
                      ? Text(
                          post.authorName[0].toUpperCase(),
                          style: theme.textTheme.labelMedium?.copyWith(
                            color: theme.colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : null,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        post.authorName,
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '@${post.authorHandle} • $timeString',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurface.withValues(
                            alpha: 0.6,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Content
            Text(
              post.content,
              style: theme.textTheme.bodyLarge?.copyWith(
                height: 1.5,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 20),

            // Interactions
            Row(
              children: [
                _InteractionButton(
                  icon: Icons.back_hand_rounded, // Applause icon
                  count: post.applauseCount,
                  isActive: post.isApplauded,
                  activeColor: theme.colorScheme.primary,
                  onTap: onApplause,
                  label: 'Applause',
                ),
                const SizedBox(width: 24),
                _InteractionButton(
                  icon: Icons.auto_awesome_rounded, // Recommend icon
                  count: post.recommendCount,
                  isActive: post.isRecommended,
                  activeColor: theme.colorScheme.tertiary,
                  onTap: onRecommend,
                  label: 'Recommend',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _formatTimestamp(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h';
    } else {
      return DateFormat('MMM d').format(timestamp);
    }
  }
}

class _InteractionButton extends StatelessWidget {
  final IconData icon;
  final int count;
  final bool isActive;
  final Color activeColor;
  final VoidCallback? onTap;
  final String label;

  const _InteractionButton({
    required this.icon,
    required this.count,
    required this.isActive,
    required this.activeColor,
    required this.onTap,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = isActive
        ? activeColor
        : theme.colorScheme.onSurface.withValues(alpha: 0.5);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
        child: Row(
          children: [
            Icon(icon, size: 20, color: color),
            if (count > 0) ...[
              const SizedBox(width: 6),
              Text(
                '$count',
                style: theme.textTheme.labelMedium?.copyWith(
                  color: color,
                  fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
