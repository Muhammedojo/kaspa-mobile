import 'package:fpdart/fpdart.dart';

import '../data/model/bank.dart';
import '../data/model/cooperative.dart';
import '../data/model/crop.dart';
import '../data/model/forgot_password.dart';
import '../data/model/lga.dart';
import '../data/model/livestock.dart';
import '../data/model/login.dart';
import '../data/model/ward.dart';
import 'exceptions/contracts/failure.dart';
import 'services/contracts/api_response.dart';

abstract class ApiServices {
  Future<Either<Failure, ApiResponse<Login>>> login(
    String username,
    String password,
  );

  Future<Either<Failure, ApiResponse<ForgotPassword>>> forgotPassword(
    String email,
  );

  Future<Either<Failure, ApiResponse<ForgotPassword>>> changePassword(
    String username,
    String oldPassword,
    String newPassword,
  );

  Future<Either<Failure, ApiResponse<List<Bank>>>> getBankList(
    String? endpoint,
  );

  Future<Either<Failure, ApiResponse<List<Crop>>>> getCropList(
    String? endpoint,
  );

  Future<Either<Failure, ApiResponse<List<Cooperative>>>> getCooperativeList(
    String? endpoint,
  );

  Future<Either<Failure, ApiResponse<List<Lga>>>> getLgaList(String? endpoint);
  Future<Either<Failure, ApiResponse<List<Livestock>>>> getLivestockList(
    String? endpoint,
  );
  Future<Either<Failure, ApiResponse<List<Ward>>>> getWardList(
    String? endpoint,
  );
}
