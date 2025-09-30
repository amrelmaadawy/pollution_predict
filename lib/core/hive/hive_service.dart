import 'package:hive/hive.dart';

final box = Hive.box('pollutionBox');

void savePrediction({
  required String date,
  required String prediction,
  required Map<String, double> pollutants,
}) {
  final data = {
    "date": date,
    "prediction": prediction,
    "pollutants": pollutants,
  };

  box.add(data); // add بيضيف Object جديد
}
