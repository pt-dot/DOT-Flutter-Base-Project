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

  static void saveUser(User user) {
    Box<UserHive> boxUser = Hive.box<UserHive>(DB_USER);
    boxUser.clear().then((int result){
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
    });
  }

  static User getUser() {
    Box<UserHive> boxUser = Hive.box<UserHive>(DB_USER);
    if (boxUser.length > 0) {
      UserHive userHive = boxUser.getAt(0);
      return User(
        id: userHive.id,
        name: userHive.name,
        username: userHive.username,
        email: userHive.email,
        address: Address(
          street: userHive.address.street,
          suite: userHive.address.suite,
          city: userHive.address.city,
          zipcode: userHive.address.zipcode,
          geo: Geo(
            lat: userHive.address.geo.lat,
            lng: userHive.address.geo.lng
          )
        ),
        phone: userHive.phone,
        website: userHive.website,
        company: Company(
          name: userHive.company.name,
          catchPhrase: userHive.company.catchPhrase,
          bs: userHive.company.bs
        )
      );
    } else {
      return User(id: 0);
    }
  }

}