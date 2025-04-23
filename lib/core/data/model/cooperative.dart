import 'package:isar/isar.dart';
import 'package:kaspa/core/data/model/certificate.dart';
import 'package:kaspa/core/data/model/general_model.dart';
import '../../utils/const.dart';
import 'lga.dart';

part 'cooperative.g.dart';

@Collection()
class Cooperative extends GeneralModel {
  Id? id;

  @Index(unique: true, replace: true)
  late int pk = 0;

  String? name = "";
  String? head = "";
  String? code = "";
  String? secretary = "";

  @ignore
  Lga? lga;
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
    obj.lga = Lga.fromJson(json[KEY_LGA]);
  }
  
  obj.head = json[KEY_HEAD];
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
  KEY_LGA: obj.lga,
  KEY_HEAD: obj.head,
  KEY_SECRETARY: obj.secretary,
  KEY_DATE_OF_INCORPORATION: obj.dateOfIncorporation,
  KEY_CERTIFICATE: obj.certificate,
};
