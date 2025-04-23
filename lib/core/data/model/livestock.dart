import 'package:isar/isar.dart';
import 'package:kaspa/core/data/model/general_model.dart';
import '../../utils/const.dart';

 part 'livestock.g.dart';

@Collection()
class Livestock extends GeneralModel {
  Id? id;

  @Index(unique: true, replace: true)
  late int pk = 0;

  String? name = "";
  String? variety = "";

  Livestock();

  factory Livestock.fromJson(Map<String, dynamic> json) => _$CropFromJson(json);
}

Livestock _$CropFromJson(Map<String, dynamic> json) {
  var obj = Livestock();

  obj.pk = json[KEY_PK];
  obj.name = json[KEY_NAME];
  obj.variety = json[KEY_LGA];
  obj.created = json[KEY_CREATED_AT];
  obj.updated = json[KEY_UPDATED_AT];

  return obj;
}
