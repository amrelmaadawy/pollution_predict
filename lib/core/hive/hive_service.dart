import 'package:hive/hive.dart';
import 'package:pollution/core/model/prediction_model.dart';

final box = Hive.box<PredictionModel>('pollutionBox');

Future<void> deletePrediction(int index) async {
  final originalIndex = box.length - 1 - index;

  await box.deleteAt(originalIndex);
}

Future<PredictionModel?> getLastPrediction() async {
  final box = Hive.box<PredictionModel>('pollutionBox');

  if (box.isEmpty) return null; // لو فاضي

  return box.getAt(box.length - 1); // آخر عنصر
}