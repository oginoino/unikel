import 'package:flutter/material.dart';
import 'package:glassy/model/glass_fragment.dart';
import 'package:glassy/model/glassy_post.dart';
import 'package:glassy/view/component/glass_fragment_card.dart';
import 'package:glassy/view/page/glass_fragment_detail.dart';

class GlassFragments extends StatefulWidget {
  const GlassFragments({super.key});

  @override
  State<GlassFragments> createState() => _GlassFragmentsState();
}

class _GlassFragmentsState extends State<GlassFragments> {
  // Dummy data
  final List<GlassFragment> _fragments = [
    GlassFragment(
      id: '1',
      title: 'Design Systems',
      description:
          'Discussions about UI kits, tokens, and component libraries.',
      subscriberCount: 1240,
      posts: [
        GlassyPost(
          id: '1',
          authorName: 'Elena Fisher',
          authorHandle: 'elena_writes',
          content: 'Glassmorphism is back!',
          timestamp: DateTime.now(),
        ),
      ],
    ),
    GlassFragment(
      id: '2',
      title: 'Flutter Devs',
      description: 'Everything Flutter. Tips, tricks, and showcases.',
      subscriberCount: 5600,
      posts: [],
    ),
    GlassFragment(
      id: '3',
      title: 'Startup Ideas',
      description: 'Brainstorming the next big thing.',
      isPrivate: true,
      subscriberCount: 12,
      posts: [
        GlassyPost(
          id: '3',
          authorName: 'Me',
          authorHandle: 'me',
          content: 'MVP features list.',
          timestamp: DateTime.now(),
        ),
      ],
    ),
    GlassFragment(
      id: '4',
      title: 'Random',
      description: 'Off-topic chatter.',
      subscriberCount: 89,
      posts: [],
    ),
  ];

  void _openFragment(GlassFragment fragment) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => GlassFragmentDetail(fragment: fragment),
      ),
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
              'Fragments',
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              IconButton(icon: const Icon(Icons.search), onPressed: () {}),
              IconButton(icon: const Icon(Icons.add), onPressed: () {}),
              const SizedBox(width: 16),
            ],
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.85,
              ),
              delegate: SliverChildBuilderDelegate((context, index) {
                final fragment = _fragments[index];
                return GlassFragmentCard(
                  fragment: fragment,
                  onTap: () => _openFragment(fragment),
                );
              }, childCount: _fragments.length),
            ),
          ),
          // Bottom padding for the floating bar
          const SliverPadding(padding: EdgeInsets.only(bottom: 80)),
        ],
      ),
    );
  }
}
