import 'package:fpdart/fpdart.dart';
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
import '../data/model/product.dart';
import '../data/model/weather.dart';
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

  Future<Either<Failure, ApiResponse<List<CropCalendar>>>> getCropCalendarList(
    String? endpoint,
  );

  Future<Either<Failure, ApiResponse<List<Cooperative>>>> getCooperativeList(
    String? endpoint,
  );

    Future<Either<Failure, ApiResponse<List<DashboardData>>>> getDashboardList(
    String? endpoint,
  );

  Future<Either<Failure, ApiResponse<List<Farmer>>>> getFarmerList(
    String? endpoint,
  );

   Future<Either<Failure, ApiResponse<List<FarmVisit>>>> getFarmVisitList(
    String? endpoint,
  );

  Future<Either<Failure, ApiResponse<List<Lga>>>> getLgaList(String? endpoint);

  Future<Either<Failure, ApiResponse<List<Livestock>>>> getLivestockList(
    String? endpoint,
  );

  Future<Either<Failure, ApiResponse<List<User>>>> getUserList(
    String? endpoint,
  );

  Future<Either<Failure, ApiResponse<List<Ward>>>> getWardList(
    String? endpoint,
  );

  Future<Either<Failure, ApiResponse<List<Product>>>> getProductList(
    String? endpoint,
  );

    Future<Either<Failure, ApiResponse<List<Insight>>>> getInsightList(
    String? endpoint,
  );

    Future<Either<Failure, ApiResponse<List<IncidentReport>>>> getIncidentList(
    String? endpoint,
  );

  Future<Either<Failure, ApiResponse<List<Market>>>> getMarketList(
    String? endpoint,
  );

  Future<Either<Failure, ApiResponse<List<MarketData>>>> getMarketPriceList(
    String? endpoint,
  );

  Future<Either<Failure, ApiResponse<List<Weather>>>> getWeatherList(
    String? endpoint,
  );

  Future<Either<Failure, ApiResponse<Farmer>>> createFarmer(Farmer data);

  Future<Either<Failure, ApiResponse<Market>>> createMarket(Market data);

  Future<Either<Failure, ApiResponse<Cooperative>>> createCooperative(Cooperative data);

  Future<Either<Failure, ApiResponse<MarketData>>> createMarketPrice(MarketData data);

  Future<Either<Failure, ApiResponse<IncidentReport>>> logIncident(IncidentReport data);

  Future<Either<Failure, ApiResponse<FarmVisit>>> createFarmVisit(FarmVisit data);
}
