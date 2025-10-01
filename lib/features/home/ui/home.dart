import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pollution/core/app_colors.dart';
import 'package:pollution/core/model/prediction_model.dart';
import 'package:pollution/core/prediction_status.dart';
import 'package:pollution/features/home/logic/heath_tips.dart';
import 'package:pollution/generated/l10n.dart';

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
            return Center(
              child: Text(
                S.of(context).NoPredictionYet,
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
                          Text(
                            S.of(context).LastPrediction,
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
                        S.of(context).PredictedAQI,
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
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // يخلي النص يطلع فوق
                    children: [
                      Icon(
                        Icons.health_and_safety_outlined,
                        color: isDark
                            ? kDarkTextGreenColor
                            : klightGreenTextColor,
                        size: 40,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        // عشان النص ياخد المساحة اللي فاضلة
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              S.of(context).HealthTips,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              getHealthTip(
                                double.parse(lastPrediction.prediction),
                              ),
                              style: const TextStyle(fontSize: 17),
                              softWrap: true,
                              overflow: TextOverflow.visible,
                              maxLines: null,
                            ),
                          ],
                        ),
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
