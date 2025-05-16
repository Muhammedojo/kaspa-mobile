import '../data/model/bank.dart';
import '../data/model/cooperative.dart';
import '../data/model/crop.dart';
import '../data/model/farmer.dart';
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

abstract class LocalStorage implements DatabaseStorage, CacheStorage {}

abstract class CacheStorage {
  Future<Login> getLoggedInUser();
  Future<void> setRememberMe(bool value);
  Future<bool?> getRememberMe();
  Future<void> setUsername(String value);
  Future<String?> getUsername();
  void saveLoggedInUser(Login user);
  Future<void> setLoggedIn(bool status);
  Future<bool?> isLoggedIn();
  Future<LastRequestTime> getLastRequestTime();
  void saveLastRequestObject(LastRequestTime object);
  Future<Map<String, dynamic>> getLastRequestTimeMap();
}

abstract class DatabaseStorage {
  Future<void> openDb(String username);
  Future<void> closeDb();
  Future<List<Bank>> getBank();
  Future<List<Crop>> getCrop();
  Future<List<Cooperative>> getCooperative();
  Future<List<Farmer>> getFarmer();
  Future<List<Lga>> getLga();
  Future<List<Product>> getProduct();
  Future<List<Livestock>> getLivestock();
  Future<List<User>> getUser();
  Future<List<Ward>> getWard();
  Future<List<Market>> getMarket();
  Future<List<MarketData>> getMarketPrice();
  Future<List<Weather>> getWeather();
  Future<List<Insight>> getInsight();
  Future<void> saveInsight(List<Insight> objectList);
  Future<void> saveBank(List<Bank> objectList);
  Future<void> saveCrop(List<Crop> objectList);
  Future<void> saveCooperative(List<Cooperative> objectList);
  Future<void> saveFarmer(List<Farmer> objectList);
  Future<void> saveLga(List<Lga> objectList);
  Future<void> saveLivestock(List<Livestock> objectList);
  Future<void> saveWard(List<Ward> objectList);
  Future<void> saveProduct(List<Product> objectList);
  Future<void> saveUser(List<User> objectList);
  Future<void> saveMarket(List<Market> objectList);
  Future<void> saveMarketPrice(List<MarketData> objectList);
  Future<void> saveWeather(List<Weather> objectList);
}
