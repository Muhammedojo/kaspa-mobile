import 'package:isar/isar.dart';
import '../../utils/const.dart';

class Login {
  Id? userId;

  String? fullname;
  String? username;
  String? email;
  String? userType;

  String? token;
  List<int>? roles;
  List<String>? permissions = [];
  String? status;
  String? registrationDate;
  String? password;
  String? lastLogin;
  String? error;
  String? statusMessage;
  String statusCode = '400';
  String? responseCode;
  String? message;

  Login();

  bool isRequestSuccessful() => responseCode == "100";
  bool isValidationError() => message == VALIDATION_STATUS_MESSAGE;

  factory Login.fromJson(Map<String, dynamic> json) => _$LoginFromJson(json);
  Map<String, dynamic> toJson() => _$LoginToJson(this);
}

Login _$LoginFromJson(Map<String, dynamic> json) {
  var obj = Login();

  obj.token = json[KEY_ACCESS_TOKEN];
  obj.fullname = json[KEY_FULL_NAME];
  obj.username = json[KEY_USERNAME];
  obj.userType = json[KEY_USER_TYPE];

  List<int> roles = [];
  if (json.containsKey(KEY_ROLES)) {
    var list = json[KEY_ROLES] as List;
    for (var int in list) {
      roles.add(int);
    }
  }
  obj.roles = roles;
  List<String> perms = [];
  if (json.containsKey(KEY_PERMISSIONS)) {
    var list = json[KEY_PERMISSIONS] as List;
    for (var str in list) {
      perms.add(str);
    }
  }
  obj.permissions = perms;

  return obj;
}

Map<String, dynamic> _$LoginToJson(Login obj) => <String, dynamic>{
  KEY_ACCESS_TOKEN: obj.token,
  KEY_FULL_NAME: obj.fullname,
  KEY_USERNAME: obj.username,
  KEY_USER_TYPE: obj.userType,
  KEY_ROLES: obj.roles,
  KEY_PERMISSIONS: obj.permissions,
};
