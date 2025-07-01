import 'dart:convert';

import 'package:isar/isar.dart';
import 'package:kaspa/core/data/model/general_model.dart';
import '../../utils/const.dart';
import 'insight.dart';
import 'ward.dart';

part 'farm.g.dart';

@Collection()
class Farm extends GeneralModel {
  Id? id;

  String? address;


  WardData? ward;
  String? sizeInHa;
  String? ownershipType;
  String? polygon;
  String? longitude;
  String? latitude;
  String? soilProfile;
  String? soilType;
  int? wardId;

  Farm();

  factory Farm.fromJson(Map<String, dynamic> json) => _$FarmFromJson(json);
  Map<String, dynamic> toJson() => _$FarmToJson(this);
}

Farm _$FarmFromJson(Map<String, dynamic> json) {
  var obj = Farm();

  obj.address = json[KEY_ADDRESS];
 if (json.containsKey(KEY_WARD) && json[KEY_WARD] != null) {
    obj.ward = WardData.fromJson(json[KEY_WARD]);
  }
  obj.sizeInHa = json[KEY_SIZE_IN_HA];
  obj.ownershipType = json[KEY_OWNERSHIP_TYPE];
  obj.polygon = json[KEY_POLYGON];
  obj.longitude = json[KEY_LONGITUDE];
  obj.latitude = json[KEY_LATITUDE];
  obj.soilProfile = json[KEY_SOIL_PROFILE];
  obj.soilType = json[KEY_SOIL_TYPE];
  obj.created = json[KEY_CREATED_AT];
  obj.updated = json[KEY_UPDATED_AT];
  obj.id = json[KEY_PK];


  return obj;
}

Map<String, dynamic> _$FarmToJson(Farm obj) => <String, dynamic>{
  KEY_ADDRESS: obj.address,
  KEY_WARD_ID: obj.wardId,
  KEY_SIZE_IN_HA: double.tryParse(obj.sizeInHa ?? '0') ?? 0,
  KEY_OWNERSHIP_TYPE: obj.ownershipType,
  KEY_POLYGON: obj.polygon != null ? jsonDecode(obj.polygon!) : {},
  KEY_LONGITUDE: double.tryParse(obj.longitude ?? '0.0') ?? 0.0,
  KEY_LATITUDE: double.tryParse(obj.latitude ?? '0.0') ?? 0.0,
  KEY_SOIL_PROFILE: obj.soilProfile,
  KEY_SOIL_TYPE: obj.soilType,
  KEY_CREATED_AT: obj.created,
  KEY_UPDATED_AT: obj.updated,
};
