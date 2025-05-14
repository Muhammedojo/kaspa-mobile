import 'package:fpdart/fpdart.dart';
import '../../../core/api/api.dart';
import '../../../core/api/exceptions/contracts/failure.dart';
import '../../../core/data/model/market.dart';
import '../../../core/data/model/market_data.dart';
import '../../../core/data/model/model.dart';
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
  Future<Either<Failure, ApiResponse<Market>>> createMarket(Market data) =>
      apiServices.createMarket(data);

       @override
  Future<Either<Failure, ApiResponse<Market>>> createMarketPrice(Market data) =>
      apiServices.createMarketPrice(data);



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
  Future<Either<Failure, ApiResponse<List<User>>>> getUserList({
    String? endpoint,
  }) => apiServices.getUserList(endpoint);

  @override
  Future<Either<Failure, ApiResponse<List<Market>>>> getMarketList({
    String? endpoint,
  }) => apiServices.getMarketList(endpoint);

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
  Future<List<Cooperative>> getCooperative() => localStorage.getCooperative();

  @override
  Future<List<Lga>> getLga() => localStorage.getLga();

  @override
  Future<List<Livestock>> getLivestock() => localStorage.getLivestock();

  @override
  Future<List<User>> getUser() => localStorage.getUser();

  @override
  Future<List<Ward>> getWard() => localStorage.getWard();

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
  Future<void> saveCooperative(List<Cooperative> cooperativeList) =>
      localStorage.saveCooperative(cooperativeList);
  @override
  Future<void> saveLga(List<Lga> lgaList) => localStorage.saveLga(lgaList);
  @override
  Future<void> saveLivestock(List<Livestock> livestockList) =>
      localStorage.saveLivestock(livestockList);
  @override
  Future<void> saveWard(List<Ward> wardList) => localStorage.saveWard(wardList);
 
  @override
  Future<void> saveProduct(List<Product> productList) => localStorage.saveProduct(productList);
  
 
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
