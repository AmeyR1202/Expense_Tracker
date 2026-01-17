import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppBottomNavigation extends StatelessWidget {
  // We need to know which tab is currently selected
  final int currentIndex;

  const AppBottomNavigation({
    super.key,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: const Color(0xfff6f6f3),
      currentIndex: currentIndex,
      // Highlights the current tab
      onTap: (index) => _onTap(index, context),
      // When user taps a tab
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add),
          label: 'Add',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.wallet),
          label: 'Wallet',
        )
      ],
    );
  }

  // When a tab is tapped, navigate to that page
  void _onTap(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.go('/dashboard');
        break;
      case 1:
        context.go('/search');
        break;
      case 2:
        context.go('/add');
        break;
      case 3:
        context.go('/profile');
        break;
    }
  }
}
