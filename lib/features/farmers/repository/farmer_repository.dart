import 'package:fpdart/fpdart.dart';

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
  Future<Either<Failure, ApiResponse<Farmer>>> createFarmer(Farmer data) => apiServices.createFarmer(data);

   @override
  Future<Either<Failure, ApiResponse<List<Farmer>>>> getFarmerList({
    String? endpoint,
  }) => apiServices.getFarmerList(endpoint);


}
