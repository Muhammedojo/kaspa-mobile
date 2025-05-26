import 'package:flutter/material.dart';
import '../contract/notification.dart';
import '../view/notification.dart';


class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen>
    implements NotificationControllerContract {
  late final NotificationViewContract view;

  

  @override
  void initState() {

    super.initState();
    view = NotificationView(controller: this);
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

