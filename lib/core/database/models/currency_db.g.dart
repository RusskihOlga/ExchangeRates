// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_db.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CurrencyDBAdapter extends TypeAdapter<CurrencyDB> {
  @override
  final int typeId = 0;

  @override
  CurrencyDB read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CurrencyDB(
      code: fields[0] as String,
      name: fields[1] as String,
      favorite: fields[2] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, CurrencyDB obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.code)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.favorite);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CurrencyDBAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
