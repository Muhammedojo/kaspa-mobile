import 'package:isar/isar.dart';
import 'package:kaspa/core/data/model/product_data.dart';
import 'package:kaspa/core/data/model/ward.dart';
import '../../utils/const.dart';
import 'general_model.dart';
import 'lga.dart';

part 'market.g.dart';

@Collection()
class Market extends GeneralModel {
  Id? id;

  @Index(unique: true)
  late int pk = 0;

  String? name = "";
  String? address = "";

  @ignore
  Lga? lga;

  ProductData? productData;

  @ignore
  Ward? ward;

  String? marketType = "";
  String? size = "";
  String? marketDays = "";

  Market();

  factory Market.fromJson(Map<String, dynamic> json) => _$MarketFromJson(json);

  Map<String, dynamic> toJson() => _$MarketToJson(this);
}

Market _$MarketFromJson(Map<String, dynamic> json) {
  var obj = Market();

  obj.pk = json[KEY_PK];
  obj.name = json[KEY_NAME];
  if (json.containsKey(KEY_LGA) && json[KEY_LGA] != null) {
    obj.lga = Lga.fromJson(json[KEY_LGA]);
  }
  obj.address = json[KEY_ADDRESS];
  obj.productData = ProductData.fromJson(json[KEY_PRODUCT_DATA]);
  obj.ward = Ward.fromJson(json[KEY_WARD]);
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
  KEY_MARKET_TYPE: obj.marketType,
  KEY_PK: obj.pk,
  KEY_ADDRESS: obj.address,
};
