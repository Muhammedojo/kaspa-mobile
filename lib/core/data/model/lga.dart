import 'package:isar/isar.dart';
import '../../utils/const.dart';

part 'lga.g.dart';

@Collection()
class Lga {
  Id? id;

  @Index(unique: true, replace: true)
  late int pk = 0;

  String? name = "";
  String? longitude = "";
  String? latitude = "";
  String? created = "";
  String? updated = "";

  Lga();

  factory Lga.fromJson(Map<String, dynamic> json) => _$LgaFromJson(json);
}

Lga _$LgaFromJson(Map<String, dynamic> json) {
  var obj = Lga();

  obj.pk = json[KEY_PK] ?? 0;
  obj.name = json[KEY_NAME];
  obj.longitude = json[KEY_LONGITUDE];
  obj.latitude = json[KEY_LATITUDE];
  obj.created = json[KEY_CREATED_AT];
  obj.updated = json[KEY_UPDATED_AT];

  return obj;
}
