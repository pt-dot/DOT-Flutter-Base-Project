// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geo_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GeoHiveAdapter extends TypeAdapter<GeoHive> {
  @override
  final typeId = 2;

  @override
  GeoHive read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GeoHive(
      lat: fields[0] as String,
      lng: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, GeoHive obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.lat)
      ..writeByte(1)
      ..write(obj.lng);
  }
}
