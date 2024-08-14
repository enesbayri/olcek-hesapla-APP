// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: camel_case_types

part of 'calcute.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class calcuteAdapter extends TypeAdapter<calcute> {
  @override
  final int typeId = 1;

  @override
  calcute read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return calcute(
      convertFrom: fields[1] as String,
      convertTo: fields[2] as String,
      measure: fields[3] as double,
      scale: fields[4] as double?,
      scalePre: fields[5] as double?,
      created: fields[6] as DateTime,
    )..answer = fields[7] as double;
  }

  @override
  void write(BinaryWriter writer, calcute obj) {
    writer
      ..writeByte(7)
      ..writeByte(1)
      ..write(obj.convertFrom)
      ..writeByte(2)
      ..write(obj.convertTo)
      ..writeByte(3)
      ..write(obj.measure)
      ..writeByte(4)
      ..write(obj.scale)
      ..writeByte(5)
      ..write(obj.scalePre)
      ..writeByte(6)
      ..write(obj.created)
      ..writeByte(7)
      ..write(obj.answer);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is calcuteAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
