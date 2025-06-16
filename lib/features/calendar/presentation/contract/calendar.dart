import 'package:flutter/cupertino.dart';
import '../../../../features/calendar/presentation/controller/calendar.dart';
import '../../../../core/utils/contract.dart';

abstract class CalendarControllerContract {
  void onScroll();
  void tabClick(int index);
  void changeCalendarDisplayMode(CalendarDisplayMode displayMode);
  late bool showFixedTabs;
  late int selectedTabIndex;

  late ScrollController scrollController;

  late CalendarDisplayMode calendarDisplayMode;
  late DateTime focusedDay;
  void onDaySelected(DateTime selectedDay, DateTime focusedDay);
}

abstract class CalendarViewContract extends BaseViewContract {}
