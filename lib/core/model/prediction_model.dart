import 'package:hive/hive.dart';

part 'prediction_model.g.dart';

@HiveType(typeId: 0)
class PredictionModel extends HiveObject {
  @HiveField(0)
  String date;

  @HiveField(1)
  String prediction;

  @HiveField(2)
  Map<String, double> pollutants;

  PredictionModel({
    required this.date,
    required this.prediction,
    required this.pollutants,
  });
}
