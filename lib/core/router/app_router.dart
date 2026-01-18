import 'package:expense_tracker/core/widgets/app_drawer.dart';
import 'package:expense_tracker/features/expense/presentation/widgets/home_header.dart';
import 'package:expense_tracker/features/user/presentation/bloc/bloc/user_bloc.dart';
import 'package:expense_tracker/features/user/presentation/bloc/bloc/user_state.dart';
import 'package:expense_tracker/features/user/presentation/pages/enter_name_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:expense_tracker/core/widgets/bottom_nav_bar.dart';

import 'package:expense_tracker/features/splash/presentation/pages/splash_screen.dart';
import 'package:expense_tracker/features/expense/presentation/pages/dashboard_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
        path: '/enter-name',
        builder: (context, state) => const EnterNameScreen()),
    ShellRoute(
      builder: (context, state, child) {
        final String path = state.uri.path;

        return Scaffold(
          backgroundColor: const Color(0xfff6f6f3),
          appBar: _showAppBar(path)
              ? PreferredSize(
                  preferredSize: const Size.fromHeight(60),
                  child: BlocBuilder<UserBloc, UserState>(
                    builder: (context, state) {
                      if (state is UserAuthenticated) {
                        return HomeHeader(userName: state.name);
                      }

                      return const SizedBox.shrink();
                    },
                  ),
                )
              : null,
          endDrawer: const AppDrawer(),
          body: child,
          bottomNavigationBar: _showBottomNav(path)
              ? AppBottomNavigation(
                  currentIndex: _currentIndex(path),
                )
              : null,
        );
      },
      routes: [
        GoRoute(
          path: '/dashboard',
          builder: (context, state) => const DashboardPage(),
        ),
      ],
    ),
  ],
);

int _currentIndex(String path) {
  if (path.startsWith('/dashboard')) return 0;
  if (path.startsWith('/search')) return 1;
  if (path.startsWith('/add')) return 2;
  if (path.startsWith('/profile')) return 3;
  return 0;
}

bool _showAppBar(String path) {
  return path != '/add';
}

bool _showBottomNav(String path) {
  return path != '/splash';
}
