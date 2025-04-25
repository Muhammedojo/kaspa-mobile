import '../../utils/const.dart';

class LastRequestUrl {
  String? bank;
  String? crop;
  String? cooperative;
  String? farmer;
  String? lga;
  String? livestock;
  String? ward;
  String? state;
  String? market;

  LastRequestUrl();

  factory LastRequestUrl.fromJson(Map<String, dynamic> json) =>
      _$LastRequestUrlFromJson(json);
  Map<String, dynamic> toJson() => _$LastRequestUrlToJson(this);
}

LastRequestUrl _$LastRequestUrlFromJson(Map<String, dynamic> json) {
  var obj = LastRequestUrl();

  obj.bank = json[KEY_BANK];
  obj.crop = json[KEY_CROP];
  obj.cooperative = json[KEY_COOPERATIVE];
  obj.farmer = json[KEY_FARMER];
  obj.lga = json[KEY_LGA];
  obj.livestock = json[KEY_LIVESTOCK];
  obj.ward = json[KEY_WARD];
  obj.state = json[KEY_STATE];
  obj.market = json[KEY_MARKET];
  return obj;
}

Map<String, dynamic> _$LastRequestUrlToJson(LastRequestUrl obj) =>
    <String, dynamic>{
      KEY_BANK: obj.bank,
      KEY_CROP: obj.crop,
      KEY_COOPERATIVE: obj.cooperative,
      KEY_FARMER: obj.farmer,
      KEY_LGA: obj.lga,
      KEY_LIVESTOCK: obj.livestock,
      KEY_WARD: obj.ward,
      KEY_STATE: obj.state,
      KEY_MARKET: obj.market,
    };
