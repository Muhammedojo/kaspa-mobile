import 'package:fpdart/fpdart.dart';
import 'package:isar/isar.dart';
import '../../../core/api/api.dart';
import '../../../core/api/exceptions/contracts/failure.dart';
import '../../../core/data/model/crop_calendar.dart';
import '../../../core/data/model/dashboard_data.dart';
import '../../../core/data/model/farm_visit.dart';
import '../../../core/data/model/incident_report.dart';
import '../../../core/data/model/insight.dart';
import '../../../core/data/model/market.dart';
import '../../../core/data/model/market_data.dart';
import '../../../core/data/model/model.dart';
import '../../../core/data/model/plot.dart';
import '../../../core/data/model/product.dart';
import '../../../core/data/model/weather.dart';
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
  Future<Either<Failure, ApiResponse<List<CropCalendar>>>> getCropCalendarList({
    String? endpoint,
  }) => apiServices.getCropCalendarList(endpoint);

  @override
  Future<Either<Failure, ApiResponse<Market>>> createMarket(Market data) =>
      apiServices.createMarket(data);

  @override
  Future<Either<Failure, ApiResponse<MarketData>>> createMarketPrice(
    MarketData data,
  ) => apiServices.createMarketPrice(data);

  @override
  Future<Either<Failure, ApiResponse<List<Cooperative>>>> getCooperativeList({
    String? endpoint,
  }) => apiServices.getCooperativeList(endpoint);

  @override
  Future<Either<Failure, ApiResponse<Cooperative>>> createCooperative(
    Cooperative data,
  ) => apiServices.createCooperative(data);

  @override
  Future<Either<Failure, ApiResponse<List<DashboardData>>>> getDashboardList({
    String? endpoint,
  }) => apiServices.getDashboardList(endpoint);

  @override
  Future<Either<Failure, ApiResponse<List<FarmVisit>>>> getFarmVisitList({
    String? endpoint,
  }) => apiServices.getFarmVisitList(endpoint);

  @override
  Future<Either<Failure, ApiResponse<FarmVisit>>> createFarmVisit(
    FarmVisit data,
  ) => apiServices.createFarmVisit(data);

  @override
  Future<Either<Failure, ApiResponse<List<Insight>>>> getInsightList({
    String? endpoint,
  }) => apiServices.getInsightList(endpoint);

  @override
  Future<Either<Failure, ApiResponse<List<IncidentReport>>>> getIncidentList({
    String? endpoint,
  }) => apiServices.getIncidentList(endpoint);

  @override
  Future<Either<Failure, ApiResponse<IncidentReport>>> logIncident(
    IncidentReport data,
  ) => apiServices.logIncident(data);

  @override
  Future<Either<Failure, ApiResponse<List<Lga>>>> getLgaList({
    String? endpoint,
  }) => apiServices.getLgaList(endpoint);

  @override
  Future<Either<Failure, ApiResponse<List<Livestock>>>> getLivestockList({
    String? endpoint,
  }) => apiServices.getLivestockList(endpoint);

  @override
  Future<Either<Failure, ApiResponse<List<User>>>> getUserList({
    String? endpoint,
  }) => apiServices.getUserList(endpoint);

  @override
  Future<Either<Failure, ApiResponse<List<Market>>>> getMarketList({
    String? endpoint,
  }) => apiServices.getMarketList(endpoint);

  @override
  Future<Either<Failure, ApiResponse<List<Plot>>>> getPlotList({
    String? endpoint,
  }) => apiServices.getPlotList(endpoint);

  @override
  Future<Either<Failure, ApiResponse<List<Product>>>> getProductList({
    String? endpoint,
  }) => apiServices.getProductList(endpoint);

  @override
  Future<Either<Failure, ApiResponse<List<MarketData>>>> getMarketPriceList({
    String? endpoint,
  }) => apiServices.getMarketPriceList(endpoint);

  @override
  Future<Either<Failure, ApiResponse<List<Weather>>>> getWeatherList({
    String? endpoint,
  }) => apiServices.getWeatherList(endpoint);

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
  Future<List<CropCalendar>> getCropCalendar() =>
      localStorage.getCropCalendar();

  @override
  Future<List<DashboardData>> getDashboard() => localStorage.getDashboard();

  @override
  Future<List<FarmVisit>> getFarmVisit() => localStorage.getFarmVisit();

  @override
  Future<List<Insight>> getInsight() => localStorage.getInsight();

  @override
  Future<List<IncidentReport>> getIncident() => localStorage.getIncident();

  @override
  Future<List<Cooperative>> getCooperative({
    String? searchTerm,
    List<WhereClause>? whereClauses,
    Sort? whereSort,
    FilterOperation? filter,
    List<SortProperty>? sortBy,
    bool? isSearching,
    bool? isFiltering,
  }) => localStorage.getCooperative(
    searchTerm: searchTerm,
    filter: filter,
    whereClauses: whereClauses,
    whereSort: whereSort,
    sortBy: sortBy,
    isSearching: isSearching,
    isFiltering: isFiltering,
  );

  @override
  Future<List<Lga>> getLga() => localStorage.getLga();

  @override
  Future<List<Livestock>> getLivestock() => localStorage.getLivestock();

  @override
  Future<List<User>> getUser() => localStorage.getUser();

  @override
  Future<List<Ward>> getWard() => localStorage.getWard();

  @override
  Future<List<Plot>> getPlot() => localStorage.getPlot();

  @override
  Future<List<Product>> getProduct() => localStorage.getProduct();

  @override
  Future<List<Market>> getMarket() => localStorage.getMarket();
  @override
  Future<List<MarketData>> getMarketPrice() => localStorage.getMarketPrice();

  @override
  Future<List<Weather>> getWeather() => localStorage.getWeather();

  //SAVE LOCAL STORAGE CALLS
  @override
  Future<void> saveBank(List<Bank> bankList) => localStorage.saveBank(bankList);

  @override
  Future<void> saveCrop(List<Crop> cropList) => localStorage.saveCrop(cropList);

  @override
  Future<void> saveCropCalendar(List<CropCalendar> cropCalendarList) =>
      localStorage.saveCropCalendar(cropCalendarList);

  @override
  Future<void> saveCooperative(List<Cooperative> cooperativeList) =>
      localStorage.saveCooperative(cooperativeList);

  @override
  Future<void> saveDashboard(List<DashboardData> dashboardList) =>
      localStorage.saveDashboard(dashboardList);

  @override
  Future<void> saveFarmVisit(List<FarmVisit> farmVisitList) =>
      localStorage.saveFarmVisit(farmVisitList);

  @override
  Future<void> saveLga(List<Lga> lgaList) => localStorage.saveLga(lgaList);

  @override
  Future<void> saveLivestock(List<Livestock> livestockList) =>
      localStorage.saveLivestock(livestockList);
  @override
  Future<void> saveWard(List<Ward> wardList) => localStorage.saveWard(wardList);

  @override
  Future<void> saveProduct(List<Product> productList) =>
      localStorage.saveProduct(productList);

  @override
  Future<void> savePlot(List<Plot> plotList) => localStorage.savePlot(plotList);

  @override
  Future<void> saveInsight(List<Insight> insightList) =>
      localStorage.saveInsight(insightList);

  @override
  Future<void> saveIncident(List<IncidentReport> incidentList) =>
      localStorage.saveIncident(incidentList);

  @override
  Future<void> saveUser(List<User> usersList) =>
      localStorage.saveUser(usersList);

  @override
  Future<void> saveMarket(List<Market> marketList) =>
      localStorage.saveMarket(marketList);

  @override
  Future<void> saveMarketPrice(List<MarketData> marketPriceList) =>
      localStorage.saveMarketPrice(marketPriceList);

  @override
  Future<void> saveWeather(List<Weather> weatherList) =>
      localStorage.saveWeather(weatherList);
}
