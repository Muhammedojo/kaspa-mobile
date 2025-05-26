import 'package:isar/isar.dart';
import '../../utils/const.dart';
import 'general_model.dart';
import 'insight.dart';

part 'market.g.dart';

@Collection()
class Market extends GeneralModel {
  Id? id;

  @Index(unique: true)
  late int pk = 0;

  String? name = "";
  String? address = "";

  LgaData? lga;

  WardData? ward;

  String? marketType = "";
  String? size = "";
  String? marketDays = "";

  int? lgaId = 0;
  int? wardId = 0;
  int? marketId = 0;
  int? productId = 0;
  double? price = 0.0;

  Market();

  factory Market.fromJson(Map<String, dynamic> json) => _$MarketFromJson(json);

  Map<String, dynamic> toJson() => _$MarketToJson(this);
}

Market _$MarketFromJson(Map<String, dynamic> json) {
  var obj = Market();

  obj.pk = json[KEY_PK];
  obj.name = json[KEY_NAME];
  if (json.containsKey(KEY_LGA) && json[KEY_LGA] != null) {
    obj.lga = LgaData.fromJson(json[KEY_LGA]);
  }
  obj.address = json[KEY_ADDRESS];

  if (json.containsKey(KEY_WARD) && json[KEY_WARD] != null) {
    obj.ward = WardData.fromJson(json[KEY_WARD]);
  }

  obj.marketDays = json[KEY_MARKET_DAYS];
  obj.marketType = json[KEY_MARKET_TYPE];
  obj.size = json[KEY_SIZE];
  obj.created = json[KEY_CREATED_AT];
  obj.updated = json[KEY_UPDATED_AT];

  return obj;
}

Map<String, dynamic> _$MarketToJson(Market obj) => <String, dynamic>{
  KEY_NAME: obj.name,
  KEY_LGA: obj.lga,
  KEY_MARKET_DAYS: obj.marketDays,
  KEY_SIZE: obj.size,
  KEY_LGA_ID: obj.lgaId,
  KEY_WARD_ID: obj.wardId,
  KEY_MARKET_ID: obj.marketId,
  KEY_PRODUCT_ID: obj.productId,
  KEY_PRICE: obj.price,
  KEY_MARKET_TYPE: obj.marketType,
  KEY_PK: obj.pk,
  KEY_ADDRESS: obj.address,
};
