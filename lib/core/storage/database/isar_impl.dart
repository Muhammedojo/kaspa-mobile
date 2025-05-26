import 'package:flutter/foundation.dart';
import '../../../../core/data/model/market.dart';
import '../../../../core/data/model/plot.dart';
import 'package:path_provider/path_provider.dart';
import '../../data/model/crop_calendar.dart';
import '../../data/model/dashboard_data.dart';
import '../../data/model/farm_visit.dart';
import '../../data/model/incident_report.dart';
import '../../data/model/insight.dart';
import '../../data/model/market_data.dart';
import '../../data/model/model.dart';
import '../../data/model/product.dart';
import '../../data/model/weather.dart';
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
          CropCalendarSchema,
          CooperativeSchema,
          DashboardDataSchema,
          FarmerSchema,
          FarmVisitSchema,
          LgaSchema,
          LivestockSchema,
          MarketSchema,
          MarketDataSchema,
          IncidentReportSchema,
          InsightSchema,
          ProductSchema,
          PlotSchema,
          WardSchema,
          WeatherSchema,
          UserSchema,
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
  Future<List<CropCalendar>> getCropCalendar() {
    if (!_isar.isOpen) {
      return Future.value(<CropCalendar>[]);
    }
    try {
      final cropCalendars = _isar.cropCalendars.where().findAllSync();
      return Future.value(cropCalendars);
    } catch (e) {
      debugPrint("Error retrieving crop calendars: $e");
      return Future.value(<CropCalendar>[]);
    }
  }

  @override
  Future<List<Cooperative>> getCooperative({
    String? searchTerm,
    List<WhereClause>? whereClauses = const [],
    Sort? whereSort = Sort.desc,
    FilterOperation? filter,
    List<SortProperty>? sortBy = const [],
    bool? isSearching = false,
    bool? isFiltering = false,
  }) async {
    if (!_isar.isOpen) {
      return <Cooperative>[];
    }
    try {
      if (searchTerm != null && searchTerm.isNotEmpty) {
        return _isar.cooperatives
            .filter()
            .codeContains(searchTerm, caseSensitive: false)
            .or()
            .nameContains(searchTerm, caseSensitive: false)
            .or()
            .headContains(searchTerm, caseSensitive: false)
            .findAll();
      } else {
        return _isar.cooperatives.where().findAll();
      }
    } catch (e) {
      debugPrint("Error retrieving cooperatives: $e");
      return <Cooperative>[];
    }
  }

  @override
  Future<List<Farmer>> getFarmer({
    String? searchTerm,
    List<WhereClause>? whereClauses = const [],
    Sort? whereSort = Sort.desc,
    FilterOperation? filter,
    List<SortProperty>? sortBy = const [],
    bool? isSearching = false,
    bool? isFiltering = false,
  }) async {
    if (!_isar.isOpen) {
      return <Farmer>[];
    }
    try {
      if (searchTerm != null && searchTerm.isNotEmpty) {
        return _isar.farmers
            .filter()
            .folioIdContains(searchTerm, caseSensitive: false)
            .or()
            .firstNameContains(searchTerm, caseSensitive: false)
            .or()
            .phoneNumberContains(searchTerm, caseSensitive: false)
            .findAll();
      } else {
        return _isar.farmers.where().findAll();
      }
    } catch (e) {
      debugPrint("Error retrieving farmers: $e");
      return <Farmer>[];
    }
  }

  @override
  Future<List<FarmVisit>> getFarmVisit() {
    if (!_isar.isOpen) {
      return Future.value(<FarmVisit>[]);
    }
    try {
      final farmVisit = _isar.farmVisits.where().findAllSync();
      return Future.value(farmVisit);
    } catch (e) {
      debugPrint("Error retrieving farm visit: $e");
      return Future.value(<FarmVisit>[]);
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
  Future<List<Plot>> getPlot() {
    if (!_isar.isOpen) {
      return Future.value(<Plot>[]);
    }
    try {
      final plots = _isar.plots.where().findAllSync();
      return Future.value(plots);
    } catch (e) {
      debugPrint("Error retrieving plots: $e");
      return Future.value(<Plot>[]);
    }
  }

  @override
  Future<List<Product>> getProduct() {
    if (!_isar.isOpen) {
      return Future.value(<Product>[]);
    }
    try {
      final products = _isar.products.where().findAllSync();
      return Future.value(products);
    } catch (e) {
      debugPrint("Error retrieving products: $e");
      return Future.value(<Product>[]);
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
  Future<List<Market>> getMarket() {
    if (!_isar.isOpen) {
      return Future.value(<Market>[]);
    }
    try {
      final markets = _isar.markets.where().findAllSync();
      return Future.value(markets);
    } catch (e) {
      debugPrint("Error retrieving markets: $e");
      return Future.value(<Market>[]);
    }
  }

  @override
  Future<List<MarketData>> getMarketPrice() {
    if (!_isar.isOpen) {
      return Future.value(<MarketData>[]);
    }
    try {
      final marketPrices = _isar.marketDatas.where().findAllSync();
      return Future.value(marketPrices);
    } catch (e) {
      debugPrint("Error retrieving market prices: $e");
      return Future.value(<MarketData>[]);
    }
  }

  @override
  Future<List<User>> getUser() {
    if (!_isar.isOpen) {
      return Future.value(<User>[]);
    }
    try {
      final users = _isar.users.where().findAllSync();
      return Future.value(users);
    } catch (e) {
      debugPrint("Error retrieving users: $e");
      return Future.value(<User>[]);
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
  Future<List<Insight>> getInsight() {
    if (!_isar.isOpen) {
      return Future.value(<Insight>[]);
    }
    try {
      final insights = _isar.insights.where().findAllSync();
      return Future.value(insights);
    } catch (e) {
      debugPrint("Error retrieving insights: $e");
      return Future.value(<Insight>[]);
    }
  }

  @override
  Future<List<IncidentReport>> getIncident() {
    if (!_isar.isOpen) {
      return Future.value(<IncidentReport>[]);
    }
    try {
      final incidents = _isar.incidentReports.where().findAllSync();
      return Future.value(incidents);
    } catch (e) {
      debugPrint("Error retrieving incidents: $e");
      return Future.value(<IncidentReport>[]);
    }
  }

  @override
  Future<List<DashboardData>> getDashboard() {
    if (!_isar.isOpen) {
      return Future.value(<DashboardData>[]);
    }
    try {
      final dashboards = _isar.dashboardDatas.where().findAllSync();
      return Future.value(dashboards);
    } catch (e) {
      debugPrint("Error retrieving dashboards: $e");
      return Future.value(<DashboardData>[]);
    }
  }

  @override
  Future<List<Weather>> getWeather() {
    if (!_isar.isOpen) {
      return Future.value(<Weather>[]);
    }
    try {
      final weathers = _isar.weathers.where().findAllSync();
      return Future.value(weathers);
    } catch (e) {
      debugPrint("Error retrieving weathers: $e");
      return Future.value(<Weather>[]);
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
  Future<void> saveCropCalendar(List<CropCalendar> objectList) async {
    if (!_isar.isOpen) {
      return;
    }
    try {
      await _isar.writeTxn(() => _isar.cropCalendars.putAll(objectList));
    } catch (e) {
      debugPrint("Error saving crop calendars: $e");
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
  Future<void> saveDashboard(List<DashboardData> objectList) async {
    if (!_isar.isOpen) {
      return;
    }
    try {
      await _isar.writeTxn(() => _isar.dashboardDatas.putAll(objectList));
    } catch (e) {
      debugPrint("Error saving dashboard: $e");
    }
  }

  @override
  Future<void> saveFarmVisit(List<FarmVisit> objectList) async {
    if (!_isar.isOpen) {
      return;
    }
    try {
      await _isar.writeTxn(() => _isar.farmVisits.putAll(objectList));
    } catch (e) {
      debugPrint("Error saving farm visit: $e");
    }
  }

  @override
  Future<void> saveIncident(List<IncidentReport> objectList) async {
    if (!_isar.isOpen) {
      return;
    }
    try {
      await _isar.writeTxn(() => _isar.incidentReports.putAll(objectList));
    } catch (e) {
      debugPrint("Error saving incident report: $e");
    }
  }

  @override
  Future<void> saveInsight(List<Insight> objectList) async {
    if (!_isar.isOpen) {
      return;
    }
    try {
      await _isar.writeTxn(() => _isar.insights.putAll(objectList));
    } catch (e) {
      debugPrint("Error saving insight: $e");
    }
  }

  @override
  Future<void> saveFarmer(List<Farmer> objectList) async {
    if (!_isar.isOpen) {
      return;
    }
    try {
      await _isar.writeTxn(() => _isar.farmers.putAll(objectList));
    } catch (e) {
      debugPrint("Error saving farmer: $e");
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
  Future<void> savePlot(List<Plot> objectList) async {
    if (!_isar.isOpen) {
      return;
    }
    try {
      await _isar.writeTxn(() => _isar.plots.putAll(objectList));
    } catch (e) {
      debugPrint("Error saving plot: $e");
    }
  }

  @override
  Future<void> saveProduct(List<Product> objectList) async {
    if (!_isar.isOpen) {
      return;
    }
    try {
      await _isar.writeTxn(() => _isar.products.putAll(objectList));
    } catch (e) {
      debugPrint("Error saving product: $e");
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
  Future<void> saveMarket(List<Market> objectList) async {
    if (!_isar.isOpen) {
      return;
    }
    try {
      await _isar.writeTxn(() => _isar.markets.putAll(objectList));
    } catch (e) {
      debugPrint("Error saving market: $e");
    }
  }

  @override
  Future<void> saveMarketPrice(List<MarketData> objectList) async {
    if (!_isar.isOpen) {
      return;
    }
    try {
      await _isar.writeTxn(() => _isar.marketDatas.putAll(objectList));
    } catch (e) {
      debugPrint("Error saving market prices: $e");
    }
  }

  @override
  Future<void> saveUser(List<User> objectList) async {
    if (!_isar.isOpen) {
      return;
    }
    try {
      await _isar.writeTxn(() => _isar.users.putAll(objectList));
    } catch (e) {
      debugPrint("Error saving user: $e");
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

  @override
  Future<void> saveWeather(List<Weather> objectList) async {
    if (!_isar.isOpen) {
      return;
    }
    try {
      await _isar.writeTxn(() => _isar.weathers.putAll(objectList));
    } catch (e) {
      debugPrint("Error saving weather : $e");
    }
  }
}
