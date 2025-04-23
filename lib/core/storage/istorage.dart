import '../data/model/bank.dart';
import '../data/model/cooperative.dart';
import '../data/model/crop.dart';
import '../data/model/lga.dart';
import '../data/model/livestock.dart';
import '../data/model/login.dart';
import '../data/model/ward.dart';

abstract class LocalStorage implements DatabaseStorage, CacheStorage {}

abstract class CacheStorage {
  Future<Login> getUser();
  Future<void> setRememberMe(bool value);
  Future<bool?> getRememberMe();
  Future<void> setUsername(String value);
  Future<String?> getUsername();
}

abstract class DatabaseStorage {
  Future<void> openDb(String username);
  Future<void> closeDb();
  Future<List<Bank>> getBank();
  Future<List<Crop>> getCrop();
  Future<List<Cooperative>> getCooperative();
  Future<List<Lga>> getLga();
  Future<List<Livestock>> getLivestock();
  Future<List<Ward>> getWard();

  Future<void> saveBank(List<Bank> objectList);
  Future<void> saveCrop(List<Crop> objectList);
  Future<void> saveCooperative(List<Cooperative> objectList);
  Future<void> saveLga(List<Lga> objectList);
  Future<void> saveLivestock(List<Livestock> objectList);
  Future<void> saveWard(List<Ward> objectList);
}
