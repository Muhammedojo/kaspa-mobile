import 'package:flutter/material.dart';

import '../../../../core/utils/contract.dart';

abstract class ChangePasswordControllerContract {
  late bool obscurePassword;
  late TextEditingController confirmPasswordController, passwordController;
  late GlobalKey<FormState> formKey;
  void onPasswordVisible();
  void onPressButton();
  String get otp;
  String get token;
}

abstract class ChangePasswordViewContract extends BaseViewContract {}
