import 'package:flutter/foundation.dart';
import 'package:kaspa/core/data/model/bank.dart';
import 'package:kaspa/core/data/model/crop.dart';
import 'package:kaspa/core/data/model/farmer.dart';
import 'package:kaspa/core/data/model/lga.dart';
import 'package:kaspa/core/data/model/livestock.dart';
import 'package:kaspa/core/data/model/ward.dart';
import 'package:path_provider/path_provider.dart';
import '../../data/model/cooperative.dart';
import '../istorage.dart';
import 'package:isar/isar.dart';

class IsarImpl implements DatabaseStorage {
  late Isar _isar;

  IsarImpl() {
    //openDb();
  }

  @override
  Future openDb(String username) async {
    try {
      _isar = await Isar.open(
        name: username,
        [
          BankSchema,
          CropSchema,
          FarmerSchema,
          LgaSchema,
          LivestockSchema,
          WardSchema,
        ],
        inspector: kDebugMode,
        directory: await getApplicationDocumentsDirectory().then(
          (value) => value.path,
        ),
      );
    } on IsarError catch (e) {
      debugPrint("error opening db ...$e");
    }
  }

  @override
  Future<void> closeDb() async {
    if (_isar.isOpen) {
      await _isar.close();
    }
  }

  @override
  Future<List<Bank>> getBank() {
    if (!_isar.isOpen) {
      return Future.value(<Bank>[]);
    }
    try {
      final banks = _isar.banks.where().findAllSync();
      return Future.value(banks);
    } catch (e) {
      debugPrint("Error retrieving banks: $e");
      return Future.value(<Bank>[]);
    }
  }

  @override
  Future<List<Crop>> getCrop() {
    if (!_isar.isOpen) {
      return Future.value(<Crop>[]);
    }
    try {
      final crops = _isar.crops.where().findAllSync();
      return Future.value(crops);
    } catch (e) {
      debugPrint("Error retrieving crops: $e");
      return Future.value(<Crop>[]);
    }
  }

  @override
  Future<List<Cooperative>> getCooperative() {
    if (!_isar.isOpen) {
      return Future.value(<Cooperative>[]);
    }
    try {
      final cooperatives = _isar.cooperatives.where().findAllSync();
      return Future.value(cooperatives);
    } catch (e) {
      debugPrint("Error retrieving cooperatives: $e");
      return Future.value(<Cooperative>[]);
    }
  }

  @override
  Future<List<Lga>> getLga() {
    if (!_isar.isOpen) {
      return Future.value(<Lga>[]);
    }
    try {
      final lgas = _isar.lgas.where().findAllSync();
      return Future.value(lgas);
    } catch (e) {
      debugPrint("Error retrieving lgas: $e");
      return Future.value(<Lga>[]);
    }
  }

  @override
  Future<List<Livestock>> getLivestock() {
    if (!_isar.isOpen) {
      return Future.value(<Livestock>[]);
    }
    try {
      final livestocks = _isar.livestocks.where().findAllSync();
      return Future.value(livestocks);
    } catch (e) {
      debugPrint("Error retrieving livestocks: $e");
      return Future.value(<Livestock>[]);
    }
  }

  @override
  Future<List<Ward>> getWard() {
    if (!_isar.isOpen) {
      return Future.value(<Ward>[]);
    }
    try {
      final wards = _isar.wards.where().findAllSync();
      return Future.value(wards);
    } catch (e) {
      debugPrint("Error retrieving wards: $e");
      return Future.value(<Ward>[]);
    }
  }

  @override
  Future<void> saveBank(List<Bank> objectList) async {
    if (!_isar.isOpen) {
      return;
    }
    try {
      await _isar.writeTxn(() => _isar.banks.putAll(objectList));
    } catch (e) {
      debugPrint("Error saving bank: $e");
    }
  }

  @override
  Future<void> saveCrop(List<Crop> objectList) async {
    if (!_isar.isOpen) {
      return;
    }
    try {
      await _isar.writeTxn(() => _isar.crops.putAll(objectList));
    } catch (e) {
      debugPrint("Error saving crop: $e");
    }
  }

  @override
  Future<void> saveCooperative(List<Cooperative> objectList) async {
    if (!_isar.isOpen) {
      return;
    }
    try {
      await _isar.writeTxn(() => _isar.cooperatives.putAll(objectList));
    } catch (e) {
      debugPrint("Error saving cooperative: $e");
    }
  }

  @override
  Future<void> saveLga(List<Lga> objectList) async {
    if (!_isar.isOpen) {
      return;
    }
    try {
      await _isar.writeTxn(() => _isar.lgas.putAll(objectList));
    } catch (e) {
      debugPrint("Error saving lga: $e");
    }
  }

  @override
  Future<void> saveLivestock(List<Livestock> objectList) async {
    if (!_isar.isOpen) {
      return;
    }
    try {
      await _isar.writeTxn(() => _isar.livestocks.putAll(objectList));
    } catch (e) {
      debugPrint("Error saving livestock: $e");
    }
  }

  @override
  Future<void> saveWard(List<Ward> objectList) async {
    if (!_isar.isOpen) {
      return;
    }
    try {
      await _isar.writeTxn(() => _isar.wards.putAll(objectList));
    } catch (e) {
      debugPrint("Error saving ward: $e");
    }
  }
}
