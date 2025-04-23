import 'package:flutter/material.dart';
import '../contract/insight.dart';
import '../view/insight.dart';


class InsightScreen extends StatefulWidget {
  const InsightScreen({super.key});

  @override
  State<InsightScreen> createState() => _InsightScreenState();
}

class _InsightScreenState extends State<InsightScreen>
    implements InsightControllerContract {
  late final InsightViewContract view;

  @override
  void initState() {
    super.initState();
    view = InsightView(controller: this);
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
