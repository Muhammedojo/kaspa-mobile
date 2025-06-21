import '../../utils/const.dart';

class LastRequestTime {
  String? bank;
  String? bankUrl;
  String? crop;
  String? cropUrl;
  String? cooperative;
  String? cooperativeUrl;
  String? cropCalendar;
  String? cropCalendarUrl;
  String? lga;
  String? lgaUrl;
  String? lgaWeather;
  String? lgaWeatherUrl;
  String? livestock;
  String? livestockUrl;
  String? ward;
  String? wardUrl;
  String? state;
  String? stateUrl;
  String? user;
  String? userUrl;
  String? market;
  String? marketUrl;
  String? notification;
  String? notificationUrl;
  String? plot;
  String? plotUrl;
  String? product;
  String? productUrl;
  String? insight;
  String? insightUrl;
  String? incident;
  String? incidentUrl;
  String? marketPrice;
  String? marketPriceUrl;
  String? weather;
  String? weatherUrl;
  String? farmer;
  String? farmerUrl;
  String? farmCropActivity;
  String? farmCropActivityUrl;
  String? farmVisit;
  String? farmVisitUrl;
  String? dashboard;
  String? dashboardUrl;

  LastRequestTime();

  factory LastRequestTime.fromJson(Map<String, dynamic> json) =>
      _$LastRequestTimeFromJson(json);
  Map<String, dynamic> toJson() => _$LastRequestTimeToJson(this);
}

LastRequestTime _$LastRequestTimeFromJson(Map<String, dynamic> json) {
  var obj = LastRequestTime();
  obj.bank = json['bank'];
  obj.bankUrl = json['bankUrl'];
  obj.crop = json['crop'];
  obj.cropUrl = json['cropUrl'];
  obj.cooperative = json['cooperative'];
  obj.cooperativeUrl = json['cooperativeUrl'];
  obj.cropCalendar = json['cropCalendar'];
  obj.cropCalendarUrl = json['cropCalendarUrl'];
  obj.lga = json['lga'];
  obj.lgaUrl = json['lgaUrl'];
  obj.lgaWeather = json['lgaWeather'];
  obj.lgaWeatherUrl = json['lgaWeatherUrl'];
  obj.livestock = json['livestock'];
  obj.livestockUrl = json['livestockUrl'];
  obj.ward = json['ward'];
  obj.wardUrl = json['wardUrl'];
  obj.plot = json['plot'];
  obj.plotUrl = json['plotUrl'];
  obj.product = json['product'];
  obj.productUrl = json['productUrl'];
  obj.insight = json['insight'];
  obj.insightUrl = json['insightUrl'];
  obj.incident = json['incident'];
  obj.incidentUrl = json['incidentUrl'];
  obj.dashboard = json['dashboard'];
  obj.dashboardUrl = json['dashboardUrl'];
  obj.state = json['state'];
  obj.stateUrl = json['stateUrl'];
  obj.user = json['user'];
  obj.userUrl = json['userUrl'];
  obj.market = json['market'];
  obj.marketUrl = json['marketUrl'];
  obj.marketPrice = json['marketPrice'];
  obj.marketPriceUrl = json['marketPriceUrl'];
  obj.notification = json['notification'];
  obj.notificationUrl = json['notificationUrl'];
  obj.weather = json['weather'];
  obj.weatherUrl = json['weatherUrl'];
  obj.farmer = json['farmer'];
  obj.farmerUrl = json['farmerUrl'];
  obj.farmVisit = json['farmVisit'];
  obj.farmVisitUrl = json['farmVisitUrl'];
  obj.farmCropActivity = json['farmCropActivity'];
  obj.farmCropActivityUrl = json['farmCropActivityUrl'];

  return obj;
}

Map<String, dynamic> _$LastRequestTimeToJson(LastRequestTime obj) =>
    <String, dynamic>{
      KEY_BANK: obj.bank,
      KEY_BANK_URL: obj.bankUrl,
      KEY_CROP: obj.crop,
      KEY_CROP_URL: obj.cropUrl,
      KEY_CROP_CALENDAR: obj.cropCalendar,
      KEY_CROP_CALENDAR_URL: obj.cropCalendarUrl,
      KEY_COOPERATIVE: obj.cooperative,
      KEY_COOPERATIVE_URL: obj.cooperativeUrl,
      KEY_LGA: obj.lga,
      KEY_LGA_URL: obj.lgaUrl,
      KEY_LGA_WEATHER: obj.lgaWeather,
      KEY_LGA_WEATHER_URL: obj.lgaWeatherUrl,
      KEY_LIVESTOCK: obj.livestock,
      KEY_LIVESTOCK_URL: obj.livestockUrl,
      KEY_WARD: obj.ward,
      KEY_WARD_URL: obj.wardUrl,
      KEY_PLOT: obj.plot,
      KEY_PLOT_URL: obj.plotUrl,
      KEY_PRODUCT: obj.product,
      KEY_PRODUCT_URL: obj.productUrl,
      KEY_INSIGHT: obj.insight,
      KEY_INSIGHT_URL: obj.insightUrl,
      KEY_INCIDENT: obj.incident,
      KEY_INCIDENT_URL: obj.incidentUrl,
      KEY_DASHBOARD: obj.dashboard,
      KEY_DASHBOARD_URL: obj.dashboardUrl,
      KEY_STATE: obj.state,
      KEY_STATE_URL: obj.stateUrl,
      KEY_USER: obj.user,
      KEY_USER_URL: obj.userUrl,
      KEY_MARKET: obj.market,
      KEY_MARKET_URL: obj.marketUrl,
      KEY_MARKET_PRICE: obj.marketPrice,
      KEY_MARKET_PRICE_URL: obj.marketPriceUrl,
      KEY_NOTIFICATION: obj.notification,
      KEY_NOTIFICATION_URL: obj.notificationUrl,
      KEY_WEATHER: obj.weather,
      KEY_WEATHER_URL: obj.weatherUrl,
      KEY_FARMER: obj.farmer,
      KEY_FARMER_URL: obj.farmerUrl,
      KEY_FARM_VISIT: obj.farmVisit,
      KEY_FARM_VISIT_URL: obj.farmVisitUrl,
      KEY_FARM_CROP_ACTIVITY: obj.farmCropActivity,
      KEY_FARM_CROP_ACTIVITY_URL: obj
    };
