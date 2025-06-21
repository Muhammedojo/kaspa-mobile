import 'package:flutter/material.dart';
import '../../../../core/data/model/farm_visit.dart';
import '../contract/farm_visit_crops.dart';
import '../view/farm_visit_crops.dart';

class FarmVisitCropsScreen extends StatefulWidget {
  final FarmVisit visit;
  const FarmVisitCropsScreen({super.key, required this.visit});

  @override
  State<FarmVisitCropsScreen> createState() => _FarmVisitCropsScreenState();
}

class _FarmVisitCropsScreenState extends State<FarmVisitCropsScreen>
    implements FarmVisitCropsControllerContract {
  late final FarmVisitCropsViewContract view;

  @override
  void initState() {
    super.initState();
    visit = widget.visit;
    view = FarmVisitCropsView(controller: this);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  FarmVisit visit = FarmVisit();

  @override
  Widget build(BuildContext context) {
    return view.build(context);
  }
}
