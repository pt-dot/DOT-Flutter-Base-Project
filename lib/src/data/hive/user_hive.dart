import 'package:base_flutter/src/data/hive/address_hive.dart';
import 'package:base_flutter/src/data/hive/company_hive.dart';
import 'package:base_flutter/src/data/hive/geo_hive.dart';
import 'package:base_flutter/src/data/hive_constants.dart';
import 'package:base_flutter/src/models/user.dart';
import 'package:hive/hive.dart';
part 'user_hive.g.dart';

@HiveType(typeId: 4)
class UserHive extends HiveObject {

  @HiveField(0)
  int id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String username;
  @HiveField(3)
  String email;
  @HiveField(4)
  AddressHive address;
  @HiveField(5)
  String phone;
  @HiveField(6)
  String website;
  @HiveField(7)
  CompanyHive company;

  UserHive({this.id, this.name, this.username, this.email, this.address, this.phone, this.website, this.company});

  static void saveUser(User user) async{
    Box<UserHive> boxUser = await Hive.openBox<UserHive>(DB_USER);
    boxUser.clear();
    UserHive userHive = UserHive(
      id: user.id,
      name: user.name,
      username: user.username,
      email: user.email,
      address: AddressHive(
        street: user.address.street,
        suite: user.address.suite,
        city: user.address.city,
        zipcode: user.address.zipcode,
        geo: GeoHive(
          lat: user.address.geo.lat,
          lng: user.address.geo.lng
        )
      ),
      phone: user.phone,
      website: user.website,
      company: CompanyHive(
        name: user.company.name,
        catchPhrase: user.company.catchPhrase,
        bs: user.company.bs
      )
    );
    boxUser.add(userHive);
  }

}