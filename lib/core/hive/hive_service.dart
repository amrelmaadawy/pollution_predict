import 'package:hive/hive.dart';
import 'package:pollution/core/model/prediction_model.dart';

final box = Hive.box<PredictionModel>('pollutionBox');

Future<void> deletePrediction(int index) async {
  final originalIndex = box.length - 1 - index;

  await box.deleteAt(originalIndex);
}
