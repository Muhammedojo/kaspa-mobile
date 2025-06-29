import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get_it/get_it.dart';
import 'package:path/path.dart';
import '../data/model/crop_activities.dart';
import '../data/model/crop_calendar.dart';
import '../data/model/dashboard_data.dart';
import '../data/model/farm_visit.dart';
import '../data/model/forgot_password.dart';
import '../data/model/incident_report.dart';
import '../data/model/insight.dart';
import '../data/model/login.dart';
import '../data/model/market.dart';
import '../data/model/market_data.dart';
import '../data/model/model.dart';
import '../data/model/notification.dart';
import '../data/model/plot.dart';
import '../data/model/product.dart';
import '../data/model/weather.dart';
import '../storage/istorage.dart';
import '../utils/const.dart';
import '../utils/extensions.dart';
import 'api.dart';
import 'exceptions/api_exception.dart';
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
  Future<Either<Failure, ApiResponse<List<CropCalendar>>>> getCropCalendarList(
    String? endpoint,
  ) async {
    var lastRequestTime =
        await GetIt.I.get<LocalStorage>().getLastRequestTime();
    return apiClient.request<List<CropCalendar>>(
      endpoint ?? cropCalendarListEndpoint,
      MethodType.get,
      (data, {String? realUri}) {
        lastRequestTime.cropCalendar = currentDateTime();
        lastRequestTime.cropCalendarUrl = realUri;
        final cropCalendarList =
            (data as List).map((e) => CropCalendar.fromJson(e)).toList();
        GetIt.I.get<LocalStorage>().saveLastRequestObject(lastRequestTime);
        return cropCalendarList;
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
  Future<Either<Failure, ApiResponse<List<DashboardData>>>> getDashboardList(
    String? endpoint,
  ) async {
    try {
      var lastRequestTime =
          await GetIt.I.get<LocalStorage>().getLastRequestTime();
      return apiClient.request<List<DashboardData>>(
        endpoint ?? dashboardFarmerEndpoint,
        MethodType.get,
        (data, {String? realUri}) {
          lastRequestTime.dashboard = currentDateTime();
          lastRequestTime.dashboardUrl = realUri;

          final dashboard = DashboardData.fromJson(
            data as Map<String, dynamic>,
          );
          GetIt.I.get<LocalStorage>().saveLastRequestObject(lastRequestTime);
          return [dashboard];
        },
        null,
        headerOption: {KEY_HTTP_LAST_REQUEST_TIME: lastRequestTime},
      );
    } on Error catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
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
  Future<Either<Failure, ApiResponse<List<CropActivities>>>>
  getFarmCropActivityList(String? endpoint, {int? farmCropId}) async {
    var lastRequestTime =
        await GetIt.I.get<LocalStorage>().getLastRequestTime();
    String finalEndpoint = endpoint ?? farmCropActivityListEndpoint;
    if (farmCropId != null) {
      finalEndpoint = '$finalEndpoint?farm_crop=$farmCropId';
    }

    return apiClient.request<List<CropActivities>>(
      finalEndpoint,
      MethodType.get,
      (data, {String? realUri}) {
        lastRequestTime.farmCropActivity = currentDateTime();
        lastRequestTime.farmCropActivityUrl = realUri;

        final farmCropActivityList =
            (data as List).map((e) => CropActivities.fromJson(e)).toList();
        GetIt.I.get<LocalStorage>().saveLastRequestObject(lastRequestTime);
        return farmCropActivityList;
      },
      null,
      headerOption: {KEY_HTTP_LAST_REQUEST_TIME: lastRequestTime},
    );
  }

  @override
  Future<Either<Failure, ApiResponse<List<FarmVisit>>>> getFarmVisitList(
    String? endpoint,
  ) async {
    var lastRequestTime =
        await GetIt.I.get<LocalStorage>().getLastRequestTime();
    return apiClient.request<List<FarmVisit>>(
      endpoint ?? farmVisitListEndpoint,
      MethodType.get,
      (data, {String? realUri}) {
        lastRequestTime.farmVisit = currentDateTime();
        lastRequestTime.farmVisitUrl = realUri;

        final farmVisitList =
            (data as List).map((e) => FarmVisit.fromJson(e)).toList();
        GetIt.I.get<LocalStorage>().saveLastRequestObject(lastRequestTime);
        return farmVisitList;
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
    try {
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
    } on Error catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ApiResponse<List<Market>>>> getMarketList(
    String? endpoint,
  ) async {
    try {
      var lastRequestTime =
          await GetIt.I.get<LocalStorage>().getLastRequestTime();
      return apiClient.request<List<Market>>(
        endpoint ?? marketListEndpoint,
        MethodType.get,
        (data, {String? realUri}) {
          lastRequestTime.market = currentDateTime();
          lastRequestTime.marketUrl = realUri;
          final marketList =
              (data as List).map((e) => Market.fromJson(e)).toList();
          GetIt.I.get<LocalStorage>().saveLastRequestObject(lastRequestTime);
          return marketList;
        },
        null,
        headerOption: {KEY_HTTP_LAST_REQUEST_TIME: lastRequestTime},
      );
    } on Error catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ApiResponse<List<Notifications>>>> getNotificationList(
    String? endpoint,
  ) async {
    try {
      var lastRequestTime =
          await GetIt.I.get<LocalStorage>().getLastRequestTime();
      return apiClient.request<List<Notifications>>(
        endpoint ?? notificationListEndpoint,
        MethodType.get,
        (data, {String? realUri}) {
          lastRequestTime.notification = currentDateTime();
          lastRequestTime.notificationUrl = realUri;
          final notificationList =
              (data as List).map((e) => Notifications.fromJson(e)).toList();
          GetIt.I.get<LocalStorage>().saveLastRequestObject(lastRequestTime);
          return notificationList;
        },
        null,
        headerOption: {KEY_HTTP_LAST_REQUEST_TIME: lastRequestTime},
      );
    } on Error catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ApiResponse<List<Plot>>>> getPlotList(
    String? endpoint,
  ) async {
    try {
      var lastRequestTime =
          await GetIt.I.get<LocalStorage>().getLastRequestTime();
      return apiClient.request<List<Plot>>(
        endpoint ?? plotListEndpoint,
        MethodType.get,
        (data, {String? realUri}) {
          lastRequestTime.plot = currentDateTime();
          lastRequestTime.plotUrl = realUri;

          final plotList = (data as List).map((e) => Plot.fromJson(e)).toList();
          GetIt.I.get<LocalStorage>().saveLastRequestObject(lastRequestTime);
          return plotList;
        },
        null,
        headerOption: {KEY_HTTP_LAST_REQUEST_TIME: lastRequestTime},
      );
    } on Error catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ApiResponse<List<Product>>>> getProductList(
    String? endpoint,
  ) async {
    try {
      var lastRequestTime =
          await GetIt.I.get<LocalStorage>().getLastRequestTime();
      return apiClient.request<List<Product>>(
        endpoint ?? productListEndpoint,
        MethodType.get,
        (data, {String? realUri}) {
          lastRequestTime.product = currentDateTime();
          lastRequestTime.productUrl = realUri;

          final productList =
              (data as List).map((e) => Product.fromJson(e)).toList();
          GetIt.I.get<LocalStorage>().saveLastRequestObject(lastRequestTime);
          return productList;
        },
        null,
        headerOption: {KEY_HTTP_LAST_REQUEST_TIME: lastRequestTime},
      );
    } on Error catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ApiResponse<List<Insight>>>> getInsightList(
    String? endpoint,
  ) async {
    try {
      var lastRequestTime =
          await GetIt.I.get<LocalStorage>().getLastRequestTime();
      return apiClient.request<List<Insight>>(
        endpoint ?? dashboardEndpoint,
        MethodType.get,
        (data, {String? realUri}) {
          lastRequestTime.insight = currentDateTime();
          lastRequestTime.insightUrl = realUri;

          final insight = Insight.fromJson(data as Map<String, dynamic>);
          GetIt.I.get<LocalStorage>().saveLastRequestObject(lastRequestTime);
          return [insight];
        },
        null,
        headerOption: {KEY_HTTP_LAST_REQUEST_TIME: lastRequestTime},
      );
    } on Error catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ApiResponse<List<IncidentReport>>>> getIncidentList(
    String? endpoint,
  ) async {
    try {
      var lastRequestTime =
          await GetIt.I.get<LocalStorage>().getLastRequestTime();
      return apiClient.request<List<IncidentReport>>(
        endpoint ?? incidentReportListEndpoint,
        MethodType.get,
        (data, {String? realUri}) {
          lastRequestTime.incident = currentDateTime();
          lastRequestTime.incidentUrl = realUri;

          final incidentList =
              (data as List).map((e) => IncidentReport.fromJson(e)).toList();
          GetIt.I.get<LocalStorage>().saveLastRequestObject(lastRequestTime);
          return incidentList;
        },
        null,
        headerOption: {KEY_HTTP_LAST_REQUEST_TIME: lastRequestTime},
      );
    } on Error catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ApiResponse<List<MarketData>>>> getMarketPriceList(
    String? endpoint,
  ) async {
    try {
      var lastRequestTime =
          await GetIt.I.get<LocalStorage>().getLastRequestTime();
      return apiClient.request<List<MarketData>>(
        endpoint ?? marketPriceListEndpoint,
        MethodType.get,
        (data, {String? realUri}) {
          lastRequestTime.marketPrice = currentDateTime();
          lastRequestTime.marketPriceUrl = realUri;
          final marketPriceList =
              (data as List).map((e) => MarketData.fromJson(e)).toList();
          GetIt.I.get<LocalStorage>().saveLastRequestObject(lastRequestTime);
          return marketPriceList;
        },
        null,
        headerOption: {KEY_HTTP_LAST_REQUEST_TIME: lastRequestTime},
      );
    } on Error catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ApiResponse<List<Weather>>>> getWeatherList(
    String? endpoint,
  ) async {
    try {
      var lastRequestTime =
          await GetIt.I.get<LocalStorage>().getLastRequestTime();
      return apiClient.request<List<Weather>>(
        endpoint ?? weatherListEndpoint,
        MethodType.get,
        (data, {String? realUri}) {
          lastRequestTime.weather = currentDateTime();
          lastRequestTime.weatherUrl = realUri;
          final weatherList =
              (data as List).map((e) => Weather.fromJson(e)).toList();
          GetIt.I.get<LocalStorage>().saveLastRequestObject(lastRequestTime);
          return weatherList;
        },
        null,
        headerOption: {KEY_HTTP_LAST_REQUEST_TIME: lastRequestTime},
      );
    } on Error catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ApiResponse<List<Weather>>>> getLGAWeatherList(
    String? endpoint,
  ) async {
    try {
      var lastRequestTime =
          await GetIt.I.get<LocalStorage>().getLastRequestTime();
      return apiClient.request<List<Weather>>(
        endpoint ?? lgaWeatherListEndpoint,
        MethodType.get,
        (data, {String? realUri}) {
          lastRequestTime.lgaWeather = currentDateTime();
          lastRequestTime.lgaWeatherUrl = realUri;
          final weatherList =
              (data as List).map((e) => Weather.fromJson(e)).toList();
          GetIt.I.get<LocalStorage>().saveLastRequestObject(lastRequestTime);
          return weatherList;
        },
        null,
        headerOption: {KEY_HTTP_LAST_REQUEST_TIME: lastRequestTime},
      );
    } on Error catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ApiResponse<Market>>> createMarket(Market data) {
    return apiClient.request<Market>(
      createMarketEndpoint,
      MethodType.post,
      (data, {String? realUri}) => Market.fromJson(data),
      data.toJson(),
    );
  }

  @override
  Future<Either<Failure, ApiResponse<IncidentReport>>> logIncident(
    IncidentReport data,
  ) {
    return apiClient.request<IncidentReport>(
      createIncidentReportEndpoint,
      MethodType.post,
      (data, {String? realUri}) => IncidentReport.fromJson(data),
      data.toJson(),
    );
  }

  @override
  Future<Either<Failure, ApiResponse<MarketData>>> createMarketPrice(
    MarketData data,
  ) {
    return apiClient.request<MarketData>(
      logMarketPriceEndpoint,
      MethodType.post,
      (data, {String? realUri}) => MarketData.fromJson(data),
      data.toJson(),
    );
  }

  @override
  Future<Either<Failure, ApiResponse<Cooperative>>> createCooperative(
    Cooperative data,
  ) async {
    FormData formData = FormData.fromMap({
      KEY_CODE: data.code,
      KEY_NAME: data.name,
      KEY_DOI: data.doi,
      KEY_LGA_ID: data.lgaId,
      if (data.file != null && data.file!.isNotEmpty)
        KEY_FILE: await MultipartFile.fromFile(
          data.file!,
          filename: basename(data.file!),
        ),
    });
    return apiClient.request<Cooperative>(
      createCooperativeEndpoint,
      MethodType.post,
      (data, {String? realUri}) => Cooperative.fromJson(data),
      formData,
    );
  }

  @override
  Future<Either<Failure, ApiResponse<Farmer>>> createFarmer(Farmer data) async {
    return apiClient.request<Farmer>(
      registerFarmerEndpoint,
      MethodType.post,
      (data, {String? realUri}) => Farmer.fromJson(data),
      {
        KEY_FOLIO_ID: data.folioId,
        KEY_FIRST_NAME: data.firstName,
        KEY_LAST_NAME: data.lastName,
        KEY_OTHER_NAME: data.otherNames,
        KEY_AGE: data.age,
        KEY_TITLE: data.title,
        KEY_GENDER: data.gender,
        KEY_ADDRESS: data.address,
        KEY_PHONE_NUMBER: data.phoneNumber,
        KEY_NIN: data.nin,
        KEY_COOPERATIVE_CODE: data.cooperativeCode,
        KEY_ACCOUNT_NAME: data.accountName,
        KEY_ACCOUNT_NUMBER: data.accountNumber,
        KEY_NOK_NAME: data.nokName,
        KEY_BANK_ID: data.bankId,
        KEY_NOK_PHONE_NUMBER: data.nokPhoneNumber,
        KEY_NOK_ADDRESS: data.nokAddress,
        KEY_NOK_RELATIONSHIP: data.nokRelationship,
        KEY_FARMS: data.farms,
        KEY_BVN: data.bvn,
        KEY_REGISTRATION_DATE: data.registrationDate,
        KEY_WARD_ID: data.wardId,
        KEY_LIVESTOCK_ID: data.livestock,
        KEY_CROP_ID: data.crop,
      },
    );
  }

  @override
  Future<Either<Failure, ApiResponse<FarmVisit>>> createFarmVisit(
    FarmVisit data,
  ) {
    return apiClient.request<FarmVisit>(
      createFarmVisitEndpoint,
      MethodType.post,
      (data, {String? realUri}) => FarmVisit.fromJsonSingle(data),
      data.toJson(),
    );
  }

  // @override
  // Future<Either<Failure, ApiResponse<Farmer>>> createFarmer(Farmer data) async {
  //   // final Map<String, dynamic> farmerJsonData = data;
  //   // debugPrint('Farmer Data ${farmerJsonData.toString()}');

  //   FormData formData = FormData.fromMap({
  //      KEY_FOLIO_ID: data.folioId,
  // KEY_FIRST_NAME: data.firstName,
  // KEY_LAST_NAME: data.lastName,
  // KEY_OTHER_NAME: data.otherNames,
  // KEY_AGE: data.age,
  // KEY_TITLE: data.title,
  // KEY_GENDER: data.gender,
  // KEY_ADDRESS: data.address,
  // KEY_PHONE_NUMBER: data.phoneNumber,
  // KEY_NIN: data.nin,
  // KEY_ACCOUNT_NAME: data.accountName,
  // KEY_ACCOUNT_NUMBER: data.accountNumber,
  // KEY_NOK_NAME: data.nokName,
  // KEY_BANK_ID: data.bankId,
  // KEY_NOK_PHONE_NUMBER: data.nokPhoneNumber,
  // KEY_NOK_ADDRESS: data.nokAddress,
  // KEY_NOK_RELATIONSHIP: data.nokRelationship,
  // KEY_FARMS: data.farmLand,
  // KEY_BVN: data.bvn,
  // KEY_REGISTRATION_DATE: data.registrationDate,
  // KEY_LGA: data.lga,
  // KEY_WARD_ID: data.wardId,
  // KEY_LIVESTOCK_ID: data.livestock,
  // KEY_CROP_ID: data.crop,
  //   });
  //   return apiClient.multipartRequest<Farmer>(
  //     registerFarmerEndpoint,
  //     MethodType.post,
  //     (data, {String? realUri}) => Farmer.fromJson(data),
  //     formData,
  //   );
  // }

  final String _apiKey = 't8ryGLf4.eS51IE0si8fjlw8jCLaxeQu9UjBITSDK';
  final String _url = 'https://payload.vextapp.com/hook/CVTU6U7BQZ/catch/1234';

  @override
  Future<Either<Failure, String>> getAdvisory(Map<String, dynamic> data) async {
    final result = await apiClient.request<String>(
      _url,
      MethodType.post,

      (responseBody, {String? realUri}) => responseBody.toString(),
      data,
      headerOption: {'X-Api-Key': _apiKey, 'Content-Type': 'application/json'},
    );

    return result.map((apiResponse) => apiResponse.data.toString());
  }
}
