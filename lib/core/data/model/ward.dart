import 'package:isar/isar.dart';
import 'package:kaspa/core/data/model/general_model.dart';
import '../../utils/const.dart';
import 'insight.dart';
import 'lga.dart';

part 'ward.g.dart';

@Collection()
class Ward extends GeneralModel {
  Id? id;

  @Index(unique: true, replace: true)
  late int pk = 0;

  String? name = "";

 
  LgaData? lga;

  Ward();

  factory Ward.fromJson(Map<String, dynamic> json) => _$WardFromJson(json);

    Map<String, dynamic> toJson() => _$WardToJson(this);
}

Ward _$WardFromJson(Map<String, dynamic> json) {
  var obj = Ward();

  obj.pk = json[KEY_PK] ?? 0;
  obj.name = json[KEY_NAME];
 obj.lga = json[KEY_LGA] != null ? LgaData.fromJson(json[KEY_LGA]) : null;
  obj.created = json[KEY_CREATED_AT];
  obj.updated = json[KEY_UPDATED_AT];

  return obj;
}

Map<String, dynamic> _$WardToJson(Ward obj) => <String, dynamic>{
  KEY_NAME: obj.name,
  KEY_PK: obj.pk,
  KEY_CREATED_AT: obj.created,
  KEY_UPDATED_AT: obj.updated,
};


