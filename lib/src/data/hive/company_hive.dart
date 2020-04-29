import 'package:hive/hive.dart';
part 'company_hive.g.dart';

@HiveType(typeId: 1)
class CompanyHive extends HiveObject {

  @HiveField(0)
  String name;
  @HiveField(1)
  String catchPhrase;
  @HiveField(2)
  String bs;

  CompanyHive({this.name, this.catchPhrase, this.bs});

}