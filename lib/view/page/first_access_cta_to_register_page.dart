import 'package:flutter/material.dart';

import '../component/ui/screen/cta_to_register_screen.dart';

class FirstAccessCtaToRegisterPage extends StatelessWidget {
  const FirstAccessCtaToRegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [SliverToBoxAdapter(child: CtaToRegisterScreen())],
      ),
    );
  }
}
