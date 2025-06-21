import 'package:isar/isar.dart';
import '../../utils/const.dart';
import 'insight.dart';

part 'farm_visit.g.dart';

@Collection()
class FarmVisit {
  Id? id;

  @Index(unique: true, replace: true)
  late int pk = 0;

  String? address;
  String? sizeInHa;
  String? ownershipType;
  String? longitude;
  String? latitude;
  int? farmId;
  int? cropId;
  int? noOfHectares;

  List<FarmCrop> farmCrops = [];

  FarmVisit();

  factory FarmVisit.fromJson(Map<String, dynamic> json) =>
      _$FarmVisitFromJson(json);

  Map<String, dynamic> toJson() => _$FarmVisitToJson(this);
}

FarmVisit _$FarmVisitFromJson(Map<String, dynamic> json) {
  var obj = FarmVisit();

  obj.pk = json[KEY_PK];
  obj.address = json[KEY_ADDRESS];
  obj.sizeInHa = json[KEY_SIZE_IN_HA];
  obj.ownershipType = json[KEY_OWNERSHIP_TYPE];
  obj.longitude = json[KEY_LONGITUDE];
  obj.latitude = json[KEY_LATITUDE];
  obj.farmCrops =
      json[KEY_FARM_CROPS]
          .map<FarmCrop>((farmCrop) => FarmCrop.fromJson(farmCrop))
          .toList();

  return obj;
}

Map<String, dynamic> _$FarmVisitToJson(FarmVisit obj) => <String, dynamic>{
  
  KEY_LONGITUDE: obj.longitude,
  KEY_LATITUDE: obj.latitude,
  KEY_FARM_ID: obj.farmId,
  KEY_CROP_ID: obj.cropId,
  KEY_NO_OF_HECTARES: obj.noOfHectares,
  KEY_PK: obj.pk,
};
