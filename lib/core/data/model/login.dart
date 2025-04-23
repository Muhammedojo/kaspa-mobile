import 'package:isar/isar.dart';

import '../../utils/const.dart';

class Login {
  Id? userId;

  String? fullname;
  String? username;
  String? email;
  String? token;
  String? role;
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

  obj.token = json[KEY_TOKEN];

  return obj;
}

Map<String, dynamic> _$LoginToJson(Login obj) => <String, dynamic>{
      KEY_TOKEN: obj.token,
    
      };