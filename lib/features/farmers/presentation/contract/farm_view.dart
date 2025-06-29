import '../../../../core/data/model/farmer.dart';
import '../../../../core/utils/contract.dart';

abstract class FarmControllerContract {
  late Farmer farmer;
}

abstract class FarmViewContract extends BaseViewContract {}
