import 'package:flutter/material.dart';
import 'package:glassy/model/glass_collection.dart';
import 'package:glassy/model/glassy_post.dart';
import 'package:glassy/view/component/glass_collection_card.dart';
import 'package:glassy/view/component/glass_post_card.dart';
import 'package:glassy/view/component/glass_profile_header.dart';
import 'package:glassy/view/page/glass_settings.dart';

class GlassProfile extends StatefulWidget {
  const GlassProfile({super.key});

  @override
  State<GlassProfile> createState() => _GlassProfileState();
}

class _GlassProfileState extends State<GlassProfile>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // Dummy Data
  final _posts = [
    GlassyPost(
      id: '3',
      authorName: 'Me',
      authorHandle: 'me',
      content: 'Building something new with Flutter and Glassmorphism. 🚀',
      timestamp: DateTime.now().subtract(const Duration(days: 1)),
      applauseCount: 42,
      recommendCount: 5,
    ),
    GlassyPost(
      id: '4',
      authorName: 'Me',
      authorHandle: 'me',
      content: 'Focus is the new IQ.',
      timestamp: DateTime.now().subtract(const Duration(days: 3)),
      applauseCount: 128,
      recommendCount: 20,
    ),
  ];

  final _collections = [
    GlassCollection(
      id: '3',
      title: 'Project Alpha',
      description: 'Ideas and notes for the new startup.',
      posts: [],
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _openSettings() {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => const GlassSettings()));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(
              child: GlassProfileHeader(
                name: 'Alex Creator',
                handle: 'alex_builds',
                bio:
                    'Digital craftsman. Obsessed with UI/UX and clean code. Building the future of social.',
                postsCount: 42,
                applauseCount: 1500,
                followingCount: 250,
                followersCount: 1200,
                onSettings: _openSettings,
                onEditProfile: () {},
              ),
            ),
            SliverPersistentHeader(
              delegate: _SliverAppBarDelegate(
                TabBar(
                  controller: _tabController,
                  labelColor: theme.colorScheme.primary,
                  unselectedLabelColor: theme.colorScheme.onSurface.withValues(
                    alpha: 0.5,
                  ),
                  indicatorColor: theme.colorScheme.primary,
                  tabs: const [
                    Tab(text: 'My Glassies'),
                    Tab(text: 'Collections'),
                  ],
                ),
              ),
              pinned: true,
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: [
            // Posts Tab
            ListView.builder(
              padding: const EdgeInsets.fromLTRB(0, 16, 0, 100),
              itemCount: _posts.length,
              itemBuilder: (context, index) {
                return GlassPostCard(post: _posts[index]);
              },
            ),

            // Collections Tab
            GridView.builder(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.85,
              ),
              itemCount: _collections.length,
              itemBuilder: (context, index) {
                return GlassCollectionCard(collection: _collections[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;

  _SliverAppBarDelegate(this._tabBar);

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final theme = Theme.of(context);
    return Container(color: theme.colorScheme.surface, child: _tabBar);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
