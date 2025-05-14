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
  String? accountName = "";
  String? accountNumber = "";
  String? nokName = "";
  String? nokPhoneNumber = "";
  String? nokAddress = "";
  String? nokRelationship = "";
  List<dynamic>? farmLand = [];

  int? wardId = 0;
  String? cooperativeCode = '';
  int? bankId = 0;
  String? age = "";
  String? address = "";
  String? registrationDate = "";
  String? phoneNumber = "";

  List<Map<String, dynamic>>? farms;

  @ignore
  Cooperative? cooperative;

  // @ignore
  // Farm? farms;

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
  obj.age = json[KEY_AGE];
  obj.gender = json[KEY_GENDER];
  obj.address = json[KEY_ADDRESS];
  obj.phoneNumber = json[KEY_PHONE_NUMBER];
  obj.nin = json[KEY_NIN];
  obj.bvn = json[KEY_BVN];
  obj.age = json[KEY_AGE];
  obj.registrationDate = json[KEY_REGISTRATION_DATE];

  if (json.containsKey(KEY_BANK_DETAILS) && json[KEY_BANK_DETAILS] != null) {
    obj.bankDetails = BankDetail.fromJson(json[KEY_BANK_DETAILS]);
  }

  if (json.containsKey(KEY_NOK_DETAILS) && json[KEY_NOK_DETAILS] != null) {
    obj.nokDetails = NokDetails.fromJson(json[KEY_NOK_DETAILS]);
  }

  if (json.containsKey(KEY_LGA) && json[KEY_LGA] != null) {
    obj.lga = Lga.fromJson(json[KEY_LGA]);
  }

  if (json.containsKey(KEY_WARD) && json[KEY_WARD] != null) {
    obj.ward = Ward.fromJson(json[KEY_WARD]);
  }

  if (json.containsKey(KEY_FARMS) && json[KEY_FARMS] != null) {
    var farmDataFromServer = json[KEY_FARMS] as List<dynamic>?;
    if (farmDataFromServer != null) {
      obj.farms =
          farmDataFromServer
              .map((farm) => Map<String, dynamic>.from(farm as Map))
              .toList();
    }
  }

  if (json.containsKey(KEY_COOPERATIVE) && json[KEY_COOPERATIVE] != null) {
    obj.cooperative = Cooperative.fromJson(json[KEY_COOPERATIVE]);
  }
  obj.registrationDate = json[KEY_REGISTRATION_DATE];
  obj.livestock = json[KEY_LIVESTOCK];
  obj.crop = json[KEY_CROP];

  return obj;
}

Map<String, dynamic> _$FarmerToJson(Farmer obj) => <String, dynamic>{
  KEY_FOLIO_ID: obj.folioId,
  KEY_FIRST_NAME: obj.firstName,
  KEY_LAST_NAME: obj.lastName,
  KEY_OTHER_NAME: obj.otherNames,
  KEY_AGE: obj.age,
  KEY_TITLE: obj.title,
  KEY_GENDER: obj.gender,
  KEY_ADDRESS: obj.address,
  KEY_PHONE_NUMBER: obj.phoneNumber,
  KEY_NIN: obj.nin,
  KEY_ACCOUNT_NAME: obj.accountName,
  KEY_ACCOUNT_NUMBER: obj.accountNumber,
  KEY_NOK_NAME: obj.nokName,
  KEY_BANK_ID: obj.bankId,
  KEY_NOK_PHONE_NUMBER: obj.nokPhoneNumber,
  KEY_NOK_ADDRESS: obj.nokAddress,
  KEY_NOK_RELATIONSHIP: obj.nokRelationship,
  KEY_FARMS: obj.farms,
  KEY_BVN: obj.bvn,
  KEY_REGISTRATION_DATE: obj.registrationDate,
  KEY_LGA: obj.lga,
  KEY_WARD_ID: obj.wardId,
  KEY_LIVESTOCK_ID: obj.livestock,
  KEY_CROP_ID: obj.crop,
};
