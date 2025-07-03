import 'dart:convert';

import 'package:isar/isar.dart';
import '../../utils/const.dart';

part 'insight.g.dart';

@Collection()
class Insight {
  Id? id;

  @Index(unique: true, replace: true)
  late int pk = 0;

  final WeatherData weather;
  final FarmerPlots farmerPlots;
  final LivestockData livestock;
  final CooperativesData cooperatives;

  Insight({
    required this.weather,
    required this.farmerPlots,
    required this.livestock,
    required this.cooperatives,
  });

  factory Insight.fromJson(Map<String, dynamic> json) {
    return Insight(
      weather: WeatherData.fromJson(json['weather']),
      farmerPlots: FarmerPlots.fromJson(json['farmer_plots']),
      livestock: LivestockData.fromJson(json['livestock']),
      cooperatives: CooperativesData.fromJson(json['cooperatives']),
    );
  }
}

@embedded
class LgaData {
  int? id;
  String? name;
  String? longitude;
  String? latitude;

  LgaData({this.id, this.name, this.longitude, this.latitude});

  factory LgaData.fromJson(Map<String, dynamic> json) {
    return LgaData(
      id: json['id'],
      name: json['name'],
      longitude: json['longitude'],
      latitude: json['latitude'],
    );
  }
}

@embedded
class BankData {
  int? id;
  String? name;

  BankData({this.id, this.name});

  Map<String, dynamic> toJson() => _$BankDataToJson(this);
  factory BankData.fromJson(Map<String, dynamic> json) {
    return BankData(id: json['id'], name: json['name']);
  }
  Map<String, dynamic> _$BankDataToJson(BankData obj) => <String, dynamic>{
    KEY_NAME: obj.name,
    KEY_PK: obj.id,
  };
}

@embedded
class NokData {
  int? id;
  String? name;
  String? phoneNumber;
  String? address;
  String? relationship;

  NokData({
    this.id,
    this.name,
    this.address,
    this.phoneNumber,
    this.relationship,
  });

  factory NokData.fromJson(Map<String, dynamic> json) {
    return NokData(
      id: json['id'],
      name: json['name'],
      phoneNumber: json['phone_number'],
      address: json['address'],
      relationship: json['relationship'],
    );
  }
}

@embedded
class CooperativeData {
  int? id;
  String? name;
  String? code;

  CooperativeData({this.id, this.name, this.code});

  factory CooperativeData.fromJson(Map<String, dynamic> json) {
    return CooperativeData(
      id: json['id'],
      name: json['name'],
      code: json['code'],
    );
  }
}

@embedded
class AudienceData {
  int? id;
  String? title;

  AudienceData({this.id, this.title});

  factory AudienceData.fromJson(Map<String, dynamic> json) {
    return AudienceData(id: json['id'], title: json['title']);
  }
}

@embedded
class WardData {
  int? id;
  String? name;
  int? lgaId;

  WardData({this.id, this.name, this.lgaId});
  factory WardData.fromJson(Map<String, dynamic> json) {
    return WardData(id: json['id'], name: json['name'], lgaId: json['lga_id']);
  }
}

@embedded
class WeatherData {
  int? id;
  int? lgaId;
  String? date;
  double? tempMax;
  double? tempMean;
  double? tempMin;
  double? precipSum;
  double? precipProbMean;
  int? weatherCode;
  String? sunrise;
  String? sunset;
  double? windSpeedMax;

  WeatherData({
    this.id = 0,
    this.lgaId,
    this.date = "",
    this.tempMax,
    this.tempMean,
    this.tempMin,
    this.precipSum,
    this.precipProbMean,
    this.weatherCode,
    this.sunrise,
    this.sunset,
    this.windSpeedMax,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      id: json['id'],
      lgaId: json['lga_id'],
      date: json['date'],
      tempMax: (json['temp_max'] as num).toDouble(),
      tempMean: (json['temp_mean'] as num).toDouble(),
      tempMin: (json['temp_min'] as num).toDouble(),
      precipSum: json['precip_sum'],
      precipProbMean: json['precip_prob_mean'],
      weatherCode: json['weather_code'],
      sunrise: json['sunrise'],
      sunset: json['sunset'],
      windSpeedMax: json['wind_speed_max'],
    );
  }
}

@embedded
class ProductObject {
  int? id;
  String? name;
  String? productType;

  ProductObject({this.id, this.name, this.productType});

  factory ProductObject.fromJson(Map<String, dynamic> json) {
    return ProductObject(
      id: json['id'],
      name: json['name'],
      productType: json['product_type'],
    );
  }
}

@embedded
class CropData {
  int? id;
  ProductObject? product;
  String? variety;
  String? unit;

  CropData({this.id, this.product, this.variety, this.unit});

  factory CropData.fromJson(Map<String, dynamic> json) {
    return CropData(
      id: json['id'],
      product: ProductObject.fromJson(json['product']),
      variety: json['variety'],
      unit: json['unit'],
    );
  }
}

@embedded
class ActivityObject {
  int? id;
  String? startDate;
  String? endDate;
  String? activity;
  String? description;

  ActivityObject({
    this.id,
    this.startDate,
    this.endDate,
    this.activity,
    this.description,
  });

  factory ActivityObject.fromJson(Map<String, dynamic> json) {
    return ActivityObject(
      id: json['id'],
      startDate: json['start_date'],
      endDate: json['end_date'],
      activity: json['activity'],
      description: json['description'],
    );
  }
}

@embedded
class FarmCrop {
  int? id;
  CropData? crop;
  String? noOfHectares;

  FarmCrop({this.id, this.crop, this.noOfHectares});

  factory FarmCrop.fromJson(Map<String, dynamic> json) {
    return FarmCrop(
      id: json['id'],
      crop: CropData.fromJson(json[KEY_CROP]),
      noOfHectares: json['no_of_hectares'],
    );
  }
}

@embedded
class NestedProductObject {
  int? id;
  ProductObject? product;
  String? variety;
  String? unit;

  NestedProductObject({this.id, this.product, this.variety, this.unit});

  factory NestedProductObject.fromJson(Map<String, dynamic> json) {
    return NestedProductObject(
      id: json['id'],
      product: ProductObject.fromJson(json[KEY_PRODUCT]),
      variety: json['variety'],
      unit: json['unit'],
    );
  }
}

@embedded
class BankDetail {
  int? id;
  BankData? bank;
  String? accountName;
  String? accountNumber;

  BankDetail({this.accountName, this.accountNumber, this.bank, this.id});

  factory BankDetail.fromJson(Map<String, dynamic> json) =>
      _$BankDetailFromJson(json);

  Map<String, dynamic> toJson() => _$BankDetailsToJson(this);
}

BankDetail _$BankDetailFromJson(Map<String, dynamic> json) {
  var obj = BankDetail();

  obj.id = json[KEY_PK];
  obj.accountName = json[KEY_ACCOUNT_NAME];
  obj.accountNumber = json[KEY_ACCOUNT_NUMBER];
  obj.bank = BankData.fromJson(json[KEY_BANK]);

  return obj;
}

Map<String, dynamic> _$BankDetailsToJson(BankDetail obj) => <String, dynamic>{
  KEY_ACCOUNT_NAME: obj.accountName,
  KEY_ACCOUNT_NUMBER: obj.accountNumber,
  KEY_BANK: obj.bank?.toJson(),
  KEY_PK: obj.id,
};

@embedded
class MarketObject {
  int? id;
  String? name;
  String? address;
  String? marketType;
  String? size;
  String? marketDays;

  MarketObject({
    this.id,
    this.name,
    this.address,
    this.marketType,
    this.size,
    this.marketDays,
  });

  factory MarketObject.fromJson(Map<String, dynamic> json) {
    return MarketObject(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      marketType: json['market_type'],
      size: json['size'],
      marketDays: json['market_days'],
    );
  }
}

@embedded
class FarmerPlots {
  String? address;
  String? sizeInHa;
  String? ownershipType;
  String? longitude;
  String? latitude;

  /// This holds the serialized coordinates for Isar
  late String polygonJson;

  /// This is ignored by Isar but used in app logic
  @ignore
  PolygonData? polygon;

  FarmerPlots({
    this.address,
    this.sizeInHa,
    this.ownershipType,
    this.longitude,
    this.latitude,
    this.polygon,
  }) {
    // Serialize polygon if available
    polygonJson = polygon != null ? polygon!.toJson()['polygonJson'] ?? '' : '';
  }

  factory FarmerPlots.fromJson(Map<String, dynamic> json) {
    final polygonData =
        json['polygon'] != null ? PolygonData.fromJson(json['polygon']) : null;

    return FarmerPlots(
      address: json['address'],
      sizeInHa: json['size_in_ha'],
      ownershipType: json['ownership_type'],
      longitude: json['longitude'],
      latitude: json['latitude'],
      polygon: polygonData,
    )..polygonJson = polygonData?.toJson()['polygonJson'] ?? '';
  }

  Map<String, dynamic> toJson() {
    return {
      'address': address,
      'size_in_ha': sizeInHa,
      'ownership_type': ownershipType,
      'longitude': longitude,
      'latitude': latitude,
      'polygon': polygon?.toJson(), // Full nested object
      'polygonJson': polygonJson, // Flattened for Isar
    };
  }

  /// Call this after reading from Isar
  void loadPolygonFromJson() {
    if (polygonJson.isNotEmpty) {
      polygon = PolygonData.fromJson({'polygonJson': polygonJson});
    }
  }

  /// Call this before saving to Isar
  void updatePolygonJson() {
    polygonJson = polygon?.toJson()['polygonJson'] ?? '';
  }
}

// @embedded
// class FarmerPlots {
//   String? address;
//   String? sizeInHa;
//   String? ownershipType;
//   String? longitude;
//   String? latitude;

//   @ignore
//   PolygonData? polygon;

//   FarmerPlots({
//     this.address,
//     this.sizeInHa,
//     this.ownershipType,
//     this.longitude,
//     this.latitude,
//     this.polygon,
//   });

//   factory FarmerPlots.fromJson(Map<String, dynamic> json) {
//     return FarmerPlots(
//       address: json['address'],
//       sizeInHa: json['size_in_ha'],
//       ownershipType: json['ownership_type'],
//       longitude: json['longitude'],
//       latitude: json['latitude'],
//      polygon: json['polygon'] == null
//           ? null
//           : PolygonData.fromJson(json['polygon']),);
//   }
// }

@embedded
class PolygonData {
  @ignore
  List<List<List<double>>>? coordinates;

  late String polygonJson; // This will be stored in Isar

  PolygonData({this.coordinates}) {
    if (coordinates != null) {
      polygonJson = json.encode(coordinates);
    }
  }

  factory PolygonData.fromJson(Map<String, dynamic> jsonMap) {
    final String? rawJson = jsonMap['polygonJson'];
    List<List<List<double>>>? coords;

    if (rawJson != null) {
      try {
        final decoded = json.decode(rawJson);
        coords =
            (decoded as List)
                .map(
                  (ring) =>
                      (ring as List)
                          .map(
                            (point) =>
                                (point as List)
                                    .map((coord) => (coord as num).toDouble())
                                    .toList(),
                          )
                          .toList(),
                )
                .toList();
      } catch (_) {
        coords = null;
      }
    }

    return PolygonData(coordinates: coords)..polygonJson = rawJson ?? '';
  }

  Map<String, dynamic> toJson() {
    polygonJson = json.encode(coordinates);
    return {'polygonJson': polygonJson};
  }

  void updateJsonFromCoordinates() {
    polygonJson = json.encode(coordinates);
  }

  void loadCoordinatesFromJson() {
    if (polygonJson.isNotEmpty) {
      final decoded = json.decode(polygonJson);
      coordinates =
          (decoded as List)
              .map(
                (ring) =>
                    (ring as List)
                        .map(
                          (point) =>
                              (point as List)
                                  .map((coord) => (coord as num).toDouble())
                                  .toList(),
                        )
                        .toList(),
              )
              .toList();
    }
  }
}

// @embedded
// class PolygonData {

//   @ignore
//   List<List<List<double>>>? coordinates;

//   PolygonData({this.coordinates});

//   factory PolygonData.fromJson(Map<String, dynamic> json) {
//     List<List<List<double>>>? coords;
//     if (json['coordinates'] != null && json['coordinates'] is List) {
//       try {
//         coords =
//             (json['coordinates'] as List<dynamic>).map((polygonRing) {
//               return (polygonRing as List<dynamic>).map((pointArray) {
//                 return (pointArray as List<dynamic>).map((coordinate) {
//                   return (coordinate as num).toDouble();
//                 }).toList();
//               }).toList();
//             }).toList();
//       } catch (e) {
//         coords = null;
//       }
//     }
//     return PolygonData(coordinates: coords);
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['coordinates'] = coordinates;
//     return data;
//   }
// }

@embedded
class LivestockData {
  int? diary;
  int? poultry;
  int? aquaculture;

  LivestockData({this.diary, this.poultry, this.aquaculture});

  factory LivestockData.fromJson(Map<String, dynamic> json) {
    return LivestockData(
      diary: json['diary'],
      poultry: json['poultry'],
      aquaculture: json['aquaculture'],
    );
  }
}

@embedded
class CooperativesData {
  int? total;
  int? lastMonth;

  CooperativesData({this.total, this.lastMonth});

  factory CooperativesData.fromJson(Map<String, dynamic> json) {
    return CooperativesData(
      total: json['total'],
      lastMonth: json['last_month'],
    );
  }
}
