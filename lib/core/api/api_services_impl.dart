import 'package:fpdart/fpdart.dart';
import 'package:kaspa/core/api/services/endpoints.dart';
import 'package:kaspa/core/data/model/bank.dart';
import 'package:kaspa/core/data/model/crop.dart';
import 'package:kaspa/core/data/model/lga.dart';
import 'package:kaspa/core/data/model/livestock.dart';
import 'package:kaspa/core/data/model/ward.dart';
import '../data/model/cooperative.dart';
import '../data/model/forgot_password.dart';
import '../data/model/login.dart';
import '../utils/const.dart';
import 'api_services.dart';
import 'exceptions/contracts/failure.dart';
import 'services/contracts/api_client.dart';
import 'services/contracts/api_response.dart';
import 'services/dio_client.dart';

class ApiServicesImpl implements ApiServices {
  final IApiClient apiClient;
  ApiServicesImpl({required this.apiClient});

  @override
  Future<Either<Failure, ApiResponse<Login>>> login(
    String username,
    String password,
  ) {
    return apiClient.request<Login>(
      loginEndpoint,
      MethodType.post,
      (data, {String? realUri}) => Login.fromJson(data),
      {KEY_USERNAME: username, KEY_PASSWORD: password},
      authInterceptor: null,
    );
  }

  @override
  Future<Either<Failure, ApiResponse<ForgotPassword>>> forgotPassword(
    String email,
  ) => apiClient.request<ForgotPassword>(
    forgotPasswordEndpoint,
    MethodType.post,
    (data, {String? realUri}) => ForgotPassword.fromJson(data),
    {KEY_EMAIL: email},
  );

  @override
  Future<Either<Failure, ApiResponse<ForgotPassword>>> changePassword(
    String token,
    String otp,
    String password,
  ) => apiClient.request<ForgotPassword>(
    resetPasswordEndpoint,
    MethodType.post,
    (data, {String? realUri}) => ForgotPassword.fromJson(data),
    {KEY_TOKEN: token, KEY_OTP: otp, KEY_PASSWORD: password},
  );

  @override
  Future<Either<Failure, ApiResponse<List<Bank>>>> getBankList(
    String? endpoint,
  ) async {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, ApiResponse<List<Crop>>>> getCropList(
    String? endpoint,
  ) async {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, ApiResponse<List<Cooperative>>>> getCooperativeList(
    String? endpoint,
  ) async {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, ApiResponse<List<Lga>>>> getLgaList(
    String? endpoint,
  ) async {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, ApiResponse<List<Livestock>>>> getLivestockList(
    String? endpoint,
  ) async {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, ApiResponse<List<Ward>>>> getWardList(
    String? endpoint,
  ) async {
    throw UnimplementedError();
  }
}
