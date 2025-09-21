import 'package:flutter/material.dart';
import 'package:pollution/core/app_colors.dart';
import 'package:pollution/features/air_quality/ui/widgets/linear_chart.dart';

class CustomPollutantDetailsContainer extends StatelessWidget {
  const CustomPollutantDetailsContainer({
    super.key,
    required this.pollutantName,
    required this.pollutantValue,
  });
  final String pollutantName;
  final String pollutantValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: kLightBorderColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              pollutantName,
              style: TextStyle(fontSize: 15, color: kSubTextColor),
            ),
            Text(
              pollutantValue,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            LinearChart(
              height: 100,
              width: MediaQuery.of(context).size.width * 0.35,
            ),
          ],
        ),
      ),
    );
  }
}
