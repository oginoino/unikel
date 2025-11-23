import 'package:flutter/material.dart';

import 'package:glassy/model/glassy_post.dart';
import 'package:glassy/view/component/glass_comments_sheet.dart';
import 'package:glassy/view/component/glass_immersive_post.dart';
import 'package:glassy/view/component/glass_post_card.dart';

class GlassFlow extends StatefulWidget {
  const GlassFlow({super.key});

  @override
  State<GlassFlow> createState() => _GlassFlowState();
}

class _GlassFlowState extends State<GlassFlow> {
  // Dummy Data
  final List<GlassyPost> _posts = [
    GlassyPost(
      id: '1',
      authorName: 'Elena Fisher',
      authorHandle: 'elena_writes',
      authorAvatarUrl: null, // Use initial
      content:
          'Just discovered this amazing new glassmorphism library for Flutter! The blur effects are incredibly smooth and performant. #Flutter #UI #Design',
      timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
      applauseCount: 12,
      recommendCount: 3,
    ),
    GlassyPost(
      id: '2',
      authorName: 'Alex Creator',
      authorHandle: 'alex_builds',
      authorAvatarUrl: null,
      content:
          'Working on the new "Fragments" feature. It\'s going to change how we organize content. Stay tuned! 🚀',
      timestamp: DateTime.now().subtract(const Duration(hours: 2)),
      applauseCount: 45,
      recommendCount: 8,
      isApplauded: true,
    ),
    GlassyPost(
      id: '3',
      authorName: 'Design Daily',
      authorHandle: 'designdaily',
      authorAvatarUrl: null,
      content:
          'Minimalism isn\'t about removing things you love. It\'s about removing the things that distract you from the things you love.',
      timestamp: DateTime.now().subtract(const Duration(days: 1)),
      applauseCount: 890,
      recommendCount: 120,
    ),
  ];

  bool _isImmersive = true;

  void _handleApplause(String postId) {
    setState(() {
      final index = _posts.indexWhere((p) => p.id == postId);
      if (index != -1) {
        final post = _posts[index];
        _posts[index] = post.copyWith(
          applauseCount: post.applauseCount + (post.isApplauded ? -1 : 1),
          isApplauded: !post.isApplauded,
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
          recommendCount: post.recommendCount + (post.isRecommended ? -1 : 1),
          isRecommended: !post.isRecommended,
        );
      }
    });
  }

  void _showComments(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'Comments',
      barrierColor: Colors.black54,
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) {
        return Align(
          alignment: Alignment.centerRight,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.85,
            height: double.infinity,
            child: const GlassCommentsSheet(),
          ),
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
              .animate(
                CurvedAnimation(parent: animation, curve: Curves.easeOutCubic),
              ),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      extendBodyBehindAppBar: _isImmersive,
      appBar: AppBar(
        backgroundColor: _isImmersive ? Colors.transparent : null,
        elevation: 0,
        title: Text(
          'The Flow',
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: _isImmersive ? Colors.white : null,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              _isImmersive
                  ? Icons.view_agenda_outlined
                  : Icons.view_stream_rounded,
              color: _isImmersive ? Colors.white : null,
            ),
            onPressed: () {
              setState(() {
                _isImmersive = !_isImmersive;
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.search, color: _isImmersive ? Colors.white : null),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: _isImmersive ? _buildImmersiveView() : _buildListView(),
    );
  }

  Widget _buildImmersiveView() {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      itemCount: _posts.length,
      itemBuilder: (context, index) {
        final post = _posts[index];
        return GestureDetector(
          onHorizontalDragEnd: (details) {
            if (details.primaryVelocity! < 0) {
              // Swipe Left -> Show Comments
              _showComments(context);
            }
          },
          child: GlassImmersivePost(
            post: post,
            onApplause: () => _handleApplause(post.id),
            onRecommend: () => _handleRecommend(post.id),
            onComments: () => _showComments(context),
          ),
        );
      },
    );
  }

  Widget _buildListView() {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.only(bottom: 80),
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
    );
  }
}
