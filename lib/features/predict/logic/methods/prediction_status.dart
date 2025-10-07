import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:pollution/core/model/prediction_model.dart';
  final box = Hive.box<PredictionModel>(
                                  'pollutionBox',
                                );

                                final prediction = double.parse(
                                  box.getAt(box.length - 1)!.prediction,
                                );

Color getColor() {
  if (prediction <= 50) return Colors.green;
  if (prediction <= 100) {
    return Colors.yellow.shade700;
  }
  if (prediction <= 150) return Colors.orange;
  return Colors.red;
}

String getStatus() {
  if (prediction <= 50) return "Good";
  if (prediction <= 100) return "Moderate";
  if (prediction <= 150) {
    return "Unhealthy for Sensitive Groups";
  }
  return "Unhealthy";
}
