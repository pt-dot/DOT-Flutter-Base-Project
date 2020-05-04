// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AddressHiveAdapter extends TypeAdapter<AddressHive> {
  @override
  final typeId = 3;

  @override
  AddressHive read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AddressHive(
      street: fields[0] as String,
      suite: fields[1] as String,
      city: fields[2] as String,
      zipcode: fields[3] as String,
      geo: fields[4] as GeoHive,
    );
  }

  @override
  void write(BinaryWriter writer, AddressHive obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.street)
      ..writeByte(1)
      ..write(obj.suite)
      ..writeByte(2)
      ..write(obj.city)
      ..writeByte(3)
      ..write(obj.zipcode)
      ..writeByte(4)
      ..write(obj.geo);
  }
}
