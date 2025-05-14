import 'package:fpdart/fpdart.dart';
import '../../../core/api/api.dart';
import '../../../core/api/exceptions/contracts/failure.dart';
import '../../../core/data/model/market.dart';
import '../../../core/data/model/market_data.dart';
import '../../../core/data/model/model.dart';
import '../../../core/data/model/product.dart';
import '../../../core/data/model/weather.dart';

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

  //MARKET-PRICE CUBIT CALLS
  Future<Either<Failure, ApiResponse<List<MarketData>>>> getMarketPriceList({
    String? endpoint,
  });

  Future<void> saveMarketPrice(List<MarketData> marketPriceList);

  Future<List<MarketData>> getMarketPrice();

    Future<Either<Failure, ApiResponse<Market>>> createMarketPrice(Market data);


  //MARKET CUBIT CALLS
  Future<Either<Failure, ApiResponse<List<Market>>>> getMarketList({
    String? endpoint,
  });

  Future<void> saveMarket(List<Market> marketList);

  Future<List<Market>> getMarket();

  Future<Either<Failure, ApiResponse<Market>>> createMarket(Market data);

  //PRODUCT CUBIT CALLS
  Future<Either<Failure, ApiResponse<List<Product>>>> getProductList({
    String? endpoint,
  });

  Future<void> saveProduct(List<Product> productList);

  Future<List<Product>> getProduct();

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

  //WEATHER CUBIT CALLS
  Future<Either<Failure, ApiResponse<List<Weather>>>> getWeatherList({
    String? endpoint,
  });

  Future<void> saveWeather(List<Weather> weatherList);

  Future<List<Weather>> getWeather();
}
