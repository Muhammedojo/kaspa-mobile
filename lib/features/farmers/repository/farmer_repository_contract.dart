import 'package:fpdart/fpdart.dart';
import '../../../core/api/exceptions/contracts/failure.dart';
import '../../../core/api/services/contracts/api_response.dart';
import '../../../core/data/model/farmer.dart';

abstract class IFarmerRepository {
  Future<Either<Failure, ApiResponse<Farmer>>> createFarmer(Farmer data);

  //FARMER CUBIT CALLS
  Future<Either<Failure, ApiResponse<List<Farmer>>>> getFarmerList({
    String? endpoint,
  });

  Future<void> saveFarmer(List<Farmer> farmerList);

  Future<List<Farmer>> getFarmer();
}
