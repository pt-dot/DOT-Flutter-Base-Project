import 'package:hive/hive.dart';
part 'geo_model.g.dart';

@HiveType(typeId: 2)
class GeoModel extends HiveObject {
  @HiveField(0)
  String? lat;
  @HiveField(1)
  String? lng;

  GeoModel({this.lat, this.lng});

  GeoModel.fromJson(Map<String, dynamic> json) {
    lat = json['lat'] as String;
    lng = json['lng'] as String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lat'] = lat;
    data['lng'] = lng;
    return data;
  }
}