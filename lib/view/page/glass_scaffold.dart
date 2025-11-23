import 'package:flutter/material.dart';
import 'package:glassy/view/component/glass_bottom_bar.dart';
import 'package:glassy/view/page/glass_fragments.dart';
import 'package:glassy/view/page/glass_flow.dart';
import 'package:glassy/view/page/glass_profile.dart';

import 'package:glassy/components/glass_editor.dart';

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

  void _showEditor() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: const GlassEditor(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Main Content
          IndexedStack(index: _currentIndex, children: _pages),

          // Bottom Navigation Bar
          Align(
            alignment: Alignment.bottomCenter,
            child: GlassBottomBar(
              currentIndex: _currentIndex,
              onTap: _onTabTapped,
              onAdd: _showEditor,
            ),
          ),
        ],
      ),
    );
  }
}
