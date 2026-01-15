import 'package:expense_tracker/features/expense/presentation/widgets/balance_card.dart';
import 'package:expense_tracker/features/expense/presentation/widgets/home_header.dart';
import 'package:expense_tracker/features/expense/presentation/widgets/transaction_tile.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff6f6f3),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              HomeHeader(
                userName: "Amey",
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
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xfff6f6f3),
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
        ],
      ),
    );
  }
}
