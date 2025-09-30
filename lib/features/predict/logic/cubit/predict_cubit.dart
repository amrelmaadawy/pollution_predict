import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

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
      if (kDebugMode) {
        print('predicted successsssssssssssssssssssssssssssssssssssssss');
        print(prediction);
      }
      emit(PredictionSuccess(prediction.toString()));
    } catch (e) {
      if (kDebugMode) {
        print('Errorrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr');
      }
      emit(PredictionError(e.toString()));
    }
  }
}
