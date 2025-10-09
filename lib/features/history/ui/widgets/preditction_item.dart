import 'package:flutter/material.dart';
import 'package:pollution/core/app_colors.dart';
import 'package:pollution/core/hive/hive_service.dart';
import 'package:pollution/core/prediction_status.dart';
import 'package:pollution/core/time_formatte.dart';
import 'package:pollution/features/history/ui/widgets/prediction_detailes_view.dart';
import 'package:pollution/generated/l10n.dart';

class PredictionItem extends StatelessWidget {
  const PredictionItem({
    super.key,
    required this.date,
    required this.prediction,
    required this.pollution,
    required this.index,
  });
  final String date;
  final String prediction;
  final Map<String, double> pollution;
  final int index;
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    formatDateTime(date, context),
                    style: TextStyle(fontSize: 18),
                  ),
                  Row(
                    children: [
                      Text('${S.of(context).Prediction}:', style: TextStyle(fontSize: 18)),
                      const SizedBox(width: 5),
                      getPredictionStatus(double.parse(prediction), context),
                      Text(
                        ' [$prediction]',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: isDark ? kDarkSubTextColor : kSubTextColor,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '${S.of(context).Pollutions}: PM10:${pollution['pm10']}, NO2:${pollution['no2']}, SO2:${pollution['so2']}, CO:${pollution['co']}, O3:${pollution['o3']}',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 15,
                      color: isDark ? kDarkSubTextColor : kSubTextColor,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return PredictionDetailesView(
                          pollution: pollution,
                          date: date,
                          prediction: prediction,
                        );
                      },
                    );
                  },
                  child: CircleAvatar(
                    backgroundColor: isDark
                        ? kDarkHighlightGreenColor
                        : kLightHighlightGreenColor,
                    child: Icon(
                      Icons.remove_red_eye_outlined,
                      color: isDark
                          ? kDarkTextGreenColor
                          : klightGreenTextColor,
                    ),
                  ),
                ),
                SizedBox(width: 5),
                GestureDetector(
                  onTap: () {
                    deletePrediction(index);
                  },
                  child: CircleAvatar(
                    backgroundColor: isDark
                        ? kDarkHighlightRedColor
                        : kLightHighlightRedColor,
                    child: Icon(
                      Icons.delete_outline,
                      color: isDark ? kDarkRedTextColor : kRedTextColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
