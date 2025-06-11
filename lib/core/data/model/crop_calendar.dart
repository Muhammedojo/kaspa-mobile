import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import '../../../core/data/model/general_model.dart';
import '../../../../core/data/model/insight.dart';
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

    Color getCropColor() {
    if (crop?.product?.productType?.toLowerCase() == 'crop' &&
        crop?.product?.name != null ) {
      switch (crop?.product?.name!.toLowerCase()) {
        case 'maize':
          return Colors.amber[700]!;
        case 'potato':
          return Colors.brown[400]!;
        case 'rice':
          return Colors.yellow[700]!;
        case 'tomato':
          return Colors.red[600]!;
        case 'onion':
          return Colors.purple[700]!;
        default:
          return Colors.green[600]!;
      }
    } else {
      return Colors.grey[500]!;
    }
  }

  IconData getCropIcon() {
    if (crop?.product?.productType?.toLowerCase() == 'crop' &&
        crop?.product?.name != null) {
      switch (crop?.product?.name!.toLowerCase()) {
        case 'maize':
          return Icons.grass;
        case 'potato':
          return Icons.circle;
        case 'rice':
          return Icons.grain;
        case 'tomato':
        case 'onion':
          return Icons.circle;
        default:
          return Icons.eco;
      }
    }

    return Icons.eco;
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
