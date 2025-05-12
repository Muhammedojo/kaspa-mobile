import 'dart:collection';

import 'package:kaspa/core/data/model/farm_coordinate.dart';

import '../../utils/const.dart';
import 'polygon.dart';

class FarmLocation {
  String? address = "";
  int? wardId = 0;
  double? sizeInHectares = 0.0;
  String? ownershipType = "";
  double? longitude = 0.0;
  double? latitude = 0.0;
  Polygon? polygon;
  List<Coordinates> coordinates = [];

   bool hasDuplicateCoordinates() {
    var coordinateArr = coordinates;
    var coordinateSet = HashSet<String>();
    for (var coordinate in coordinateArr) {
      if (coordinateSet.contains(coordinate.coordinatesLabel())) return true;
      coordinateSet.add(coordinate.coordinatesLabel());
    }
    return false;
  }
FarmLocation();

factory FarmLocation.fromJson(Map<String, dynamic> json) =>
      _$FarmLocationFromJson(json);
  Map<String, dynamic> toJson() => _$FarmLocationToJson(this);
}
FarmLocation _$FarmLocationFromJson(Map<String, dynamic> json) {

var obj = FarmLocation();
obj.address = json[KEY_ADDRESS];
obj.wardId = json[KEY_WARD_ID];
obj.sizeInHectares = json[KEY_FARM_SIZE];
obj.ownershipType = json[KEY_OWNERSHIP_TYPE];
obj.longitude = json[KEY_LONGITUDE];
obj.latitude = json[KEY_LATITUDE];
obj.polygon = json[KEY_POLYGON];
return obj;
 
}

Map<String, dynamic> _$FarmLocationToJson(FarmLocation obj) =>
    <String, dynamic>{
      KEY_ADDRESS: obj.address,
      KEY_WARD_ID: obj.wardId,
      KEY_FARM_SIZE: obj.sizeInHectares,
      KEY_OWNERSHIP_TYPE: obj.ownershipType,
      KEY_LONGITUDE: obj.longitude,
      KEY_LATITUDE: obj.latitude,
      KEY_POLYGON: obj.polygon
    };
