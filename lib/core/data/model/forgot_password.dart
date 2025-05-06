import '../../utils/const.dart';

class ForgotPassword {
  String? email;
  String? username;
  String? token;
  String? oldPassword;
  String? newPassword;

  ForgotPassword();

  factory ForgotPassword.fromJson(Map<String, dynamic> json) =>
      _$ForgotPasswordFromJson(json);
  Map<String, dynamic> toJson() => _$ForgotPasswordToJson(this);
}

ForgotPassword _$ForgotPasswordFromJson(Map<String, dynamic> json) {
  var obj = ForgotPassword();

  if (json.containsKey(KEY_EMAIL)) obj.email = json[KEY_EMAIL];

  if(json.containsKey(KEY_TOKEN)) obj.token = json[KEY_TOKEN];

  

  if (json.containsKey(KEY_USERNAME)) obj.username = json[KEY_USERNAME];

  if (json.containsKey(KEY_OLD_PASSWORD)) {
    obj.oldPassword = json[KEY_OLD_PASSWORD];
  }

  if (json.containsKey(KEY_NEW_PASSWORD)) {
    obj.newPassword = json[KEY_NEW_PASSWORD];
  }

  return obj;
}

Map<String, dynamic> _$ForgotPasswordToJson(ForgotPassword obj) =>
    <String, dynamic>{
      KEY_EMAIL: obj.email,
      KEY_USERNAME: obj.username,
      KEY_NEW_PASSWORD: obj.newPassword,
      KEY_OLD_PASSWORD: obj.oldPassword,
      KEY_TOKEN: obj.token,
    };
