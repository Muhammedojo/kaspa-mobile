import 'package:flutter/material.dart';
import '../../../../core/data/model/farmer.dart';
import '../contract/farmer_confirmation.dart';
import '../view/farmer_confirmation.dart';


class FarmerConfirmationScreen extends StatefulWidget {
  final Farmer farmer;
  const FarmerConfirmationScreen({super.key,required this.farmer});

  @override
  State<FarmerConfirmationScreen> createState() => _FarmerConfirmationScreenState();
}

class _FarmerConfirmationScreenState extends State<FarmerConfirmationScreen>
    implements FarmerConfirmationControllerContract {
  late final FarmerConfirmationViewContract view;

  @override
  void initState() {
    super.initState();
    farmer = widget.farmer;
    view = FarmerConfirmationView(controller: this);
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
