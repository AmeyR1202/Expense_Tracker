import 'package:expense_tracker/core/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class ScaffoldWithNav extends StatelessWidget {
  final Widget child;

  final int currentIndex;

  const ScaffoldWithNav({
    super.key,
    required this.child,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: AppBottomNavigation(
        currentIndex: currentIndex,
      ),
    );
  }
}
