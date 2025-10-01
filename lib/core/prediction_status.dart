import 'package:flutter/material.dart';
import 'package:pollution/core/app_colors.dart';
import 'package:pollution/generated/l10n.dart';

Widget getPredictionStatus(double prediction, BuildContext context) {
  final isDark = Theme.of(context).brightness == Brightness.dark;

  if (prediction <= 50) {
    return Text(
      S.of(context).good,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: isDark ? kDarkTextGreenColor : klightGreenTextColor,
      ),
    );
  } else if (prediction <= 100) {
    return Text(
      S.of(context).moderate,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: isDark ? kDarkYellowTextColor : kYellowTextColor,
      ),
    );
  } else if (prediction <= 150) {
    return Text(
      S.of(context).UnhealthySensitiveGroups,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.yellow.shade800,
      ),
    );
  } else if (prediction <= 200) {
    return Text(
      S.of(context).unhealthy,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: isDark ? kDarkRedTextColor : kRedTextColor,
      ),
    );
  } else if (prediction <= 300) {
    return Text(
      S.of(context).VeryUnhealthy,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.purple,
      ),
    );
  } else {
    return Text(
      S.of(context).Hazardous,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.brown,
      ),
    );
  }
}
