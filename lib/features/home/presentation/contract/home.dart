import 'package:flutter/material.dart';

import '../../../../core/utils/contract.dart';

abstract class HomeControllerContract {
  void onItemTapped(int index);
  int selectedIndex = 0;
  late List<Widget> widgetOptions;
  //loadDataFromServer();
}

abstract class HomeViewContract extends BaseViewContract {}
