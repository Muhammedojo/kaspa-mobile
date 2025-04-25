import 'package:fpdart/fpdart.dart';
import '../../../core/api/api.dart';
import '../../../core/api/exceptions/contracts/failure.dart';
import '../../../core/data/model/bank.dart';
import '../../../core/data/model/cooperative.dart';
import '../../../core/data/model/crop.dart';
import '../../../core/data/model/lga.dart';
import '../../../core/data/model/livestock.dart';
import '../../../core/data/model/user.dart';
import '../../../core/data/model/ward.dart';

abstract class IHomeRepository {
  //BANK CUBIT CALLS
  Future<Either<Failure, ApiResponse<List<Bank>>>> getBankList({
    String? endpoint,
  });

  Future<void> saveBank(List<Bank> bankList);

  Future<List<Bank>> getBank();

   //COOPERATIVE CUBIT CALLS
  Future<Either<Failure, ApiResponse<List<Cooperative>>>> getCooperativeList({
    String? endpoint,
  });

  Future<void> saveCooperative(List<Cooperative> cooperativeList);

  Future<List<Cooperative>> getCooperative();

   //CROP CUBIT CALLS
  Future<Either<Failure, ApiResponse<List<Crop>>>> getCropList({
    String? endpoint,
  });

  Future<void> saveCrop(List<Crop> cropList);

  Future<List<Crop>> getCrop();


  //LGA CUBIT CALLS
  Future<Either<Failure, ApiResponse<List<Lga>>>> getLgaList({
    String? endpoint,
  });

  Future<void> saveLga(List<Lga> lgaList);

  Future<List<Lga>> getLga();


  //LIVESTOCK CUBIT CALLS
  Future<Either<Failure, ApiResponse<List<Livestock>>>> getLivestockList({
    String? endpoint,
  });

  Future<void> saveLivestock(List<Livestock> livestockList);

  Future<List<Livestock>> getLivestock();

  //USER CUBIT CALLS
  Future<Either<Failure, ApiResponse<List<User>>>> getUserList({
    String? endpoint,
  });

  Future<void> saveUser(List<User> wardList);

  Future<List<User>> getUser();

  //WARD CUBIT CALLS
  Future<Either<Failure, ApiResponse<List<Ward>>>> getWardList({
    String? endpoint,
  });

  Future<void> saveWard(List<Ward> wardList);

  Future<List<Ward>> getWard();
}
