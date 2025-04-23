import 'package:isar/isar.dart';
import '../../utils/const.dart';

part 'certificate.g.dart';

@embedded
class Certificate {
  String? fileUrl = "";
  String? fileName = "";
  int? fileSize = 0;
  int? pk = 0;
  String? fileType = "";

  Certificate();
  factory Certificate.fromJson(Map<String, dynamic> json) =>
      _$CertificateFromJson(json);
}

Certificate _$CertificateFromJson(Map<String, dynamic> json) {
  var obj = Certificate();

  obj.pk = json[KEY_PK];
  obj.fileName = json[KEY_FILE_NAME];
  obj.fileSize = json[KEY_FILE_SIZE];
  obj.fileType = json[KEY_FILE_TYPE];
  obj.fileUrl = json[KEY_FILE_URL];

  return obj;
}
