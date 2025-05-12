import 'package:isar/isar.dart';
import 'package:kaspa/core/data/model/general_model.dart';
import '../../utils/const.dart';

part 'bank.g.dart';

@Collection()
class Bank extends GeneralModel {
  Id? id;

  @Index(unique: true, replace: true)
  late int pk = 0;

  String? name = "";

  Bank();

  factory Bank.fromJson(Map<String, dynamic> json) => _$BankFromJson(json);
    Map<String, dynamic> toJson() => _$BankToJson(this);
}

Bank _$BankFromJson(Map<String, dynamic> json) {
  var obj = Bank();

  obj.pk = json[KEY_PK];
  obj.name = json[KEY_NAME];
  obj.created = json[KEY_CREATED_AT];
  obj.updated = json[KEY_UPDATED_AT];

  return obj;
}

Map<String, dynamic> _$BankToJson(Bank obj) => <String, dynamic>{
  KEY_NAME: obj.name,
  KEY_PK: obj.pk,
  KEY_CREATED_AT: obj.created,
  KEY_UPDATED_AT: obj.updated,
};


