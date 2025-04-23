import 'package:isar/isar.dart';
import 'package:kaspa/core/data/model/general_model.dart';
import '../../utils/const.dart';
import 'bank.dart';

part 'bank_detail.g.dart';

@Collection()
class BankDetail extends GeneralModel {
  Id? id;

  @Index(unique: true, replace: true)
  late int pk = 0;

  @ignore
  Bank? bank;
  String? accountName = "";
  String? accountNumber = "";

  BankDetail();

  factory BankDetail.fromJson(Map<String, dynamic> json) =>
      _$BankDetailFromJson(json);
}

BankDetail _$BankDetailFromJson(Map<String, dynamic> json) {
  var obj = BankDetail();

  obj.pk = json[KEY_PK];
  obj.accountName = json[KEY_ACCOUNT_NAME];
  obj.accountNumber = json[KEY_ACCOUNT_NUMBER];
  obj.bank = Bank.fromJson(json[KEY_BANK]);
  obj.created = json[KEY_CREATED_AT];
  obj.updated = json[KEY_UPDATED_AT];

  return obj;
}
