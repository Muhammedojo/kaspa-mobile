import 'package:fpdart/fpdart.dart';
import '../../../core/api/exceptions/contracts/failure.dart';
import '../../../core/api/services/contracts/api_response.dart';
import '../../../core/data/model/farmer.dart';

abstract class IFarmerRepository {
   Future<Either<Failure, ApiResponse<Farmer>>> createFarmer(Farmer data);
}