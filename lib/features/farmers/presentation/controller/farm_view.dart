import 'package:flutter/material.dart';
import '../../../../core/data/model/farmer.dart';
import '../contract/farm_view.dart';
import '../view/farm_view.dart';

class FarmScreen extends StatefulWidget {
  final Farmer farmer;
  const FarmScreen({super.key, required this.farmer});

  @override
  State<FarmScreen> createState() => _FarmScreenState();
}

class _FarmScreenState extends State<FarmScreen>
    implements FarmControllerContract {
  late final FarmViewContract view;

  @override
  void initState() {
    super.initState();
    farmer = widget.farmer;
    view = FarmView(controller: this);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return view.build(context);
  }

  @override
  Farmer farmer = Farmer();
}
