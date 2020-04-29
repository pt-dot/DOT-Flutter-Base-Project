// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CompanyHiveAdapter extends TypeAdapter<CompanyHive> {
  @override
  final typeId = 1;

  @override
  CompanyHive read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CompanyHive(
      name: fields[0] as String,
      catchPhrase: fields[1] as String,
      bs: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CompanyHive obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.catchPhrase)
      ..writeByte(2)
      ..write(obj.bs);
  }
}
