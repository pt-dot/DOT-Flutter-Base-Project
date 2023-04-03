import 'package:hive/hive.dart';
part 'company_model.g.dart';

@HiveType(typeId: 1)
class CompanyModel extends HiveObject {
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? catchPhrase;
  @HiveField(2)
  String? bs;

  CompanyModel({this.name, this.catchPhrase, this.bs});

  CompanyModel.fromJson(Map<String, dynamic> json) {
    name = json['name'] as String;
    catchPhrase = json['catchPhrase'] as String;
    bs = json['bs'] as String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['catchPhrase'] = catchPhrase;
    data['bs'] = bs;
    return data;
  }
}