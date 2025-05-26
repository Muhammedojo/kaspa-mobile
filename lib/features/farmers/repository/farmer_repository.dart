import 'package:fpdart/fpdart.dart';
import 'package:isar/isar.dart';
import '../../../core/api/api.dart';
import '../../../core/api/exceptions/contracts/failure.dart';
import '../../../core/data/model/farmer.dart';
import '../../../core/storage/istorage.dart';
import 'farmer_repository_contract.dart';

class FarmerRepository implements IFarmerRepository {
  final LocalStorage localStorage;
  final ApiServices apiServices;

  FarmerRepository({required this.localStorage, required this.apiServices});

  @override
  Future<Either<Failure, ApiResponse<Farmer>>> createFarmer(Farmer data) =>
      apiServices.createFarmer(data);

  @override
  Future<Either<Failure, ApiResponse<List<Farmer>>>> getFarmerList({
    String? endpoint,
  }) {
    return apiServices.getFarmerList(endpoint);
  }

  @override
  Future<void> saveFarmer(List<Farmer> farmerList) =>
      localStorage.saveFarmer(farmerList);

  @override
  Future<List<Farmer>> getFarmer({
    String? searchTerm,
    List<WhereClause>? whereClauses,
    Sort? whereSort,
    FilterOperation? filter,
    List<SortProperty>? sortBy,
    bool? isSearching,
    bool? isFiltering,
  }) => localStorage.getFarmer(
    searchTerm: searchTerm,
    filter: filter,
    whereClauses: whereClauses,
    whereSort: whereSort,
    sortBy: sortBy,
    isSearching: isSearching,
    isFiltering: isFiltering,
  );
}
