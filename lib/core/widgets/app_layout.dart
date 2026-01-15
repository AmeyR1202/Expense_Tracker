import 'package:expense_tracker/core/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class AppLayout extends StatelessWidget {
  final Widget child;

  const AppLayout({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff6f6f3),
      body: child,
      bottomNavigationBar: const AppBottomNavBar(),
    );
  }
}
