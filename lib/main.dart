import 'package:expense_tracker/app_root.dart';
import 'package:expense_tracker/data/database/app_database.dart';
import 'package:expense_tracker/features/user/data/repository/user_repository_impl.dart';
import 'package:expense_tracker/features/user/presentation/bloc/bloc/user_bloc.dart';
import 'package:expense_tracker/features/user/presentation/bloc/bloc/user_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final db = AppDatabase();
  final userRepository = UserRepositoryImpl(db: db);

  runApp(
    BlocProvider(
      create: (_) => UserBloc(userRepository)..add(UserCheckRequested()),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expense Tracker',
      theme: ThemeData(
        fontFamily: 'Inter',
      ),
      home: const AppRoot(),
    );
  }
}
