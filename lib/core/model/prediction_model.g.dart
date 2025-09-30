// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prediction_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PredictionModelAdapter extends TypeAdapter<PredictionModel> {
  @override
  final int typeId = 0;

  @override
  PredictionModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PredictionModel(
      date: fields[0] as String,
      prediction: fields[1] as String,
      pollutants: (fields[2] as Map).cast<String, double>(),
    );
  }

  @override
  void write(BinaryWriter writer, PredictionModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.prediction)
      ..writeByte(2)
      ..write(obj.pollutants);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PredictionModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
