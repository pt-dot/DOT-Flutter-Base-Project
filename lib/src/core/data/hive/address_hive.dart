import 'package:base_flutter/src/core/data/hive/geo_hive.dart';
import 'package:hive/hive.dart';
part 'address_hive.g.dart';

@HiveType(typeId: 3)
class AddressHive extends HiveObject {

  @HiveField(0)
  String street;
  @HiveField(1)
  String suite;
  @HiveField(2)
  String city;
  @HiveField(3)
  String zipcode;
  @HiveField(4)
  GeoHive geo;

  AddressHive({this.street, this.suite, this.city, this.zipcode, this.geo});

}