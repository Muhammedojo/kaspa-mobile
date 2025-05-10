import 'package:isar/isar.dart';
import '../../../core/data/model/general_model.dart';
import '../../utils/const.dart';
import 'market.dart';
import 'product.dart';

part 'market_data.g.dart';

@Collection()
class MarketData extends GeneralModel {
  Id? id;

  @Index(unique: true)
  late int pk = 0;

  @ignore
  Market? market;

  @ignore
  Product? product;

  String? price;
  String? date;

  MarketData();

  factory MarketData.fromJson(Map<String, dynamic> json) =>
      _$MarketDataFromJson(json); 

        Map<String, dynamic> toJson() => _$MarketDataToJson(this);


}
MarketData _$MarketDataFromJson(Map<String, dynamic> json) {
  var obj = MarketData();
  
  obj.pk = json[KEY_PK];
  obj.market = Market.fromJson(json[KEY_MARKET]);
  obj.product = Product.fromJson(json[KEY_PRODUCT]);
  obj.price = json[KEY_PRICE];
  obj.date = json[KEY_DATE];

  return obj;
}

Map<String, dynamic> _$MarketDataToJson(MarketData obj) => <String, dynamic>{
  KEY_MARKET: obj.market,
  KEY_PRODUCT: obj.product,
  KEY_PRICE: obj.price,
  KEY_DATE: obj.date,

};