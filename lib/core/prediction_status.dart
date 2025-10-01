import 'package:flutter/material.dart';
import 'package:pollution/core/app_colors.dart';

Widget getPredictionStatus(double prediction, BuildContext context) {
  final isDark = Theme.of(context).brightness == Brightness.dark;

  if (prediction <= 50) {
    return Text(
      "Good",
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: isDark ? kDarkTextGreenColor : klightGreenTextColor,
      ),
    );
  } else if (prediction <= 100) {
    return Text(
      "Moderate",
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: isDark ? kDarkYellowTextColor : kYellowTextColor,
      ),
    );
  } else if (prediction <= 150) {
    return Text(
      "Unhealthy (Sensitive Groups)",
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.yellow.shade800,
      ),
    );
  } else if (prediction <= 200) {
    return Text(
      "Unhealthy",
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: isDark ? kDarkRedTextColor : kRedTextColor,
      ),
    );
  } else if (prediction <= 300) {
    return Text(
      "Very Unhealthy",
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.purple,
      ),
    );
  } else {
    return Text(
      "Hazardous",
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.brown,
      ),
    );
  }
}
