import 'package:isar/isar.dart';
import 'package:kaspa/core/data/model/general_model.dart';
import '../../utils/const.dart';
import 'ward.dart';

part 'farm.g.dart';

@Collection()
class Farm extends GeneralModel {
  Id? id;

  String? address;

  @ignore
  Ward? ward;
  String? sizeInHa;
  String? ownershipType;
  String? polygon;
  String? longitude;
  String? latitude;
  String? soilProfile;
  String? soilType;
  int? wardId;
  


  // "ward_id": 1,
  //   "address": "44, Tester Street",
  //   "size_in_ha": 0,
  //   "ownership_type": "Leased",
  //   "longitude": 6.32322332,
  //   "latitude": -3.23772382,
  //   "polygon": {}

  Farm();

  factory Farm.fromJson(Map<String, dynamic> json) => _$FarmFromJson(json);
    Map<String, dynamic> toJson() => _$FarmToJson(this);
}

Farm _$FarmFromJson(Map<String, dynamic> json) {
  var obj = Farm();

  obj.address = json[KEY_ADDRESS];
  obj.ward = json[KEY_WARD];
  obj.sizeInHa = json[KEY_SIZE_IN_HA];
  obj.ownershipType = json[KEY_OWNERSHIP_TYPE];
  obj.polygon = json[KEY_POLYGON];
  obj.longitude = json[KEY_LONGITUDE];
  obj.latitude = json[KEY_LATITUDE];
  obj.soilProfile = json[KEY_SOIL_PROFILE];
  obj.soilType = json[KEY_SOIL_TYPE];
  obj.created = json[KEY_CREATED_AT];
  obj.updated = json[KEY_UPDATED_AT];

  return obj;
}

Map<String, dynamic> _$FarmToJson(Farm obj) => <String, dynamic>{
  KEY_ADDRESS: obj.address,
  KEY_WARD: obj.ward?.toJson(),
  KEY_SIZE_IN_HA: obj.sizeInHa,
  KEY_OWNERSHIP_TYPE: obj.ownershipType,
  KEY_POLYGON: obj.polygon,
  KEY_LONGITUDE: obj.longitude,
  KEY_LATITUDE: obj.latitude,
  KEY_SOIL_PROFILE: obj.soilProfile,
  KEY_SOIL_TYPE: obj.soilType,
  KEY_CREATED_AT: obj.created,
  KEY_UPDATED_AT: obj.updated,
};

