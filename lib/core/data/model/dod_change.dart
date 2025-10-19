import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import '../../../core/data/model/general_model.dart';
import '../../utils/const.dart';

part 'dod_change.g.dart';

@Collection()
class DodChange extends GeneralModel {
  Id? id;

  @Index(unique: true, replace: true)
  late int pk = 0;

  String? name = "";
  String? variety = "";
  double? averagePrice = 0.0;
  double? changePercent = 0.0;

  DodChange();

  factory DodChange.fromJson(Map<String, dynamic> json) =>
      _$DodChangeFromJson(json);
}

DodChange _$DodChangeFromJson(Map<String, dynamic> json) {
  var obj = DodChange();
  debugPrint('DOD Change from JSON: $json');
  // obj.pk = json[KEY_PK];
  obj.name = json[KEY_NAME];
  obj.variety = json[KEY_VARIETY];
  obj.averagePrice = double.tryParse(
    json[KEY_AVERAGE_PRICE]?.toString() ?? '0.0',
  );
  obj.changePercent = double.tryParse(
    json[KEY_CHANGE_PERCENT]?.toString() ?? '0.0',
  );

  return obj;
}
