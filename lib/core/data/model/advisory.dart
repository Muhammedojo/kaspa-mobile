import 'package:isar/isar.dart';
import '../../utils/const.dart';
import 'general_model.dart';
import 'insight.dart';

part 'advisory.g.dart';

@Collection()
class Advisory extends GeneralModel {
  Id? id;

  @Index(unique: true, replace: true)
  late int pk = 0;

  String? title = "";
  String? description = "";
  String? recommendedAction = "";
  String? priority = "";
  String? group = "";
  String? documentUrl = "";

  AudienceData? audience;

  Advisory();

  factory Advisory.fromJson(Map<String, dynamic> json) =>
      _$AdvisoryFromJson(json);
}

Advisory _$AdvisoryFromJson(Map<String, dynamic> json) {
  var obj = Advisory();

  obj.pk = json[KEY_PK];
  obj.title = json[KEY_TITLE];
  obj.description = json[KEY_DESCRIPTION];
  obj.recommendedAction = json[KEY_RECOMMENDED_ACTION];
  obj.priority = json[KEY_PRIORITY];

  if (json.containsKey(KEY_AUDIENCE) && json[KEY_AUDIENCE] != null) {
    obj.audience = AudienceData.fromJson(json[KEY_AUDIENCE]);
  }

  obj.group = json[KEY_GROUP];
  obj.documentUrl = json[KEY_DOCUMENT_URL];
  obj.created = json[KEY_CREATED_AT];
  obj.updated = json[KEY_UPDATED_AT];

  return obj;
}
