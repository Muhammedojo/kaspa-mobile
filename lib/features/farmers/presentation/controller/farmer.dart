import 'package:flutter/material.dart';

import '../contract/farmer.dart';
import '../view/farmer.dart';


class FarmerScreen extends StatefulWidget {
  const FarmerScreen({super.key});

  @override
  State<FarmerScreen> createState() => _FarmerScreenState();
}

class _FarmerScreenState extends State<FarmerScreen>
    implements FarmerControllerContract {
  late final FarmerViewContract view;

  @override
  void initState() {
    super.initState();
    view = FarmerView(controller: this);
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
