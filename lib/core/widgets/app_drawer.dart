import 'package:expense_tracker/features/user/presentation/bloc/bloc/user_bloc.dart';
import 'package:expense_tracker/features/user/presentation/bloc/bloc/user_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color(0xfff6f6f3),
              ),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Expense Tracker',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.dashboard),
              title: const Text('Dashboard'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.receipt_long),
              title: const Text('Transactions'),
              onTap: () {
                context.go('/dashboard');
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {},
            ),
            const Spacer(),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text(
                'Logout',
                style: TextStyle(color: Colors.red),
              ),
              onTap: () {
                context.read<UserBloc>().add(UserLogoutRequested());
                context.go('/splash');
              },
            ),
          ],
        ),
      ),
    );
  }
}
