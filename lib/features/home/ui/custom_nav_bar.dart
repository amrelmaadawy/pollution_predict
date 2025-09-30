import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:pollution/generated/l10n.dart';

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
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF121212) : Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? Colors.black.withValues(alpha: 0.4)
                : Colors.grey.withValues(alpha: 0.2),
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
          color: isDark ? Colors.white70 : Colors.black54,
          activeColor: isDark ? Colors.greenAccent : Colors.green.shade700,
          tabBackgroundColor: isDark
              ? Colors.greenAccent.withValues(alpha: 0.2)
              : Colors.green.shade100,
          padding: const EdgeInsets.all(12),
          selectedIndex: selectedIndex,
          onTabChange: onTabChange,
          tabs: [
            GButton(icon: Icons.home_outlined, text: 'Home'),
            GButton(icon: Icons.map_outlined, text: S.of(context).Map),
            GButton(icon: Icons.history, text: 'History'),
            GButton(icon: Icons.settings_outlined, text: S.of(context).Setting),
          ],
        ),
      ),
    );
  }
}
