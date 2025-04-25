import 'package:fpdart/fpdart.dart';
import 'package:get_it/get_it.dart';
import '../data/model/forgot_password.dart';
import '../data/model/login.dart';
import '../data/model/model.dart';
import '../storage/istorage.dart';
import '../utils/const.dart';
import '../utils/extensions.dart';
import 'api.dart';
import 'exceptions/contracts/failure.dart';

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
    var lastRequestTime =
        await GetIt.I.get<LocalStorage>().getLastRequestTime();
    return apiClient.request<List<Bank>>(
      endpoint ?? bankListEndpoint,
      MethodType.get,
      (data, {String? realUri}) {
        lastRequestTime.bank = currentDateTime();
        lastRequestTime.bankUrl = realUri;
        final bankList = (data as List).map((e) => Bank.fromJson(e)).toList();
        GetIt.I.get<LocalStorage>().saveLastRequestObject(lastRequestTime);
        return bankList;
      },
      null,
      headerOption: {KEY_HTTP_LAST_REQUEST_TIME: lastRequestTime},
    );
  }

  @override
  Future<Either<Failure, ApiResponse<List<Crop>>>> getCropList(
    String? endpoint,
  ) async {
    var lastRequestTime =
        await GetIt.I.get<LocalStorage>().getLastRequestTime();
    return apiClient.request<List<Crop>>(
      endpoint ?? cropListEndpoint,
      MethodType.get,
      (data, {String? realUri}) {
        lastRequestTime.crop = currentDateTime();
        lastRequestTime.cropUrl = realUri;
        final cropList = (data as List).map((e) => Crop.fromJson(e)).toList();
        GetIt.I.get<LocalStorage>().saveLastRequestObject(lastRequestTime);
        return cropList;
      },
      null,
      headerOption: {KEY_HTTP_LAST_REQUEST_TIME: lastRequestTime},
    );
  }

  @override
  Future<Either<Failure, ApiResponse<List<Cooperative>>>> getCooperativeList(
    String? endpoint,
  ) async {
    var lastRequestTime =
        await GetIt.I.get<LocalStorage>().getLastRequestTime();
    return apiClient.request<List<Cooperative>>(
      endpoint ?? cooperativeListEndpoint,
      MethodType.get,
      (data, {String? realUri}) {
        lastRequestTime.cooperative = currentDateTime();
        lastRequestTime.cooperativeUrl = realUri;
        final cooperativeList =
            (data as List).map((e) => Cooperative.fromJson(e)).toList();
        GetIt.I.get<LocalStorage>().saveLastRequestObject(lastRequestTime);
        return cooperativeList;
      },
      null,
      headerOption: {KEY_HTTP_LAST_REQUEST_TIME: lastRequestTime},
    );
  }

  @override
  Future<Either<Failure, ApiResponse<List<Farmer>>>> getFarmerList(
    String? endpoint,
  ) async {
    var lastRequestTime =
        await GetIt.I.get<LocalStorage>().getLastRequestTime();
    return apiClient.request<List<Farmer>>(
      endpoint ?? farmersListEndpoint,
      MethodType.get,
      (data, {String? realUri}) {
        lastRequestTime.farmer = currentDateTime();
        lastRequestTime.farmerUrl = realUri;
        final farmerList =
            (data as List).map((e) => Farmer.fromJson(e)).toList();
        GetIt.I.get<LocalStorage>().saveLastRequestObject(lastRequestTime);
        return farmerList;
      },
      null,
      headerOption: {KEY_HTTP_LAST_REQUEST_TIME: lastRequestTime},
    );
  }

  @override
  Future<Either<Failure, ApiResponse<List<Lga>>>> getLgaList(
    String? endpoint,
  ) async {
    var lastRequestTime =
        await GetIt.I.get<LocalStorage>().getLastRequestTime();
    return apiClient.request<List<Lga>>(
      endpoint ?? lgaListEndpoint,
      MethodType.get,
      (data, {String? realUri}) {
        lastRequestTime.lga = currentDateTime();
        lastRequestTime.lgaUrl = realUri;
        final lgaList = (data as List).map((e) => Lga.fromJson(e)).toList();
        GetIt.I.get<LocalStorage>().saveLastRequestObject(lastRequestTime);
        return lgaList;
      },
      null,
      headerOption: {KEY_HTTP_LAST_REQUEST_TIME: lastRequestTime},
    );
  }

  @override
  Future<Either<Failure, ApiResponse<List<Livestock>>>> getLivestockList(
    String? endpoint,
  ) async {
    var lastRequestTime =
        await GetIt.I.get<LocalStorage>().getLastRequestTime();
    return apiClient.request<List<Livestock>>(
      endpoint ?? livestockListEndpoint,
      MethodType.get,
      (data, {String? realUri}) {
        lastRequestTime.livestock = currentDateTime();
        lastRequestTime.livestockUrl = realUri;
        final livestockList =
            (data as List).map((e) => Livestock.fromJson(e)).toList();
        GetIt.I.get<LocalStorage>().saveLastRequestObject(lastRequestTime);
        return livestockList;
      },
      null,
      headerOption: {KEY_HTTP_LAST_REQUEST_TIME: lastRequestTime},
    );
  }

  @override
  Future<Either<Failure, ApiResponse<List<User>>>> getUserList(
    String? endpoint,
  ) async {
    var lastRequestTime =
        await GetIt.I.get<LocalStorage>().getLastRequestTime();
    return apiClient.request<List<User>>(
      endpoint ?? userListEndpoint,
      MethodType.get,
      (data, {String? realUri}) {
        lastRequestTime.user = currentDateTime();
        lastRequestTime.userUrl = realUri;
        final userList = (data as List).map((e) => User.fromJson(e)).toList();
        GetIt.I.get<LocalStorage>().saveLastRequestObject(lastRequestTime);
        return userList;
      },
      null,
      headerOption: {KEY_HTTP_LAST_REQUEST_TIME: lastRequestTime},
    );
  }

  @override
  Future<Either<Failure, ApiResponse<List<Ward>>>> getWardList(
    String? endpoint,
  ) async {
    var lastRequestTime =
        await GetIt.I.get<LocalStorage>().getLastRequestTime();
    return apiClient.request<List<Ward>>(
      endpoint ?? wardListEndpoint,
      MethodType.get,
      (data, {String? realUri}) {
        lastRequestTime.ward = currentDateTime();
        lastRequestTime.wardUrl = realUri;
        final wardList = (data as List).map((e) => Ward.fromJson(e)).toList();
        GetIt.I.get<LocalStorage>().saveLastRequestObject(lastRequestTime);
        return wardList;
      },
      null,
      headerOption: {KEY_HTTP_LAST_REQUEST_TIME: lastRequestTime},
    );
  }
}
