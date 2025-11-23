import 'package:flutter/material.dart';
import 'package:glassy/model/glassy_post.dart';
import 'package:glassy/view/component/ui/glassmorphism/glass_container.dart';
import 'package:glassy/view/theme/glass_theme_extention.dart';
import 'package:intl/intl.dart';

class GlassImmersivePost extends StatelessWidget {
  final GlassyPost post;
  final VoidCallback onApplause;
  final VoidCallback onRecommend;
  final VoidCallback onComments;

  const GlassImmersivePost({
    super.key,
    required this.post,
    required this.onApplause,
    required this.onRecommend,
    required this.onComments,
  });

  String _formatTimestamp(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inMinutes < 1) {
      return 'Just now';
    } else if (difference.inHours < 1) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h ago';
    } else {
      return DateFormat('MMM d').format(timestamp);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Stack(
      fit: StackFit.expand,
      children: [
        // Background (Gradient or Image placeholder)
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                theme.colorScheme.primary.withValues(alpha: 0.1),
                theme.colorScheme.secondary.withValues(alpha: 0.1),
              ],
            ),
          ),
        ),

        // Content Area (Bottom Aligned)
        Positioned(
          left: 16,
          right: 80, // Leave space for actions
          bottom: 100, // Leave space for bottom bar
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Author Info
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
                            style: theme.textTheme.labelLarge?.copyWith(
                              color: theme.colorScheme.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        : null,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    post.authorName,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    _formatTimestamp(post.timestamp),
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Post Content
              GlassmorphismContainer(
                variant: GlassSurfaceVariant.surface,
                borderRadius: BorderRadius.circular(16),
                padding: const EdgeInsets.all(16),
                child: Text(
                  post.content,
                  style: theme.textTheme.bodyLarge?.copyWith(height: 1.5),
                ),
              ),
            ],
          ),
        ),

        // Right Action Bar
        Positioned(
          right: 16,
          bottom: 100,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _ActionButton(
                icon: Icons.back_hand_rounded,
                label: '${post.applauseCount}',
                isActive: post.isApplauded,
                onTap: onApplause,
              ),
              const SizedBox(height: 24),
              _ActionButton(
                icon: Icons.chat_bubble_outline_rounded,
                label: 'Chat', // Placeholder for comment count
                onTap: onComments,
              ),
              const SizedBox(height: 24),
              _ActionButton(
                icon: Icons.auto_awesome_rounded,
                label: '${post.recommendCount}',
                isActive: post.isRecommended,
                onTap: onRecommend,
              ),
              const SizedBox(height: 24),
              _ActionButton(
                icon: Icons.share_outlined,
                label: 'Share',
                onTap: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _ActionButton({
    required this.icon,
    required this.label,
    this.isActive = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = isActive
        ? theme.colorScheme.primary
        : theme.colorScheme.onSurface.withValues(alpha: 0.8);

    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          GlassmorphismContainer(
            variant: GlassSurfaceVariant.control,
            borderRadius: BorderRadius.circular(24),
            width: 48,
            height: 48,
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: theme.textTheme.labelSmall?.copyWith(
              color: theme.colorScheme.onSurface,
              fontWeight: FontWeight.w600,
              shadows: [
                Shadow(
                  color: Colors.black.withValues(alpha: 0.5),
                  blurRadius: 4,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
