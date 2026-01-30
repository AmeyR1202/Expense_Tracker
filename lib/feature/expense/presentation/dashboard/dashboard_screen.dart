import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("this is dashboard")),
      body: Center(
        child: Container(height: 100, width: 100, color: Colors.amber),
      ),
    );
  }
}
