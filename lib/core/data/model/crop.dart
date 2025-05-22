import 'package:isar/isar.dart';
import 'package:kaspa/core/data/model/general_model.dart';
import 'package:kaspa/core/data/model/insight.dart';
import '../../utils/const.dart';

part 'crop.g.dart';

@Collection()
class Crop extends GeneralModel {
  Id? id;

  @Index(unique: true, replace: true)
  late int pk = 0;

  String? name = "";

  ProductObject? product;

  String? variety = "";
  String? unit = "";

  Crop();

  factory Crop.fromJson(Map<String, dynamic> json) => _$CropFromJson(json);
}

Crop _$CropFromJson(Map<String, dynamic> json) {
  var obj = Crop();

  obj.pk = json[KEY_PK];
  obj.name = json[KEY_NAME];
  obj.variety = json[KEY_VARIETY];
  obj.unit = json[KEY_UNIT];
  obj.product = ProductObject.fromJson(json[KEY_PRODUCT]);
  obj.created = json[KEY_CREATED_AT];
  obj.updated = json[KEY_UPDATED_AT];

  return obj;
}
