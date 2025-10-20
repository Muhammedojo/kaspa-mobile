import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import '../../../core/data/model/general_model.dart';
import '../../../core/data/model/insight.dart';
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

  Color getCropColor() {
    if (product?.productType?.toLowerCase() == 'crop' &&
        name != null &&
        name!.isNotEmpty) {
      switch (name!.toLowerCase()) {
        case 'maize':
          return Colors.amber[700]!;
        case 'potato':
          return Colors.brown[400]!;
        case 'rice':
          return Colors.yellow[700]!;
        case 'tomato':
          return Colors.red[600]!;
        case 'onion':
          return Colors.purple[700]!;
        default:
          return Colors.green[600]!;
      }
    } else {
      return Colors.grey[500]!;
    }
  }

  IconData getCropIcon() {
    if (name != null && name!.isNotEmpty) {
      switch (name!.toLowerCase()) {
        case 'maize':
          return Icons.grass;
        case 'potato':
          return Icons.circle;
        case 'rice':
          return Icons.grain;
        case 'tomato':
        case 'onion':
          return Icons.circle;
        default:
          return Icons.eco;
      }
    }

    return Icons.eco;
  }

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
