import 'package:flutter/material.dart';
import 'package:pollution/core/app_colors.dart';

class CustomForecastsTimeContianer extends StatelessWidget {
  const CustomForecastsTimeContianer({super.key, required this.time});
  final String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kLightHighlightGreenColor,
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
