import 'package:isar/isar.dart';

import '../../utils/const.dart';
import 'insight.dart';

part 'plot.g.dart';

@Collection()
class Plot {
  Id? id;

  @Index(unique: true, replace: true)
  late int pk = 0;

  String? address;
  String? sizeInHa;
  String? ownershipType;
  String? longitude;
  String? latitude;
  List<FarmCrop> farmCrops = [];

  Plot();

  factory Plot.fromJson(Map<String, dynamic> json) => _$PlotFromJson(json);
}

Plot _$PlotFromJson(Map<String, dynamic> json) {
  var obj = Plot();

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
