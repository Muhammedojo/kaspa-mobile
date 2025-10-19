import '../../../../core/data/model/crop_calendar.dart';
import '../../../../core/utils/contract.dart';

abstract class CropActivityControllerContract {
  late CropCalendar crop;
  void tabClick(int index);
  late int selectedTabIndex;
}

abstract class CropActivityViewContract extends BaseViewContract {}
