import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:pollution/core/model/prediction_model.dart';

part 'predict_state.dart';

class PredictCubit extends Cubit<PredictState> {
  PredictCubit(this.dio) : super(PredictInitial());
  final Dio dio;

  Future<void> getPrediction({
    required double pm10,
    required double no2,
    required double so2,
    required double co,
    required double o3,
    required double temperature,
    required double humidity,
    required double wind,
  }) async {
    emit(PredictionLoading());
    try {
      final response = await dio.post(
        "http://10.0.2.2:5000/predict", // للـ Emulator (Android).
        // لو موبايل حقيقي: استبدل 10.0.2.2 بالـ IP بتاع جهازك.
        data: {
          "pm10": pm10,
          "no2": no2,
          "so2": so2,
          "co": co,
          "o3": o3,
          "temperature": temperature,
          "humidity": humidity,
          "wind": wind,
        },
      );

      final prediction = response.data["prediction"];
      final box = Hive.box<PredictionModel>('pollutionBox');

      box.add(
        PredictionModel(
          date: DateTime.now().toString(),
          prediction: prediction.toString(),
          pollutants: {
            "pm10": pm10,
            "no2": no2,
            "so2": so2,
            "co": co,
            "o3": o3,
            "temperature": temperature,
            "humidity": humidity,
            "wind": wind,
          },
        ),
      );

      if (kDebugMode) {
        print('predicted successsssssssssssssssssssssssssssssssssssssss');
        print(prediction);
      }
      emit(PredictionSuccess(prediction.toString()));
    } catch (e) {
      if (kDebugMode) {
        print('Errorrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr');
        print(e);
      }
      emit(PredictionError(e.toString()));
    }
  }


  double toDouble(dynamic value) {
    if (value is String) {
      return double.tryParse(value) ?? 0.0;
    } else if (value is num) {
      return value.toDouble();
    } else {
      return 0.0;
    }
  }

    Future<void> predictCityAQI({
   
   required Map<String,dynamic> city,
  }) async {
     emit(AQILoading());
    try {
      final response = await dio.post(
        "http://10.0.2.2:5000/predict", // للـ Emulator (Android).
        // لو موبايل حقيقي: استبدل 10.0.2.2 بالـ IP بتاع جهازك.
        data: {
          "pm10": toDouble(city["pm10"]),
          "no2": toDouble(city["no2"]),
          "so2": toDouble(city["so2"]),
          "co": toDouble(city["co"]),
          "o3": toDouble(city["o3"]),
          "temperature": toDouble(city["temperature"]),
          "humidity": toDouble(city["humidity"]),
          "wind": toDouble(city["wind"]),
        },
      );

      final prediction = response.data["prediction"];
    
      if (kDebugMode) {
        print('predicted successsssssssssssssssssssssssssssssssssssssss');
        print(prediction);
      }
      emit(AQISuccess(prediction));
    } catch (e) {
      if (kDebugMode) {
        print('Errorrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr');
        print(e);
      }
      emit(AQIFailure(e.toString()));
    }
  }
}
