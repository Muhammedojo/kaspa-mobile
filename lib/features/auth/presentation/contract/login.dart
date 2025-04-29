import 'package:flutter/material.dart';

import '../../../../core/utils/contract.dart';

abstract class LoginControllerContract {
    late bool obscurePassword;
  bool? rememberMe;
  late TextEditingController emailController, passwordController;
  late GlobalKey<FormState> formKey;

  void forgotPassword();
  void onPasswordVisible();
  void onPressLoginButton();
  void onSelectRememberMe(bool? status);
}

abstract class LoginViewContract extends BaseViewContract {}
