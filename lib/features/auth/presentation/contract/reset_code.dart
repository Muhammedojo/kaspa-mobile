import 'package:flutter/material.dart';

import '../../../../core/utils/contract.dart';

abstract class ResetCodeControllerContract {
  late TextEditingController codeController;
  String get email;
  String get token;
  void onPressButton();
}

abstract class ResetCodeViewContract extends BaseViewContract {}
