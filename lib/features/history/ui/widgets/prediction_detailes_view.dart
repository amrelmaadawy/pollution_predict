import 'package:flutter/material.dart';
import 'package:pollution/core/app_colors.dart';
import 'package:pollution/core/time_formatte.dart';
import 'package:pollution/features/history/ui/widgets/pollutants_levels_item.dart';

class PredictionDetailesView extends StatelessWidget {
  const PredictionDetailesView({super.key, required this.pollution, required this.date, required this.prediction});
  final Map<String, double> pollution;
  final String date;
  final String prediction;
  @override
  Widget build(BuildContext context) {
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
                  backgroundColor: kLightHighlightGreenColor,
                  child: Icon(Icons.air, color: klightGreenTextColor),
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
                      formatDateTime(date),
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: kSubTextColor,
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
                    color: kSubTextColor,
                  ),
                ),
                Spacer(),
                Text(
                  'Good [$prediction]',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: klightGreenTextColor,
                  ),
                ),
              ],
            ),
            Divider(),
            Text(
              'Pollutants Levels',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            PollutantsLevelsItem(pollutant: 'PM10', value: '${pollution['pm10']}'),
            PollutantsLevelsItem(pollutant: 'Co', value: '${pollution['co']}'),
            PollutantsLevelsItem(pollutant: 'O3', value: '${pollution['o3']}'),
            PollutantsLevelsItem(pollutant: 'So2', value: '${pollution['so2']}'),
            PollutantsLevelsItem(pollutant: 'NO2', value: '${pollution['no2']}'),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kLightHighlightGreenColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop(); // يقفل الكارد
                },
                child: Text(
                  'Close',
                  style: TextStyle(
                    color: klightGreenTextColor,
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
