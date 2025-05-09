import 'package:flutter/material.dart';

import '../../../../core/utils/contract.dart';

abstract class HomePageControllerContract {
  void logout();
  late PageController pageController;
  late int currentPage;
  void monitor(index);
}

abstract class HomePageViewContract extends BaseViewContract {}
