import '../../../../core/data/model/crop.dart';
import '../../../../core/data/model/crop_calendar.dart';
import '../../../../core/utils/contract.dart';

abstract class CropActivityControllerContract {
  late CropCalendar crop;
}

abstract class CropActivityViewContract extends BaseViewContract {}
