import 'package:expense_tracker/features/expense/presentation/pages/dashboard_page.dart';
import 'package:expense_tracker/features/splash/presentation/pages/splash_screen.dart';
import 'package:expense_tracker/features/user/presentation/bloc/bloc/user_bloc.dart';
import 'package:expense_tracker/features/user/presentation/bloc/bloc/user_state.dart';
import 'package:expense_tracker/features/user/presentation/pages/enter_name_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserLoading) {
          return const SplashScreen();
        }

        if (state is UserUnauthenticated) {
          return const EnterNameScreen();
        }

        if (state is UserAuthenticated) {
          return DashboardPage();
        }

        return const SizedBox();
      },
    );
  }
}
