import 'package:isar/isar.dart';
import 'package:kaspa/core/data/model/bank_detail.dart';
import 'package:kaspa/core/data/model/cooperative.dart';
import 'package:kaspa/core/data/model/nok_details.dart';
import '../../utils/const.dart';
import 'farm.dart';
import 'lga.dart';
import 'ward.dart';

part 'farmer.g.dart';

@Collection()
class Farmer {
  Id? id;

  @Index(unique: true, replace: true)
  late int pk = 0;

  String? folioId;
  String? firstName = "";
  String? lastName = "";
  String? otherNames = "";
  String? title = "";
  String? gender = "";
  String? nin = "";
  String? bvn = "";
  String? address = "";
  String? registrationDate = "";
  String? phoneNumber = "";

  @ignore
  Cooperative? cooperative;

  @ignore
  Farm? farms;

  @ignore
  NokDetails? nokDetails;

  @ignore
  BankDetail? bankDetails;

  @ignore
  Lga? lga;

  @ignore
  Ward? ward;

  List<int>? livestock = [];
  List<int>? crop = [];

  Farmer();

  factory Farmer.fromJson(Map<String, dynamic> json) => _$FarmerFromJson(json);

  Map<String, dynamic> toJson() => _$FarmerToJson(this);
}

Farmer _$FarmerFromJson(Map<String, dynamic> json) {
  var obj = Farmer();

  obj.pk = json[KEY_PK];
  obj.folioId = json[KEY_FOLIO_ID];
  obj.firstName = json[KEY_FIRST_NAME];
  obj.lastName = json[KEY_LAST_NAME];
  obj.otherNames = json[KEY_OTHER_NAME];
  obj.title = json[KEY_TITLE];
  obj.gender = json[KEY_GENDER];
  obj.address = json[KEY_ADDRESS];
  obj.phoneNumber = json[KEY_PHONE_NUMBER];
  obj.nin = json[KEY_NIN];
  obj.bvn = json[KEY_BVN];
  obj.registrationDate = json[KEY_REGISTRATION_DATE];
  obj.cooperative = Cooperative.fromJson(json[KEY_COOPERATIVE]);
  obj.bankDetails = BankDetail.fromJson(json[KEY_BANK_DETAILS]);
  obj.nokDetails = NokDetails.fromJson(json[KEY_NOK_DETAILS]);
  obj.lga = Lga.fromJson(json[KEY_LGA]);
  obj.ward = Ward.fromJson(json[KEY_WARD]);
  obj.farms = Farm.fromJson(json[KEY_FARMS]);
  if (json.containsKey(KEY_COOPERATIVE) && json[KEY_COOPERATIVE] != null) {
    obj.cooperative = Cooperative.fromJson(json[KEY_COOPERATIVE]);
  }
  obj.registrationDate = json[KEY_REGISTRATION_DATE];
  obj.livestock = json[KEY_LIVESTOCK];
  obj.crop = json[KEY_CROPS];

  return obj;
}

Map<String, dynamic> _$FarmerToJson(Farmer obj) => <String, dynamic>{
  KEY_FOLIO_ID: obj.folioId,
  KEY_FIRST_NAME: obj.firstName,
  KEY_LAST_NAME: obj.lastName,
  KEY_OTHER_NAME: obj.otherNames,
  KEY_TITLE: obj.title,
  KEY_GENDER: obj.gender,
  KEY_ADDRESS: obj.address,
  KEY_PHONE_NUMBER: obj.phoneNumber,
  KEY_NIN: obj.nin,
  KEY_BVN: obj.bvn,
  KEY_REGISTRATION_DATE: obj.registrationDate,
  KEY_COOPERATIVE: obj.cooperative,
  KEY_BANK_DETAILS: obj.bankDetails,
  KEY_NOK_DETAILS: obj.nokDetails,
  KEY_LGA: obj.lga,
  KEY_WARD: obj.ward,
  KEY_FARMS: obj.farms,
  KEY_LIVESTOCK: obj.livestock,
  KEY_CROPS: obj.crop,
  KEY_PK: obj.pk,
};
