import 'package:flutter/material.dart';
import '../../../../core/data/model/farmer.dart';
import '../contract/farmer_details.dart';
import '../view/farmer_details.dart';


class FarmerDetailsScreen extends StatefulWidget {
  final Farmer farmer;
  const FarmerDetailsScreen({super.key,required this.farmer});

  @override
  State<FarmerDetailsScreen> createState() => _FarmerDetailsScreenState();
}

class _FarmerDetailsScreenState extends State<FarmerDetailsScreen>
    implements FarmerDetailsControllerContract {
  late final FarmerDetailsViewContract view;

  @override
  void initState() {
    super.initState();
    farmer = widget.farmer;
    view = FarmerDetailsView(controller: this);
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
