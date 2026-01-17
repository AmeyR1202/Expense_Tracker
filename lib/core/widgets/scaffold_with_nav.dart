import 'package:expense_tracker/core/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

/// This widget wraps your page content with a Scaffold + Bottom Nav
/// Think of it as a "frame" that holds your page
class ScaffoldWithNav extends StatelessWidget {
  // "child" will be your actual page content (Dashboard, Search, etc.)
  final Widget child;

  // Which tab should be highlighted?
  final int currentIndex;

  const ScaffoldWithNav({
    super.key,
    required this.child, // The page content goes here
    required this.currentIndex, // Which tab is active
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // The "child" is your page (DashboardPage, SearchPage, etc.)
      body: child,

      // Add the bottom navigation bar at the bottom
      bottomNavigationBar: AppBottomNavigation(
        currentIndex: currentIndex,
      ),
    );
  }
}
