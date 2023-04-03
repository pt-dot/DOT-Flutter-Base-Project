import 'package:base_flutter/src/core/models/address_model.dart';
import 'package:base_flutter/src/core/models/company_model.dart';
import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 4)
class UserModel extends HiveObject {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? username;
  @HiveField(3)
  String? email;
  @HiveField(4)
  AddressModel? address;
  @HiveField(5)
  String? phone;
  @HiveField(6)
  String? website;
  @HiveField(7)
  CompanyModel? company;

  UserModel({
    this.id,
    this.name,
    this.username,
    this.email,
    this.address,
    this.phone,
    this.website,
    this.company,
  });

  static UserModel fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'] != null
            ? json['id'] is String
                ? int.parse(json['id'] as String)
                : json['id'] as int
            : null,
        name: json['name'] != null ? json['name'] as String : null,
        username: json['username'] != null ? json['username'] as String : null,
        email: json['email'] != null ? json['email'] as String : null,
        address: json['address'] != null
            ? AddressModel.fromJson(json['address'] as Map<String, dynamic>)
            : null,
        phone: json['phone'] != null ? json['phone'] as String : null,
        website: json['website'] != null ? json['website'] as String : null,
        company: json['company'] != null
            ? CompanyModel.fromJson(json['company'] as Map<String, dynamic>)
            : null);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['username'] = username;
    data['email'] = email;
    if (address != null) {
      data['address'] = address?.toJson();
    }
    data['phone'] = phone;
    data['website'] = website;
    if (company != null) {
      data['company'] = company?.toJson();
    }
    return data;
  }
}
