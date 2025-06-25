import '../../../../core/data/model/crop_activities.dart';
import '../../../../core/data/model/insight.dart';
import '../../../../core/utils/contract.dart';

abstract class CropActivitiesControllerContract {
  late FarmCrop farmCrop;
  void previewLogModal(CropActivities data);
}

abstract class CropActivitiesViewContract extends BaseViewContract {}