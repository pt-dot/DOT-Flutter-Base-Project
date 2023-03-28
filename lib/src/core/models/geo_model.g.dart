// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geo_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GeoModelAdapter extends TypeAdapter<GeoModel> {
  @override
  final int typeId = 2;

  @override
  GeoModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GeoModel(
      lat: fields[0] as String?,
      lng: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, GeoModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.lat)
      ..writeByte(1)
      ..write(obj.lng);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GeoModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
