// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rate_db.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RateDBAdapter extends TypeAdapter<RateDB> {
  @override
  final int typeId = 1;

  @override
  RateDB read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RateDB(
      code: fields[0] as String,
      date: fields[1] as DateTime,
      value: fields[2] as double,
      rate: fields[3] as double,
    );
  }

  @override
  void write(BinaryWriter writer, RateDB obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.code)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.value)
      ..writeByte(3)
      ..write(obj.rate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RateDBAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
