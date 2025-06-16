import 'package:flutter/material.dart';
import '../contract/calendar.dart';
import '../view/calendar.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

enum CalendarDisplayMode { week, month }

class _CalendarScreenState extends State<CalendarScreen>
    implements CalendarControllerContract {
  late final CalendarViewContract view;

  @override
  late ScrollController scrollController;

  @override
  int selectedTabIndex = 0;

  @override
  bool showFixedTabs = false;

  @override
  CalendarDisplayMode calendarDisplayMode = CalendarDisplayMode.week;

  @override
  DateTime focusedDay = DateTime.now();

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(onScroll);

    view = CalendarView(controller: this);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void onScroll() {
    if (scrollController.offset > 200 && !showFixedTabs) {
      setState(() {
        showFixedTabs = true;
      });
    } else if (scrollController.offset <= 200 && showFixedTabs) {
      setState(() {
        showFixedTabs = false;
      });
    }
  }

  @override
  void changeCalendarDisplayMode(CalendarDisplayMode mode) {
    setState(() {
      calendarDisplayMode = mode;
    });
  }

   @override
  void onDaySelected(DateTime selectedDay, DateTime newFocusedDay) {
    setState(() {
      focusedDay = newFocusedDay;
    });
  }

  @override
  void tabClick(int index) {
    setState(() {
      selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return view.build(context);
  }
}
