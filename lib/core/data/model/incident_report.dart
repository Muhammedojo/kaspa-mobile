import 'package:isar/isar.dart';
import '../../utils/const.dart';
import 'insight.dart';

part 'incident_report.g.dart';

@Collection()
class IncidentReport {
  Id? id;

  @Index(unique: true, replace: true)
  late int pk = 0;

  String? date ="";
  int? wardId = 0;
  String? category = "";
  LgaData? lga;
  WardData? ward;
  String? description = "";
  String? title = "";
  String? imageUrl = "";

  IncidentReport();

  factory IncidentReport.fromJson(Map<String, dynamic> json) =>
      _$IncidentReportFromJson(json);

  Map<String, dynamic> toJson() => _$IncidentReportToJson(this);
}

IncidentReport _$IncidentReportFromJson(Map<String, dynamic> json) {
  var obj = IncidentReport();

  obj.pk = json[KEY_PK];
  obj.title = json[KEY_TITLE];
  obj.date = json[KEY_DATE];
  obj.ward = WardData.fromJson(json[KEY_WARD]);
  obj.lga = LgaData.fromJson(json[KEY_LGA]);
  obj.description = json[KEY_DESCRIPTION];
  obj.imageUrl = json[KEY_IMAGE_URL];
  obj.category = json[KEY_CATEGORY];

  return obj;
}

Map<String, dynamic> _$IncidentReportToJson(IncidentReport obj) =>
    <String, dynamic>{
      KEY_PK: obj.pk,
      KEY_TITLE: obj.title,
      KEY_DATE: obj.date,
      KEY_WARD_ID: obj.wardId,
      KEY_IMAGE_URL: obj.imageUrl,
      KEY_LGA_ID: obj.lga?.id,
      KEY_CATEGORY: obj.category,
      KEY_DESCRIPTION: obj.description,
    };
