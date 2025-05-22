import 'package:flutter/material.dart';
import '../../../../core/data/model/farmer.dart';
import '../contract/farmer_farm_location.dart';
import '../view/farmer_farm_location.dart';

class FarmerFarmLocationScreen extends StatefulWidget {
  final Farmer farmer;
  const FarmerFarmLocationScreen({super.key,required this.farmer});

  @override
  State<FarmerFarmLocationScreen> createState() => _FarmerFarmLocationScreenState();
}

class _FarmerFarmLocationScreenState extends State<FarmerFarmLocationScreen>
    implements FarmerFarmLocationControllerContract {
  late final FarmerFarmLocationViewContract view;

  @override
  void initState() {
    super.initState();
    farmer = widget.farmer;
    view = FarmerFarmLocationView(controller: this);
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
