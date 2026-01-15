import 'package:expense_tracker/core/widgets/scaffold_with_nav.dart';
import 'package:expense_tracker/features/expense/presentation/pages/dashboard_page.dart';
import 'package:expense_tracker/features/splash/presentation/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/splash',
  errorBuilder: (context, state) => Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 80, color: Colors.red),
          SizedBox(height: 20),
          Text(
            'Page not found',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text('The page you\'re looking for doesn\'t exist'),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () => context.go('/dashboard'),
            child: Text('Go to Home'),
          ),
        ],
      ),
    ),
  ),
  routes: [
// -------------------------------------------------------
// Routes WITHOUT bottom navigation (like Splash)
// -------------------------------------------------------
    GoRoute(
      path: '/splash',
      builder: (context, state) => const SplashScreen(),
    ),

// -------------------------------------------------------
// ShellRoute: Routes WITH bottom navigation
// -------------------------------------------------------
// ShellRoute is like a "wrapper" for multiple routes
// It keeps the bottom nav visible while changing content
    ShellRoute(
// This builder wraps EVERY route inside ShellRoute
      builder: (context, state, child) {
// "child" here is the current page (Dashboard/Search/Add/Profile)
// We wrap it with ScaffoldWithNav
        return ScaffoldWithNav(
          currentIndex: _getCurrentIndex(state.uri.path),
          child: child, // <-- This is the magic part!
        );
      },

// All routes here will be wrapped by ScaffoldWithNav
      routes: [
        GoRoute(
          path: '/dashboard',
// This DashboardPage becomes the "child" in ScaffoldWithNav
          builder: (context, state) => const DashboardPage(),
        ),
//         GoRoute(
//           path: '/search',
// // This SearchPage becomes the "child" in ScaffoldWithNav
//           builder: (context, state) => const SearchPage(),
//         ),
//         GoRoute(
//           path: '/add',
// // This AddPage becomes the "child" in ScaffoldWithNav
//           builder: (context, state) => const AddPage(),
//         ),
//         GoRoute(
//           path: '/profile',
// // This ProfilePage becomes the "child" in ScaffoldWithNav
//           builder: (context, state) => const ProfilePage(),
//         ),
      ],
    ),
  ],
);

// Helper function to figure out which tab should be highlighted
int _getCurrentIndex(String path) {
  if (path.startsWith('/dashboard')) return 0;
  if (path.startsWith('/search')) return 1;
  if (path.startsWith('/add')) return 2;
  if (path.startsWith('/profile')) return 3;
  return 0;
}
