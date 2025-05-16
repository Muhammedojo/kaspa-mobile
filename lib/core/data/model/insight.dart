import 'package:isar/isar.dart';

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
class CooperativeData {
  int? id;
  String? name;
  String? code;
  String? doi;
  LgaData? lga;
  String? head;
  String? secretary;
  String? longitude;
  String? latitude;

  CooperativeData({
    this.id,
    this.name,
    this.code,
    this.doi,
    this.lga,
    this.head,
    this.secretary,
    this.longitude,
    this.latitude,
  });

  factory CooperativeData.fromJson(Map<String, dynamic> json) {
    return CooperativeData(
      id: json['id'],
      name: json['name'],
      code: json['code'],
      doi: json['doi'],
      lga: LgaData.fromJson(json['lga']),
      head: json['head'],
      secretary: json['secretary'],
      longitude: json['longitude'],
      latitude: json['latitude'],
    );
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
class FarmerPlots {
  double? totalHectares;
  double? cultivated;
  double? fallowHectares;

  FarmerPlots({this.totalHectares, this.cultivated, this.fallowHectares});

  factory FarmerPlots.fromJson(Map<String, dynamic> json) {
    return FarmerPlots(
      totalHectares: (json['total_hectares'] as num).toDouble(),
      cultivated: json['cultivated'],
      fallowHectares: (json['fallow_hectares'] as num).toDouble(),
    );
  }
}

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
