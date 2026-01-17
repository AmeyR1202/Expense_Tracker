import 'package:expense_tracker/features/expense/presentation/widgets/balance_card.dart';
import 'package:expense_tracker/features/expense/presentation/widgets/home_header.dart';
import 'package:expense_tracker/features/expense/presentation/widgets/transaction_tile.dart';
import 'package:expense_tracker/features/user/presentation/bloc/bloc/user_bloc.dart';
import 'package:expense_tracker/features/user/presentation/bloc/bloc/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is! UserAuthenticated) {
          return const SizedBox();
        }

        final name = state.name;
        return Scaffold(
          backgroundColor: Color(0xfff6f6f3),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  HomeHeader(
                    userName: name,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  BalanceCard(
                    balance: 5000,
                    progress: 0.2,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    'Transactions',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TransactionTile(
                    title: 'Dribbble Pro',
                    date: '18 Sep, 2021',
                    amount: '-\$145.00',
                    iconBg: Colors.amber.shade800,
                    icon: Icons.arrow_downward,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TransactionTile(
                    title: 'Salary',
                    date: '20 Sep, 2021',
                    amount: '+\$1000.00',
                    iconBg: Colors.green,
                    icon: Icons.arrow_upward,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TransactionTile(
                    title: 'Salary',
                    date: '20 Sep, 2021',
                    amount: '+\$1000.00',
                    iconBg: Colors.green,
                    icon: Icons.arrow_upward,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TransactionTile(
                    title: 'Salary',
                    date: '20 Sep, 2021',
                    amount: '+\$1000.00',
                    iconBg: Colors.green,
                    icon: Icons.arrow_upward,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TransactionTile(
                    title: 'Salary',
                    date: '20 Sep, 2021',
                    amount: '+\$1000.00',
                    iconBg: Colors.green,
                    icon: Icons.arrow_upward,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TransactionTile(
                    title: 'Salary',
                    date: '20 Sep, 2021',
                    amount: '+\$1000.00',
                    iconBg: Colors.green,
                    icon: Icons.arrow_upward,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
