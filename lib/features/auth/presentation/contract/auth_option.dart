import '../../../../core/utils/contract.dart';

abstract class AuthOptionControllerContract {
  void navigateToLogin();
  void navigateToResetPassword();
}

abstract class AuthOptionViewContract extends BaseViewContract {}
