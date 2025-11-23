import 'package:flutter/material.dart';
import 'package:glassy/model/glass_fragment.dart';
import 'package:glassy/view/component/glass_post_card.dart';
import 'package:go_router/go_router.dart';

class GlassFragmentDetail extends StatelessWidget {
  final GlassFragment fragment;

  const GlassFragmentDetail({super.key, required this.fragment});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: theme.colorScheme.surface.withValues(alpha: 0.8),
            pinned: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => context.pop(),
            ),
            title: Row(
              children: [
                Icon(
                  Icons.tag_rounded,
                  size: 20,
                  color: theme.colorScheme.tertiary,
                ),
                const SizedBox(width: 8),
                Text(
                  fragment.title,
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            actions: [
              FilledButton.tonal(
                onPressed: () {}, // TODO: Implement Join/Follow
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  minimumSize: const Size(0, 32),
                ),
                child: const Text('Join'),
              ),
              const SizedBox(width: 8),
              IconButton(icon: const Icon(Icons.more_horiz), onPressed: () {}),
              const SizedBox(width: 8),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    fragment.description,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      _StatBadge(
                        icon: Icons.people_outline,
                        label: '${fragment.subscriberCount} subscribers',
                      ),
                      const SizedBox(width: 16),
                      _StatBadge(
                        icon: Icons.article_outlined,
                        label: '${fragment.posts.length} posts',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          if (fragment.posts.isEmpty)
            SliverFillRemaining(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.chat_bubble_outline_rounded,
                      size: 48,
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.3),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'No posts yet',
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: theme.colorScheme.onSurface.withValues(
                          alpha: 0.5,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Be the first to post in this fragment.',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurface.withValues(
                          alpha: 0.4,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          else
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                final post = fragment.posts[index];
                return GlassPostCard(
                  post: post,
                  onApplause: () {},
                  onRecommend: () {},
                );
              }, childCount: fragment.posts.length),
            ),
        ],
      ),
    );
  }
}

class _StatBadge extends StatelessWidget {
  final IconData icon;
  final String label;

  const _StatBadge({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Icon(
          icon,
          size: 16,
          color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
        ),
        const SizedBox(width: 4),
        Text(
          label,
          style: theme.textTheme.labelSmall?.copyWith(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
