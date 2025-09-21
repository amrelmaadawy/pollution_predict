import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class CustomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabChange;

  const CustomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTabChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.2),
            blurRadius: 10,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: GNav(
          gap: 8,
          backgroundColor: Colors.transparent,
          color: Colors.black54,
          activeColor: Colors.green.shade700, 
          tabBackgroundColor: Colors.green.shade100,
          padding: const EdgeInsets.all(12),
          selectedIndex: selectedIndex,
          onTabChange: onTabChange,
          tabs: const [
            GButton(
              icon: Icons.dashboard_customize_outlined,
              text: "Dashboard",
            ),
            GButton(icon: Icons.map_outlined, text: "Map"),
            GButton(icon: Icons.wb_sunny_outlined, text: "Forecasts"),
            GButton(icon: Icons.notifications_active_outlined, text: "Alerts"),
          ],
        ),
      ),
    );
  }
}
