import 'package:flutter/material.dart';
import 'package:glassy/model/glass_collection.dart';
import 'package:glassy/model/glassy_post.dart';
import 'package:glassy/view/component/glass_collection_card.dart';
import 'package:glassy/view/page/glass_collection_detail.dart';

class GlassCollections extends StatefulWidget {
  const GlassCollections({super.key});

  @override
  State<GlassCollections> createState() => _GlassCollectionsState();
}

class _GlassCollectionsState extends State<GlassCollections> {
  // Dummy data
  final List<GlassCollection> _collections = [
    GlassCollection(
      id: '1',
      title: 'Design Inspiration',
      description: 'UI/UX patterns, color palettes, and typography ideas.',
      posts: [
        GlassyPost(
          id: '1',
          authorName: 'Elena Fisher',
          authorHandle: 'elena_writes',
          content: 'Glassmorphism is back!',
          timestamp: DateTime.now(),
        ),
        GlassyPost(
          id: '2',
          authorName: 'Elena Fisher',
          authorHandle: 'elena_writes',
          content: 'Check out this gradient.',
          timestamp: DateTime.now(),
        ),
      ],
    ),
    GlassCollection(
      id: '2',
      title: 'Reading List',
      description: 'Books and articles to read later.',
      isPrivate: true,
      posts: [],
    ),
    GlassCollection(
      id: '3',
      title: 'Project Alpha',
      description: 'Ideas and notes for the new startup.',
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
  ];

  void _openCollection(GlassCollection collection) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => GlassCollectionDetail(collection: collection),
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
              'Collections',
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
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
                final collection = _collections[index];
                return GlassCollectionCard(
                  collection: collection,
                  onTap: () => _openCollection(collection),
                );
              }, childCount: _collections.length),
            ),
          ),
          // Bottom padding for the floating bar
          const SliverPadding(padding: EdgeInsets.only(bottom: 80)),
        ],
      ),
    );
  }
}
