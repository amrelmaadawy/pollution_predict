import 'package:flutter/material.dart';
import 'package:pollution/core/app_colors.dart';

class WeatherConditionsContainers extends StatelessWidget {
  const WeatherConditionsContainers({
    super.key,
    required this.weatherCondition,
    required this.weatherValue,
    required this.icon,
  });
  final String weatherCondition;
  final String weatherValue;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      height: 100,
      width: 110,
      decoration: BoxDecoration(
        border: BoxBorder.all(
          color: isDark ? kDarkBorderColor : kLightBorderColor,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              icon,
              color: isDark ? kDarkPrimaryColor : kLightPrimaryColor,
              size: 30,
            ),
            Text(
              weatherCondition,
              style: TextStyle(
                color: isDark ? kDarkSubTextColor : kSubTextColor,
                fontSize: 16,
              ),
            ),
            Text(
              weatherValue,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
