import 'package:isar/isar.dart';
import '../../../core/data/model/insight.dart';
import '../../utils/const.dart';

part 'crop_activities.g.dart';

@Collection()
class CropActivities {
  Id? id;

  @Index(unique: true, replace: true)
  late int pk = 0;

  ActivityObject? activity;

  bool? isComplete = false;
  int? farmCropId = 0;

  CropActivities();

  factory CropActivities.fromJson(Map<String, dynamic> json) =>
      _$CropActivitiesFromJson(json);
}

CropActivities _$CropActivitiesFromJson(Map<String, dynamic> json) {
  var obj = CropActivities();

  obj.pk = json[KEY_PK];
  obj.activity = ActivityObject.fromJson(json[KEY_ACTIVITY]);
  obj.isComplete = json[KEY_IS_COMPLETE];
  obj.farmCropId = json[KEY_FARM_CROP_ID];

  return obj;
}
