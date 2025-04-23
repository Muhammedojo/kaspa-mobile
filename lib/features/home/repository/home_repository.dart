import 'package:fpdart/fpdart.dart';
import '../../../core/api/api.dart';
import '../../../core/api/exceptions/contracts/failure.dart';
import '../../../core/data/model/bank.dart';
import '../../../core/data/model/cooperative.dart';
import '../../../core/data/model/crop.dart';
import '../../../core/data/model/lga.dart';
import '../../../core/data/model/livestock.dart';
import '../../../core/data/model/ward.dart';
import '../../../core/storage/istorage.dart';
import 'home_repository_contract.dart';

class HomeRepository implements IHomeRepository {
  final LocalStorage localStorage;
  final ApiServices apiServices;

  HomeRepository({required this.localStorage, required this.apiServices});

  //API CALLS

  @override
  Future<Either<Failure, ApiResponse<List<Bank>>>> getBankList({
    String? endpoint,
  }) => apiServices.getBankList(endpoint);

  @override
  Future<Either<Failure, ApiResponse<List<Crop>>>> getCropList({
    String? endpoint,
  }) => apiServices.getCropList(endpoint);

    @override
  Future<Either<Failure, ApiResponse<List<Cooperative>>>> getCooperativeList({
    String? endpoint,
  }) => apiServices.getCooperativeList(endpoint);


  @override
  Future<Either<Failure, ApiResponse<List<Lga>>>> getLgaList({
    String? endpoint,
  }) => apiServices.getLgaList(endpoint);

  @override
  Future<Either<Failure, ApiResponse<List<Livestock>>>> getLivestockList({
    String? endpoint,
  }) => apiServices.getLivestockList(endpoint);
  @override
  Future<Either<Failure, ApiResponse<List<Ward>>>> getWardList({
    String? endpoint,
  }) => apiServices.getWardList(endpoint);

  //GET LOCAL STORAGE CALLS
  @override
  Future<List<Bank>> getBank() => localStorage.getBank();

  @override
  Future<List<Crop>> getCrop() => localStorage.getCrop();

    @override
  Future<List<Cooperative>> getCooperative() => localStorage.getCooperative();

  @override
  Future<List<Lga>> getLga() => localStorage.getLga();

  @override
  Future<List<Livestock>> getLivestock() => localStorage.getLivestock();

  @override
  Future<List<Ward>> getWard() => localStorage.getWard();

  //SAVE LOCAL STORAGE CALLS
  @override
  Future<void> saveBank(List<Bank> bankList) => localStorage.saveBank(bankList);
  @override
  Future<void> saveCrop(List<Crop> cropList) => localStorage.saveCrop(cropList);
  @override
  Future<void> saveCooperative(List<Cooperative> cooperativeList) => localStorage.saveCooperative(cooperativeList);
  @override
  Future<void> saveLga(List<Lga> lgaList) => localStorage.saveLga(lgaList);
  @override
  Future<void> saveLivestock(List<Livestock> livestockList) =>
      localStorage.saveLivestock(livestockList);
  @override
  Future<void> saveWard(List<Ward> wardList) => localStorage.saveWard(wardList);
}
