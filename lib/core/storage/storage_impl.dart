import '../data/model/bank.dart';
import '../data/model/cooperative.dart';
import '../data/model/crop.dart';
import '../data/model/crop_calendar.dart';
import '../data/model/dashboard_data.dart';
import '../data/model/farmer.dart';
import '../data/model/incident_report.dart';
import '../data/model/insight.dart';
import '../data/model/last_request_time.dart';
import '../data/model/lga.dart';
import '../data/model/livestock.dart';
import '../data/model/login.dart';
import '../data/model/market.dart';
import '../data/model/market_data.dart';
import '../data/model/product.dart';
import '../data/model/user.dart';
import '../data/model/ward.dart';
import '../data/model/weather.dart';
import 'istorage.dart';

class LocalStorageImpl implements LocalStorage {
  final DatabaseStorage databaseStorage;
  final CacheStorage cacheStorage;

  const LocalStorageImpl({
    required this.databaseStorage,
    required this.cacheStorage,
  });

  @override
  void saveLastRequestObject(LastRequestTime object) =>
      cacheStorage.saveLastRequestObject(object);
  @override
  Future<LastRequestTime> getLastRequestTime() =>
      cacheStorage.getLastRequestTime();

  @override
  Future<Map<String, dynamic>> getLastRequestTimeMap() =>
      cacheStorage.getLastRequestTimeMap();

  @override
  void saveLoggedInUser(Login user) => cacheStorage.saveLoggedInUser(user);

  @override
  Future<void> closeDb() => databaseStorage.closeDb();

  @override
  Future<Login> getLoggedInUser() => cacheStorage.getLoggedInUser();

  @override
  Future<void> setUsername(String value) => cacheStorage.setUsername(value);

  @override
  Future<void> setLoggedIn(bool status) => cacheStorage.setLoggedIn(status);

  @override
  Future<bool?> isLoggedIn() => cacheStorage.isLoggedIn();

  @override
  Future<String?> getUsername() => cacheStorage.getUsername();

  @override
  Future<bool?> getRememberMe() => cacheStorage.getRememberMe();

  @override
  Future<void> setRememberMe(bool value) => cacheStorage.setRememberMe(value);

  @override
  Future<void> openDb(String username) => databaseStorage.openDb(username);

  // LOAD FROM DB CALLS

  @override
  Future<List<Bank>> getBank() => databaseStorage.getBank();

  @override
  Future<List<Crop>> getCrop() => databaseStorage.getCrop();

    @override
  Future<List<CropCalendar>> getCropCalendar() => databaseStorage.getCropCalendar();

  @override
  Future<List<Cooperative>> getCooperative() =>
      databaseStorage.getCooperative();

  @override
  Future<List<DashboardData>> getDashboard() => databaseStorage.getDashboard();

  @override
  Future<List<Farmer>> getFarmer() => databaseStorage.getFarmer();

  @override
  Future<List<Lga>> getLga() => databaseStorage.getLga();

  @override
  Future<List<Livestock>> getLivestock() => databaseStorage.getLivestock();

  @override
  Future<List<Insight>> getInsight() => databaseStorage.getInsight();

  @override
  Future<List<IncidentReport>> getIncident() => databaseStorage.getIncident();

  @override
  Future<List<User>> getUser() => databaseStorage.getUser();

  @override
  Future<List<Ward>> getWard() => databaseStorage.getWard();

  @override
  Future<List<Product>> getProduct() => databaseStorage.getProduct();

  @override
  Future<List<Market>> getMarket() => databaseStorage.getMarket();

  @override
  Future<List<MarketData>> getMarketPrice() => databaseStorage.getMarketPrice();

  @override
  Future<List<Weather>> getWeather() => databaseStorage.getWeather();

  // SAVE TO DB CALLS

  @override
  Future<void> saveBank(List<Bank> objectList) =>
      databaseStorage.saveBank(objectList);

  @override
  Future<void> saveCrop(List<Crop> objectList) =>
      databaseStorage.saveCrop(objectList);

        @override
  Future<void> saveCropCalendar(List<CropCalendar> objectList) =>
      databaseStorage.saveCropCalendar(objectList);

  @override
  Future<void> saveCooperative(List<Cooperative> objectList) =>
      databaseStorage.saveCooperative(objectList);

  @override
  Future<void> saveDashboard(List<DashboardData> objectList) =>
      databaseStorage.saveDashboard(objectList);

  @override
  Future<void> saveFarmer(List<Farmer> objectList) =>
      databaseStorage.saveFarmer(objectList);

  @override
  Future<void> saveLga(List<Lga> objectList) =>
      databaseStorage.saveLga(objectList);

  @override
  Future<void> saveInsight(List<Insight> objectList) =>
      databaseStorage.saveInsight(objectList);

  @override
  Future<void> saveIncident(List<IncidentReport> objectList) =>
      databaseStorage.saveIncident(objectList);

  @override
  Future<void> saveProduct(List<Product> objectList) =>
      databaseStorage.saveProduct(objectList);

  @override
  Future<void> saveLivestock(List<Livestock> objectList) =>
      databaseStorage.saveLivestock(objectList);

  @override
  Future<void> saveUser(List<User> objectList) =>
      databaseStorage.saveUser(objectList);

  @override
  Future<void> saveWard(List<Ward> objectList) =>
      databaseStorage.saveWard(objectList);

  @override
  Future<void> saveMarket(List<Market> objectList) =>
      databaseStorage.saveMarket(objectList);

  @override
  Future<void> saveMarketPrice(List<MarketData> objectList) =>
      databaseStorage.saveMarketPrice(objectList);
  @override
  Future<void> saveWeather(List<Weather> objectList) =>
      databaseStorage.saveWeather(objectList);
}
