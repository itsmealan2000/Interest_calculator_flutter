// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'compount_interest_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CompountInterestModelAdapter extends TypeAdapter<CompountInterestModel> {
  @override
  final int typeId = 1;

  @override
  CompountInterestModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CompountInterestModel(
      cinterest: fields[0] as double,
      ctotalAmount: fields[1] as double,
      ctermLength: fields[2] as String,
      ctermValue: fields[3] as String,
      ctitlename: fields[7] as String?,
      ctimestamp: fields[8] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CompountInterestModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.cinterest)
      ..writeByte(1)
      ..write(obj.ctotalAmount)
      ..writeByte(2)
      ..write(obj.ctermLength)
      ..writeByte(3)
      ..write(obj.ctermValue)
      ..writeByte(7)
      ..write(obj.ctitlename)
      ..writeByte(8)
      ..write(obj.ctimestamp);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CompountInterestModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
