// import 'package:isar/isar.dart';
// import '../../utils/const.dart';
// import 'insight.dart';

// @embedded
// class BankDetail {
//   int? id;
//   BankData? bank;
//   String? accountName;
//   String? accountNumber;

//   BankDetail({this.accountName, this.accountNumber, this.bank, this.id});

//   factory BankDetail.fromJson(Map<String, dynamic> json) =>
//       _$BankDetailFromJson(json);

//   Map<String, dynamic> toJson() => _$BankDetailsToJson(this);
// }

// BankDetail _$BankDetailFromJson(Map<String, dynamic> json) {
//   var obj = BankDetail();

//   obj.id = json[KEY_PK];
//   obj.accountName = json[KEY_ACCOUNT_NAME];
//   obj.accountNumber = json[KEY_ACCOUNT_NUMBER];
//   obj.bank = BankData.fromJson(json[KEY_BANK]);

//   return obj;
// }

// Map<String, dynamic> _$BankDetailsToJson(BankDetail obj) => <String, dynamic>{
//   KEY_ACCOUNT_NAME: obj.accountName,
//   KEY_ACCOUNT_NUMBER: obj.accountNumber,
//   KEY_BANK: obj.bank?.toJson(),
//   KEY_PK: obj.id,
// };
