import 'package:isar/isar.dart';
import '../../../core/data/model/certificate.dart';
import '../../../core/data/model/general_model.dart';
import '../../utils/const.dart';
import 'insight.dart';

part 'cooperative.g.dart';

@Collection()
class Cooperative extends GeneralModel {
  Id? id;

  @Index(unique: true, replace: true)
  late int pk = 0;

  String? name = "";
  String? head = "";
  String? code = "";
  String? doi = "";
  int? lgaId = 0;
  bool? isBlacklisted = false;
  bool? isVerified = false;
  int? wardId = 0;
  int? noOfFarmers = 0;
  String? file;
  String? secretary = "";
  String? certificateNumber = "";

  LgaData? lga;

  WardData? ward;

  String? dateOfIncorporation = "";

  Certificate? certificate;

  Cooperative();

  factory Cooperative.fromJson(Map<String, dynamic> json) =>
      _$CooperativeFromJson(json);

  Map<String, dynamic> toJson() => _$CooperativeToJson(this);
}

Cooperative _$CooperativeFromJson(Map<String, dynamic> json) {
  var obj = Cooperative();

  obj.pk = json[KEY_PK];
  obj.name = json[KEY_NAME];
  if (json.containsKey(KEY_LGA) && json[KEY_LGA] != null) {
    obj.lga = LgaData.fromJson(json[KEY_LGA]);
  }

  if (json.containsKey(KEY_WARD) && json[KEY_WARD] != null) {
    obj.ward = WardData.fromJson(json[KEY_WARD]);
  }

  obj.code = json[KEY_CODE];
  obj.isVerified = json[KEY_IS_VERIFIED];
  obj.isBlacklisted = json[KEY_IS_BLACKLISTED];
  obj.head = json[KEY_HEAD];
  obj.noOfFarmers = json[KEY_NO_OF_FARMERS];
  obj.secretary = json[KEY_SECRETARY];
  obj.dateOfIncorporation = json[KEY_DATE_OF_INCORPORATION];
  if (json.containsKey(KEY_CERTIFICATE) && json[KEY_CERTIFICATE] != null) {
    obj.certificate = Certificate.fromJson(json[KEY_CERTIFICATE]);
  }
  obj.created = json[KEY_CREATED_AT];
  obj.updated = json[KEY_UPDATED_AT];

  return obj;
}

Map<String, dynamic> _$CooperativeToJson(Cooperative obj) => <String, dynamic>{
  KEY_NAME: obj.name,
  KEY_LGA_ID: obj.lgaId,
  KEY_HEAD: obj.head,
  KEY_SECRETARY: obj.secretary,
  KEY_DATE_OF_INCORPORATION: obj.dateOfIncorporation,
  KEY_CERTIFICATE: obj.certificate,
  KEY_PK: obj.pk,
  KEY_FILE: obj.file,
  KEY_CERTIFICATE_NUMBER: obj.certificateNumber,
  KEY_WARD_ID: obj.wardId,
  KEY_CREATED_AT: obj.created,
  KEY_UPDATED_AT: obj.updated,
};
