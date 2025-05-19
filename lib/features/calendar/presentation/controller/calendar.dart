import 'package:flutter/material.dart';
import '../contract/calendar.dart';
import '../view/calendar.dart';


class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen>
    implements CalendarControllerContract {
  late final CalendarViewContract view;

  @override
  void initState() {
    super.initState();
    view = CalendarView(controller: this);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return view.build(context);
  }
}
