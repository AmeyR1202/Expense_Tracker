import 'dart:async';

import 'package:expense_tracker/features/user/presentation/bloc/bloc/user_bloc.dart';
import 'package:expense_tracker/features/user/presentation/bloc/bloc/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;
  UserState? _latestState;

  @override
  void initState() {
    super.initState();

    _timer = Timer(const Duration(seconds: 3), _handleNavigation);
  }

  void _handleNavigation() {
    if (!mounted) return;

    if (_latestState is UserAuthenticated) {
      context.go('/dashboard');
    } else {
      context.go('/enter-name');
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        _latestState = state;
      },
      child: const Scaffold(
        body: Center(
          child: Text(
            'Expense Trackr',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
