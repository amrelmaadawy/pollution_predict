import 'package:flutter/material.dart';
import 'package:pollution/core/app_colors.dart';
import 'package:pollution/core/prediction_status.dart';
import 'package:pollution/core/time_formatte.dart';
import 'package:pollution/features/history/ui/widgets/pollutants_levels_item.dart';

class PredictionDetailesView extends StatelessWidget {
  const PredictionDetailesView({
    super.key,
    required this.pollution,
    required this.date,
    required this.prediction,
  });
  final Map<String, double> pollution;
  final String date;
  final String prediction;
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        padding: const EdgeInsets.all(20),
        width: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: isDark
                      ? kDarkHighlightGreenColor
                      : kLightHighlightGreenColor,
                  child: Icon(
                    Icons.air,
                    color: isDark ? kDarkTextGreenColor : klightGreenTextColor,
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Prediction Details',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      formatDateTime(date, context),
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: isDark ? kDarkSubTextColor : kSubTextColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text(
                  'Overall Quality',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: isDark ? kDarkSubTextColor : kSubTextColor,
                  ),
                ),
                Spacer(),
                getPredictionStatus(double.parse(prediction), context),
                // Text(
                //   '[$prediction]',
                //   style: TextStyle(
                //     fontSize: 16,
                //     fontWeight: FontWeight.bold,
                //     color: klightGreenTextColor,
                //   ),
                // ),
              ],
            ),
            Divider(),
            Text(
              'Pollutants Levels',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            PollutantsLevelsItem(
              pollutant: 'PM10',
              value: '${pollution['pm10']}',
            ),
            PollutantsLevelsItem(pollutant: 'Co', value: '${pollution['co']}'),
            PollutantsLevelsItem(pollutant: 'O3', value: '${pollution['o3']}'),
            PollutantsLevelsItem(
              pollutant: 'So2',
              value: '${pollution['so2']}',
            ),
            PollutantsLevelsItem(
              pollutant: 'NO2',
              value: '${pollution['no2']}',
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: isDark
                      ? kDarkHighlightGreenColor
                      : kLightHighlightGreenColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Close',
                  style: TextStyle(
                    color: isDark ? kDarkTextGreenColor : klightGreenTextColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
