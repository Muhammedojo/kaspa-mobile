import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:isar/isar.dart';
import '../../../core/data/model/general_model.dart';
import '../../../../core/data/model/insight.dart';
import '../../resources/vectors.dart';
import '../../utils/const.dart';

part 'crop_calendar.g.dart';

@Collection()
class CropCalendar extends GeneralModel {
  Id? id;

  @Index(unique: true, replace: true)
  late int pk = 0;

  String? stage = "";

  CropData? crop;

  List<ActivityObject> activities = [];

  CropCalendar();

  Color getStageColor() {
    if (stage != null) {
      switch (stage?.toLowerCase()) {
        case 'harvesting':
          return Colors.amber[700]!;
        case 'planting':
          return Colors.yellow[700]!;
        default:
          return Colors.green[600]!;
      }
    } else {
      return Colors.grey[500]!;
    }
  }

  getCropIcon() {
    if (crop?.product?.productType?.toLowerCase() == 'crop' &&
        crop?.product?.name != null) {
      return SvgPicture.asset(AppIcon.crop);
    }

    return SvgPicture.asset(AppIcon.livestock);
  }

  factory CropCalendar.fromJson(Map<String, dynamic> json) =>
      _$CropCalendarFromJson(json);
}

CropCalendar _$CropCalendarFromJson(Map<String, dynamic> json) {
  var obj = CropCalendar();

  obj.pk = json[KEY_PK];
  obj.stage = json[KEY_STAGE];
  obj.crop = CropData.fromJson(json[KEY_CROP]);
  obj.activities =
      json[KEY_ACTIVITIES]
          .map<ActivityObject>((activity) => ActivityObject.fromJson(activity))
          .toList();

  return obj;
}
