import 'package:flutter/material.dart';

import '../../../../core/utils/contract.dart';

abstract class ChangePasswordControllerContract {
    late bool obscurePassword;
  bool? rememberMe;
  late TextEditingController emailController, passwordController;
  late GlobalKey<FormState> formKey;

  void forgotPassword();
  void onPasswordVisible();
  void onPressButton();
  void onSelectRememberMe(bool? status);


   String get otp;
  String get token;
}

abstract class ChangePasswordViewContract extends BaseViewContract {}
