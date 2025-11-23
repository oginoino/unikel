import 'package:flutter/material.dart';
import 'package:glassy/view/component/glass_bottom_bar.dart';
import 'package:glassy/view/page/glass_fragments.dart';
import 'package:glassy/view/page/glass_flow.dart';
import 'package:glassy/view/page/glass_profile.dart';

class GlassScaffold extends StatefulWidget {
  const GlassScaffold({super.key});

  @override
  State<GlassScaffold> createState() => _GlassScaffoldState();
}

class _GlassScaffoldState extends State<GlassScaffold> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    GlassFlow(),
    GlassFragments(),
    GlassProfile(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, // Important for the floating glass bar
      body: IndexedStack(index: _currentIndex, children: _pages),
      bottomNavigationBar: GlassBottomBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
      ),
    );
  }
}
