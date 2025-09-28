import 'package:flutter/material.dart';
import 'package:pollution/core/app_colors.dart';

class CustomForecastsTimeContianer extends StatelessWidget {
  const CustomForecastsTimeContianer({
    super.key,
    required this.time,
    required this.isSelected,
  });
  final String time;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color: isSelected
            ? kLightPrimaryColor
            : isDark
            ? kDarkHighlightGreenColor
            : kLightHighlightGreenColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          time,
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
