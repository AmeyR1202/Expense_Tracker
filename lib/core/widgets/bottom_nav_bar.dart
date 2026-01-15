import 'package:flutter/material.dart';

class AppBottomNavBar extends StatelessWidget {
  const AppBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        color: Color(0xfff6f6f3),
        margin: const EdgeInsets.symmetric(horizontal: 12),
        height: 72,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.95),
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(24),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 20,
              offset: const Offset(0, -6),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _NavIcon(icon: Icons.home, isActive: true),
            _NavIcon(icon: Icons.credit_card),
            Container(
              height: 56,
              width: 56,
              decoration: const BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.add, color: Colors.white),
            ),
            _NavIcon(icon: Icons.bar_chart),
            _NavIcon(icon: Icons.person),
          ],
        ),
      ),
    );
  }
}

class _NavIcon extends StatelessWidget {
  final IconData icon;
  final bool isActive;

  const _NavIcon({
    required this.icon,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: 26,
      color: isActive ? Colors.black : Colors.grey,
    );
  }
}
