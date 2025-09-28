import 'package:flutter/material.dart';
import 'package:pollution/core/app_colors.dart';

class CustomAlertContainer extends StatelessWidget {
  const CustomAlertContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: isDark
            ? kDarkHighlightGreenColor
            : kLightHighlightBackGroundGreenColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: kLightHighlightGreenColor,
              child: Icon(
                Icons.factory,
                color: isDark ? kDarkPrimaryColor : kLightPrimaryColor,
              ),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hazardous Air Quality Alert',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Avoid outdoor activities',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
