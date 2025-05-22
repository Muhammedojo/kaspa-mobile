import 'package:isar/isar.dart';
import '../../../core/data/model/general_model.dart';
import '../../utils/const.dart';
import 'insight.dart';

part 'market_data.g.dart';

@Collection()
class MarketData extends GeneralModel {
  Id? id;

  @Index(unique: true)
  late int pk = 0;

  MarketObject? market;

  NestedProductObject? product;

  int? marketId;
  int? productId;
  int? lgaId;

  double? price;
  String? date;
  String? volume;

  bool isCrop() => product?.product?.productType == 'Crop' ? true : false;

  MarketData();

  factory MarketData.fromJson(Map<String, dynamic> json) =>
      _$MarketDataFromJson(json);

  Map<String, dynamic> toJson() => _$MarketDataToJson(this);
}

MarketData _$MarketDataFromJson(Map<String, dynamic> json) {
  var obj = MarketData();

  obj.pk = json[KEY_PK] as int;

  obj.market = MarketObject.fromJson(json[KEY_MARKET]);

  if (json[KEY_PRODUCT] != null && json[KEY_PRODUCT] is Map<String, dynamic>) {
    obj.product = NestedProductObject.fromJson(json[KEY_PRODUCT]);
  } else if (json.containsKey(KEY_PRODUCT_ID)) {
    obj.productId = json[KEY_PRODUCT_ID] as int?;
  }

  if (json[KEY_PRICE] != null) {
    obj.price = (json[KEY_PRICE] as num).toDouble();
  } else {
    obj.price = null;
  }
  obj.volume = json[KEY_VOLUME];
  obj.lgaId = json[KEY_LGA_ID];

  obj.date = json[KEY_DATE];

  return obj;
}

Map<String, dynamic> _$MarketDataToJson(MarketData obj) => <String, dynamic>{
  KEY_PRICE: obj.price,
  KEY_MARKET_ID: obj.marketId,
  KEY_PRODUCT_ID: obj.productId,
  KEY_DATE: obj.date,
  KEY_VOLUME: obj.volume,
  KEY_LGA_ID: obj.lgaId,
};
