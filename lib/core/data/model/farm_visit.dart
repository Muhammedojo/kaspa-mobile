import 'package:isar/isar.dart';
import '../../utils/const.dart';

part 'farm_visit.g.dart';

@Collection()
class FarmVisit {
  Id? id;

  @Index(unique: true, replace: true)
  late int pk = 0;

  String? name = "";
  String? longitude = "";
  int? farmerId = 0;
  String? latitude = "";
  double? volume = 0.0;
  String? created = "";
  String? updated = "";

  FarmVisit();

  factory FarmVisit.fromJson(Map<String, dynamic> json) => _$FarmVisitFromJson(json);

    Map<String, dynamic> toJson() => _$FarmVisitToJson(this);
}

FarmVisit _$FarmVisitFromJson(Map<String, dynamic> json) {
  var obj = FarmVisit();

  obj.pk = json[KEY_PK] ?? 0;
  obj.name = json[KEY_NAME];
  obj.longitude = json[KEY_LONGITUDE];
  obj.latitude = json[KEY_LATITUDE];
  obj.created = json[KEY_CREATED_AT];
  obj.updated = json[KEY_UPDATED_AT];
  obj.farmerId = json[KEY_FARMER_ID];
  obj.volume = json[KEY_VOLUME];


  return obj;
}

Map<String, dynamic> _$FarmVisitToJson(FarmVisit obj) => <String, dynamic>{
  KEY_NAME: obj.name,
  KEY_LONGITUDE: obj.longitude,
  KEY_LATITUDE: obj.latitude,
  KEY_FARMER_ID: obj.farmerId,
  KEY_VOLUME: obj.volume,
  KEY_PK: obj.pk,
  KEY_CREATED_AT: obj.created,
  KEY_UPDATED_AT: obj.updated,
};


