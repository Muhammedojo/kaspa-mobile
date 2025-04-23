import 'package:isar/isar.dart';
import 'package:kaspa/core/data/model/general_model.dart';
import '../../utils/const.dart';

part 'nok_details.g.dart';

@Collection()
class NokDetails extends GeneralModel {
  Id? id;

  @Index(unique: true, replace: true)
  late int pk = 0;

  String? name = "";
  String? phoneNumber = "";
  String? relationship = "";

  NokDetails();

  factory NokDetails.fromJson(Map<String, dynamic> json) =>
      _$NokDetailsFromJson(json);
}

NokDetails _$NokDetailsFromJson(Map<String, dynamic> json) {
  var obj = NokDetails();

  obj.pk = json[KEY_PK];
  obj.name = json[KEY_NAME];
  obj.phoneNumber = json[KEY_PHONE_NUMBER];
  obj.relationship = json[KEY_RELATIONSHIP];
  obj.created = json[KEY_CREATED_AT];
  obj.updated = json[KEY_UPDATED_AT];

  return obj;
}
