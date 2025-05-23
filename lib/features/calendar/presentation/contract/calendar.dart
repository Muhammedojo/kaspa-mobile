import 'package:flutter/cupertino.dart';

import '../../../../core/utils/contract.dart';

abstract class CalendarControllerContract {
  void onScroll();
  void tabClick(int index);

  late bool showFixedTabs;
  late int selectedTabIndex;

  late ScrollController scrollController;
}

abstract class CalendarViewContract extends BaseViewContract {}
