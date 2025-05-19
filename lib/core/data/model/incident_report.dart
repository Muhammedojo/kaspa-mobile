import 'package:isar/isar.dart';
import '../../utils/const.dart';
import 'insight.dart';

part 'incident_report.g.dart';

@Collection()
class IncidentReport {
  Id? id;

  @Index(unique: true, replace: true)
  late int pk;

  String? date;
  int? wardId;
  int? lgaId;
  WardData? ward;
  String? description;
  String? title;

  IncidentReport();

  factory IncidentReport.fromJson(Map<String, dynamic> json) =>
      _$IncidentReportFromJson(json);

  Map<String, dynamic> toJson() => _$IncidentReportToJson(this);
}

IncidentReport _$IncidentReportFromJson(Map<String, dynamic> json) {
  var obj = IncidentReport();

  obj.pk = json[KEY_PK] ?? 0;
  obj.title = json[KEY_TITLE];
  obj.date = json[KEY_DATE];
  obj.ward = json[KEY_WARD];
  obj.wardId = json[KEY_WARD_ID];
  obj.lgaId = json[KEY_LGA_ID];
  obj.description = json[KEY_DESCRIPTION];

  return obj;
}

Map<String, dynamic> _$IncidentReportToJson(IncidentReport obj) =>
    <String, dynamic>{
      KEY_PK: obj.pk,
      KEY_TITLE: obj.title,
      KEY_DATE: obj.date,
      KEY_WARD_ID: obj.wardId,
      KEY_LGA_ID: obj.lgaId,
      KEY_DESCRIPTION: obj.description,
    };
