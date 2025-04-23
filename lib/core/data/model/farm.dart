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

  Farm();

  factory Farm.fromJson(Map<String, dynamic> json) => _$FarmFromJson(json);
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
