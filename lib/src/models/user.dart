import 'package:equatable/equatable.dart';

class User  extends Equatable {

  int id;
  String name;
  String username;
  String email;
  Address address;
  String phone;
  String website;
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

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    name = json['name'] as String;
    username = json['username'] as String;
    email = json['email'] as String;
    address =
    json['address'] != null ? Address.fromJson(json['address'] as Map<String, dynamic>) : null;
    phone = json['phone'] as String;
    website = json['website'] as String;
    company =
    json['company'] != null ? Company.fromJson(json['company'] as Map<String, dynamic>) : null;
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

class Address extends Equatable {

  String street;
  String suite;
  String city;
  String zipcode;
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

class Geo extends Equatable {

  String lat;
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

class Company extends Equatable {

  String name;
  String catchPhrase;
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