import 'package:hive/hive.dart';
part 'geo_hive.g.dart';

@HiveType(typeId: 2)
class GeoHive extends HiveObject {

  @HiveField(0)
  String lat;
  @HiveField(1)
  String lng;

  GeoHive({this.lat, this.lng});

}