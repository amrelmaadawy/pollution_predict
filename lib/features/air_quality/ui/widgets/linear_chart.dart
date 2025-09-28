import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:pollution/core/app_colors.dart';

class LinearChart extends StatelessWidget {
  const LinearChart({
    super.key,
    this.height = 200,
    this.width = double.infinity,
  });
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final lineColor = isDark ? Colors.greenAccent : kLightPrimaryColor;
    final belowGradient = isDark
        ? [Colors.greenAccent.withValues(alpha: 0.3), Colors.transparent]
        : [
            kLightHighlightGreenColor.withValues(alpha: 0.5),
            kLightHighlightGreenColor.withValues(alpha: 0),
          ];

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
                  interval: 6,
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
                color: lineColor,
                barWidth: 4,
                dotData: FlDotData(
                  show: true,
                  getDotPainter: (spot, percent, barData, index) =>
                      FlDotCirclePainter(
                        radius: 4,
                        color: isDark ? Colors.white : kLightPrimaryColor,
                        strokeWidth: 2,
                        strokeColor: lineColor,
                      ),
                ),
                belowBarData: BarAreaData(
                  show: true,
                  gradient: LinearGradient(
                    colors: belowGradient,
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
