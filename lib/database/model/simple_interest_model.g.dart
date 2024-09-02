// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'simple_interest_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SimpleInterestModelAdapter extends TypeAdapter<SimpleInterestModel> {
  @override
  final int typeId = 0;

  @override
  SimpleInterestModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SimpleInterestModel(
      interest: fields[0] as double,
      totalAmount: fields[1] as double,
      selectedUnit: fields[2] as String,
      timePeriod: fields[3] as String,
      titlename: fields[4] as String?,
      timestamp: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, SimpleInterestModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.interest)
      ..writeByte(1)
      ..write(obj.totalAmount)
      ..writeByte(2)
      ..write(obj.selectedUnit)
      ..writeByte(3)
      ..write(obj.timePeriod)
      ..writeByte(4)
      ..write(obj.titlename)
      ..writeByte(5)
      ..write(obj.timestamp);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SimpleInterestModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
