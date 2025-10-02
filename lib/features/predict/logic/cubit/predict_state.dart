part of 'predict_cubit.dart';

@immutable
abstract class PredictState {
  List<Object> get props => [];
}

class PredictInitial extends PredictState {}

class PredictionInitial extends PredictState {}

class PredictionLoading extends PredictState {}

class PredictionSuccess extends PredictState {
  final String prediction;
  PredictionSuccess(this.prediction);

  @override
  List<Object> get props => [prediction];
}

class PredictionError extends PredictState {
  final String error;
  PredictionError(this.error);

  @override
  List<Object> get props => [error];
}

class AQILoading extends PredictState {}

class AQISuccess extends PredictState {
  final double aqi;
  AQISuccess(this.aqi);
}

class AQIFailure extends PredictState {
  final String error;
  AQIFailure(this.error);
}