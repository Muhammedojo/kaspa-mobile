import 'package:flutter/material.dart';

import '../../../../core/utils/contract.dart';

abstract class ResetPasswordControllerContract {
  late TextEditingController emailController;
  late GlobalKey<FormState> formKey;
  void onPressButton();
}

abstract class ResetPasswordViewContract extends BaseViewContract {}
