import 'package:flutter/material.dart';
import 'package:pollution/core/app_colors.dart';

class PollutantsLevelsItem extends StatelessWidget {
  const PollutantsLevelsItem({super.key, required this.pollutant, required this.value});
  final String pollutant;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(pollutant, style: TextStyle(fontSize: 15, color: kSubTextColor)),
        Spacer(),
        Text(value, style: TextStyle(fontSize: 15, color: kSubTextColor)),
      ],
    );
  }
}
