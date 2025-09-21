import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:pollution/core/app_colors.dart';

class LinearChart extends StatelessWidget {
  const LinearChart({
    super.key,
    this.height = 250,
    this.width = double.infinity,
  });
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        height: height,
        width: width,
        child: LineChart(
          LineChartData(
            gridData: FlGridData(show: false),
            borderData: FlBorderData(show: false),

            titlesData: FlTitlesData(
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 30,
                  interval: 6, // كل كام وحدة يظهر label (0, 6, 12, 18, 24)
                  // getTitlesWidget: (value, meta) {
                  //   switch (value.toInt()) {
                  //     case 0:
                  //       return const Text(
                  //         "0h",
                  //         style: TextStyle(fontWeight: FontWeight.bold),
                  //       );
                  //     case 6:
                  //       return const Text(
                  //         "6h",
                  //         style: TextStyle(fontWeight: FontWeight.bold),
                  //       );
                  //     case 12:
                  //       return const Text(
                  //         "12h",
                  //         style: TextStyle(fontWeight: FontWeight.bold),
                  //       );
                  //     case 18:
                  //       return const Text(
                  //         "18h",
                  //         style: TextStyle(fontWeight: FontWeight.bold),
                  //       );
                  //     case 24:
                  //       return const Text(
                  //         "24h",
                  //         style: TextStyle(fontWeight: FontWeight.bold),
                  //       );
                  //   }
                  //   return const SizedBox.shrink();
                  // },
                ),
              ),

              leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              rightTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
            ),

            lineBarsData: [
              LineChartBarData(
                spots: const [
                  FlSpot(0, 1),
                  FlSpot(3, 10),
                  FlSpot(4, 13),
                  FlSpot(5, 8),
                  FlSpot(6, 3),
                  FlSpot(8, 20),
                  FlSpot(12, 2),
                  FlSpot(15, 20),
                  FlSpot(18, 5),
                  FlSpot(20, 20),
                  FlSpot(24, 4),
                ],
                isCurved: true,
                color: kLightPrimaryColor,
                barWidth: 4,
                dotData: FlDotData(show: true),
                belowBarData: BarAreaData(
                  show: true,
                  gradient: LinearGradient(
                    colors: [
                      kLightHighlightGreenColor.withValues(alpha: 0.5),
                      kLightHighlightGreenColor.withValues(alpha: 0),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
