import 'package:isar/isar.dart';
import '../../utils/const.dart';
import 'product.dart';

part 'product_data.g.dart';

@embedded
class ProductData {
  int? pk;

  @ignore
  Product? product;

  String? variety;
  String? unit;

  ProductData();
  factory ProductData.fromJson(Map<String, dynamic> json) =>
      _$ProductDataFromJson(json);
}

ProductData _$ProductDataFromJson(Map<String, dynamic> json) {
  var obj = ProductData();

  obj.pk = json[KEY_PK];
  obj.variety = json[KEY_VARIETY];
  obj.unit = json[KEY_UNIT];
  if (json.containsKey(KEY_PRODUCT) && json[KEY_PRODUCT] != null) {
    obj.product = Product.fromJson(json[KEY_PRODUCT]);
  }

  return obj;
}
