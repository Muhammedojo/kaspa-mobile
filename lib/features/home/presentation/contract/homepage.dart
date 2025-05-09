import 'package:flutter/material.dart';

import '../../../../core/utils/contract.dart';

abstract class HomePageControllerContract {
  void logout();
  late PageController pageController;
  late int currentPage;
  void monitor(index);
  void registerFarmer();
  void farmVisit();
  void priceUpdate();
  void report();
}

abstract class HomePageViewContract extends BaseViewContract {}
