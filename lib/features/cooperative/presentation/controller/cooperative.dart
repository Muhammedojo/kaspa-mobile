import 'package:flutter/material.dart';

import '../contract/cooperative.dart';
import '../view/cooperative.dart';


class CooperativeScreen extends StatefulWidget {
  const CooperativeScreen({super.key});

  @override
  State<CooperativeScreen> createState() => _CooperativeScreenState();
}

class _CooperativeScreenState extends State<CooperativeScreen>
    implements CooperativeControllerContract {
  late final CooperativeViewContract view;

  @override
  void initState() {
    super.initState();
    view = CooperativeView(controller: this);
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
