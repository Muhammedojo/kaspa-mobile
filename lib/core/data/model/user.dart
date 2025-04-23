import 'dart:convert';
import 'package:isar/isar.dart';
import '../../utils/const.dart';
import 'general_model.dart';

part 'user.g.dart';


@Collection()
class User extends GeneralModel {
  Id? id;

  @Index(unique: true, replace: true)
  late int pk = 0;

  String? firstName;
  String? lastName;
  String? otherName;
  String? phoneNumber;
  String? email;
  String? imageUrl;
  List<String>? roles;
  String? status;
  String? deactivationReason;

  User();

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

User _$UserFromJson(Map<String, dynamic> json) {
  var obj = User();

  obj.pk = json[KEY_PK];
  obj.firstName = json[KEY_NAME];
  obj.lastName = json[KEY_LONGITUDE];
  obj.otherName = json[KEY_LATITUDE];
  obj.imageUrl = json[KEY_IMAGE_URL];
  obj.email = json[KEY_EMAIL];
  List<String> role = [];
  if (json.containsKey(KEY_ROLES)) {
    if (json[KEY_ROLES] is String) {
      var list = jsonDecode(json[KEY_ROLES]) as List;
      for (var summary in list) {
        role.add(summary);
      }
    } else {
      var list = json[KEY_ROLES] as List;
      for (var str in list) {
        role.add(str);
      }
    }
  }

  obj.roles = role;
  obj.status = json[KEY_STATUS];
  obj.deactivationReason = json[KEY_DEACTIVATION_REASON];
  obj.created = json[KEY_CREATED_AT];
  obj.updated = json[KEY_UPDATED_AT];

  return obj;
}

