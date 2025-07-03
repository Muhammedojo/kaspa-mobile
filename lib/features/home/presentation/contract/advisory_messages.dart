import '../../../../core/data/model/advisory.dart';
import '../../../../core/utils/contract.dart';

abstract class AdvisoryMessageControllerContract {
  void previewLogModal(Advisory data);
}

abstract class AdvisoryMessageViewContract extends BaseViewContract {}
