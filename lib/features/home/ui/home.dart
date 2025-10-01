import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pollution/core/app_colors.dart';
import 'package:pollution/core/model/prediction_model.dart';
import 'package:pollution/core/prediction_status.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final box = Hive.box<PredictionModel>('pollutionBox');
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ValueListenableBuilder(
        valueListenable: box.listenable(),
        builder: (context, Box<PredictionModel> box, _) {
          if (box.isEmpty) {
            return const Center(
              child: Text(
                "No predictions yet",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            );
          }

          // آخر قيمة محفوظة
          final lastPrediction = box.getAt(box.length - 1)!;

          return Column(
            children: [
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  color: isDark
                      ? kDarkHighlightGreenColor
                      : kLightHighlightGreenColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.air,
                            color: isDark
                                ? kDarkTextGreenColor
                                : klightGreenTextColor,
                            size: 60,
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            'Last Prediction',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        lastPrediction.prediction, // هنا النتيجة
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Predicted AQI',
                        style: TextStyle(
                          color: isDark ? Colors.white : Colors.black54,
                          fontSize: 17,
                        ),
                      ),
                      getPredictionStatus(
                        double.parse(lastPrediction.prediction),
                        context,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: isDark
                      ? kDarkHighlightGreenColor
                      : kLightHighlightGreenColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.health_and_safety_outlined,
                        color: isDark
                            ? kDarkTextGreenColor
                            : klightGreenTextColor,
                        size: 40,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Health Tips',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('Stay indoors and avoid outdoor activities.'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
