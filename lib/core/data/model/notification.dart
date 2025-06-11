import 'package:isar/isar.dart';

 part 'notification.g.dart';

@Collection()
class Notifications {
  Id? id;

  @Index(unique: true, replace: true)
  late String nid;

  String? subject = "";
  String? message = "";
  bool? isRead = false;

  Notifications();

  factory Notifications.fromJson(Map<String, dynamic> json) =>
      _$NotificationsFromJson(json);
}

Notifications _$NotificationsFromJson(Map<String, dynamic> json) {
  var obj = Notifications();

  obj.nid = json["nid"];
  obj.subject = json["subject"];
  obj.message = json["message"];
  obj.isRead = json["isRead"];

  return obj;
}
