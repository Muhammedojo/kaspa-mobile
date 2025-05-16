import 'package:isar/isar.dart';
import '../../../core/data/model/general_model.dart';
import '../../utils/const.dart';
import 'market.dart';
import 'product.dart';
import 'product_data.dart';

part 'market_data.g.dart';

@Collection()
class MarketData extends GeneralModel {
  Id? id;

  @Index(unique: true)
  late int pk = 0;

  @ignore
  Market? market;

  @ignore
  ProductData? product;

  int? marketId;
  int? productId;

  double? price;
  String? date;

  MarketData();

  factory MarketData.fromJson(Map<String, dynamic> json) =>
      _$MarketDataFromJson(json);

  Map<String, dynamic> toJson() => _$MarketDataToJson(this);
}

MarketData _$MarketDataFromJson(Map<String, dynamic> json) {
  var obj = MarketData();

  obj.pk = json[KEY_PK] as int;

  if (json[KEY_MARKET] != null && json[KEY_MARKET] is Map<String, dynamic>) {
    obj.market = Market.fromJson(json[KEY_MARKET] as Map<String, dynamic>);
    obj.marketId = obj.market?.pk;
  } else if (json.containsKey(KEY_MARKET_ID)) {
    obj.marketId = json[KEY_MARKET_ID] as int?;
  }

  if (json[KEY_PRODUCT] != null && json[KEY_PRODUCT] is Map<String, dynamic>) {
    obj.product = ProductData.fromJson(
      json[KEY_PRODUCT] as Map<String, dynamic>,
    );

    obj.productId = obj.product?.product?.pk;
  } else if (json.containsKey(KEY_PRODUCT_ID)) {
    obj.productId = json[KEY_PRODUCT_ID] as int?;
  }

  if (json[KEY_PRICE] != null) {
    obj.price = (json[KEY_PRICE] as num).toDouble();
  } else {
    obj.price = null;
  }

  obj.date = json[KEY_DATE] as String?;

  return obj;
}

Map<String, dynamic> _$MarketDataToJson(MarketData obj) => <String, dynamic>{
  KEY_PRICE: obj.price,
  KEY_MARKET_ID: obj.marketId,
  KEY_PRODUCT_ID: obj.productId,
  KEY_DATE: obj.date,
};
