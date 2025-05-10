import 'package:isar/isar.dart';
import 'package:kaspa/core/data/model/general_model.dart';

import '../../utils/const.dart';

@Collection()
class Weather extends GeneralModel{

Id? id;

@Index(unique: true)
late int pk = 0;

int? lgaId = 0;
String? date = "";
double? tempMax = 0.0;
double? tempMean = 0.0;
double? tempMin = 0.0;
int? precipSum = 0;
int? precipProbMean = 0;
int? weatherCode = 0;
String? sunrise = "";
String? sunset = "";
double? windSpeedMax = 0.0;

Weather();

factory Weather.fromJson(Map<String, dynamic> json) => _$WeatherFromJson(json);

}

Weather _$WeatherFromJson(Map<String, dynamic> json) {
  var obj = Weather();

obj.pk = json[KEY_PK];
obj.lgaId = json[KEY_LGA_ID];
obj.date = json[KEY_DATE];
obj.tempMax = json[KEY_TEMP_MAX];
obj.tempMean = json[KEY_TEMP_MEAN];
obj.tempMin = json[KEY_TEMP_MIN];
obj.precipSum = json[KEY_PRECIP_SUM];
obj.precipProbMean = json[KEY_PRECIP_PROB_MEAN];
obj.weatherCode = json[KEY_WEATHER_CODE];
obj.sunrise = json[KEY_SUNRISE];
obj.sunset = json[KEY_SUNSET];
obj.windSpeedMax = json[KEY_WIND_SPEED_MAX];

return obj;
}





