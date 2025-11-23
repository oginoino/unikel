import 'package:flutter/material.dart';
import 'package:glassy/components/glass_editor.dart';
import 'package:glassy/model/glassy_post.dart';
import 'package:glassy/view/component/glass_post_card.dart';
import 'package:glassy/view/component/ui/glassmorphism/glass_container.dart';
import 'package:glassy/view/theme/glass_theme_extention.dart';

class GlassFlow extends StatefulWidget {
  const GlassFlow({super.key});

  @override
  State<GlassFlow> createState() => _GlassFlowState();
}

class _GlassFlowState extends State<GlassFlow> {
  // Dummy data for initial display
  final List<GlassyPost> _posts = [
    GlassyPost(
      id: '1',
      authorName: 'Elena Fisher',
      authorHandle: 'elena_writes',
      content:
          'The beauty of glassmorphism isn\'t just in the blur, but in the depth it creates. It feels like looking through a window into another world. 🌿 #Design #UI',
      timestamp: DateTime.now().subtract(const Duration(minutes: 45)),
      applauseCount: 124,
      recommendCount: 12,
      isApplauded: true,
    ),
    GlassyPost(
      id: '2',
      authorName: 'Marcus Chen',
      authorHandle: 'marcus_c',
      content:
          'Just finished reading "The Psychology of Money". A fascinating deep dive into how our emotions shape our financial decisions. Highly recommend it to anyone looking to understand their relationship with wealth.',
      timestamp: DateTime.now().subtract(const Duration(hours: 3)),
      applauseCount: 89,
      recommendCount: 45,
      isRecommended: true,
    ),
    GlassyPost(
      id: '3',
      authorName: 'Sarah Jenkins',
      authorHandle: 'sarah_j',
      content:
          'Sometimes the most productive thing you can do is step away from the screen and take a walk. 🌳🚶‍♀️',
      timestamp: DateTime.now().subtract(const Duration(hours: 5)),
      applauseCount: 256,
      recommendCount: 8,
    ),
  ];

  void _handleApplause(String postId) {
    setState(() {
      final index = _posts.indexWhere((p) => p.id == postId);
      if (index != -1) {
        final post = _posts[index];
        _posts[index] = post.copyWith(
          isApplauded: !post.isApplauded,
          applauseCount: post.isApplauded
              ? post.applauseCount - 1
              : post.applauseCount + 1,
        );
      }
    });
  }

  void _handleRecommend(String postId) {
    setState(() {
      final index = _posts.indexWhere((p) => p.id == postId);
      if (index != -1) {
        final post = _posts[index];
        _posts[index] = post.copyWith(
          isRecommended: !post.isRecommended,
          recommendCount: post.isRecommended
              ? post.recommendCount - 1
              : post.recommendCount + 1,
        );
      }
    });
  }

  void _showEditor(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const _EditorSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            snap: true,
            backgroundColor: theme.colorScheme.surface.withValues(alpha: 0.8),
            title: Text(
              'The Flow',
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: false,
            actions: [
              IconButton(icon: const Icon(Icons.search), onPressed: () {}),
              IconButton(
                icon: const CircleAvatar(
                  radius: 14,
                  backgroundImage: NetworkImage(
                    'https://i.pravatar.cc/150?img=12',
                  ),
                ),
                onPressed: () {},
              ),
              const SizedBox(width: 16),
            ],
          ),
          SliverPadding(
            padding: const EdgeInsets.only(bottom: 80), // Space for FAB
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                final post = _posts[index];
                return GlassPostCard(
                  post: post,
                  onApplause: () => _handleApplause(post.id),
                  onRecommend: () => _handleRecommend(post.id),
                  onTap: () {},
                );
              }, childCount: _posts.length),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showEditor(context),
        label: const Text('New Glassy'),
        icon: const Icon(Icons.edit),
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: theme.colorScheme.onPrimary,
      ),
    );
  }
}

class _EditorSheet extends StatelessWidget {
  const _EditorSheet();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: GlassmorphismContainer(
        variant: GlassSurfaceVariant.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Cancel'),
                  ),
                  FilledButton(
                    onPressed: () {
                      // TODO: Implement post creation
                      Navigator.pop(context);
                    },
                    child: const Text('Post'),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const GlassEditor(
                hintText: "What's on your mind?",
                maxLength: 500,
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
