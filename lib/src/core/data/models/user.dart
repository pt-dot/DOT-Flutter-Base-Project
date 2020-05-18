import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
part 'user.g.dart';

@HiveType(typeId: 4)
class User  extends Equatable with HiveObject{

  @HiveField(0)
  int id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String username;
  @HiveField(3)
  String email;
  @HiveField(4)
  Address address;
  @HiveField(5)
  String phone;
  @HiveField(6)
  String website;
  @HiveField(7)
  Company company;

  User(
      {this.id,
        this.name,
        this.username,
        this.email,
        this.address,
        this.phone,
        this.website,
        this.company});

  static User fromJson(Map<String, dynamic> json) {
    return User(
        id : json['id'] as int,
        name : json['name'] as String,
        username : json['username'] as String,
        email : json['email'] as String,
        address : json['address'] != null ? Address.fromJson(json['address'] as Map<String, dynamic>) : null,
        phone : json['phone'] as String,
        website : json['website'] as String,
        company : json['company'] != null ? Company.fromJson(json['company'] as Map<String, dynamic>) : null
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['username'] = username;
    data['email'] = email;
    if (address != null) {
      data['address'] = address.toJson();
    }
    data['phone'] = phone;
    data['website'] = website;
    if (company != null) {
      data['company'] = company.toJson();
    }
    return data;
  }

  @override
  List<Object> get props => [id, name, username, email, address, phone, website, company];

}

@HiveType(typeId: 3)
class Address extends Equatable with HiveObject {

  @HiveField(0)
  String street;
  @HiveField(1)
  String suite;
  @HiveField(2)
  String city;
  @HiveField(3)
  String zipcode;
  @HiveField(4)
  Geo geo;

  Address({this.street, this.suite, this.city, this.zipcode, this.geo});

  Address.fromJson(Map<String, dynamic> json) {
    street = json['street'] as String;
    suite = json['suite'] as String;
    city = json['city'] as String;
    zipcode = json['zipcode'] as String;
    geo = json['geo'] != null ? Geo.fromJson(json['geo'] as Map<String, dynamic>) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['street'] = street;
    data['suite'] = suite;
    data['city'] = city;
    data['zipcode'] = zipcode;
    if (geo != null) {
      data['geo'] = geo.toJson();
    }
    return data;
  }

  @override
  List<Object> get props => [street, suite, city, zipcode, geo];

}

@HiveType(typeId: 2)
class Geo extends Equatable with HiveObject{

  @HiveField(0)
  String lat;
  @HiveField(1)
  String lng;

  Geo({this.lat, this.lng});

  Geo.fromJson(Map<String, dynamic> json) {
    lat = json['lat'] as String;
    lng = json['lng'] as String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = lat;
    data['lng'] = lng;
    return data;
  }

  @override
  List<Object> get props => [lat, lng];

}

@HiveType(typeId: 1)
class Company extends Equatable with HiveObject {

  @HiveField(0)
  String name;
  @HiveField(1)
  String catchPhrase;
  @HiveField(2)
  String bs;

  Company({this.name, this.catchPhrase, this.bs});

  Company.fromJson(Map<String, dynamic> json) {
    name = json['name'] as String;
    catchPhrase = json['catchPhrase'] as String;
    bs = json['bs'] as String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = name;
    data['catchPhrase'] = catchPhrase;
    data['bs'] = bs;
    return data;
  }

  @override
  List<Object> get props => [name, catchPhrase, bs];

}