import '../data/model/bank.dart';
import '../data/model/cooperative.dart';
import '../data/model/crop.dart';
import '../data/model/lga.dart';
import '../data/model/livestock.dart';
import '../data/model/login.dart';
import '../data/model/user.dart';
import '../data/model/ward.dart';
import 'istorage.dart';

class LocalStorageImpl implements LocalStorage {
  final DatabaseStorage databaseStorage;
  final CacheStorage cacheStorage;

  const LocalStorageImpl({
    required this.databaseStorage,
    required this.cacheStorage,
  });

  @override
  Future<void> closeDb() => databaseStorage.closeDb();

  @override
  Future<Login> getUser() => cacheStorage.getUser();

  @override
  Future<void> setUsername(String value) => cacheStorage.setUsername(value);

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
  Future<List<Cooperative>> getCooperative() => databaseStorage.getCooperative();

  @override
  Future<List<Lga>> getLga() => databaseStorage.getLga();

  @override
  Future<List<Livestock>> getLivestock() => databaseStorage.getLivestock();

  @override
  Future<List<Ward>> getWard() => databaseStorage.getWard();

  // SAVE TO DB CALLS

  @override
  Future<void> saveBank(List<Bank> objectList) =>
      databaseStorage.saveBank(objectList);

  @override
  Future<void> saveCrop(List<Crop> objectList) =>
      databaseStorage.saveCrop(objectList);

      @override
  Future<void> saveCooperative(List<Cooperative> objectList) =>
      databaseStorage.saveCooperative(objectList);

  @override
  Future<void> saveLga(List<Lga> objectList) =>
      databaseStorage.saveLga(objectList);

  @override
  Future<void> saveLivestock(List<Livestock> objectList) =>
      databaseStorage.saveLivestock(objectList);

        @override
  Future<void> saveUser(List<User> objectList) =>
      databaseStorage.saveUser(objectList);

  @override
  Future<void> saveWard(List<Ward> objectList) =>
      databaseStorage.saveWard(objectList);
}
