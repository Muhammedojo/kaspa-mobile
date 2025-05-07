import 'package:flutter/material.dart';
import '../../../../core/data/model/cooperative.dart';
import '../contract/cooperative_details.dart';
import '../view/cooperative_details.dart';


class CooperativeDetailsScreen extends StatefulWidget {
  final Cooperative cooperative;
  const CooperativeDetailsScreen({super.key, required this.cooperative});

  @override
  State<CooperativeDetailsScreen> createState() => _CooperativeDetailsScreenState();
}

class _CooperativeDetailsScreenState extends State<CooperativeDetailsScreen>
    implements CooperativeDetailsControllerContract {
  late final CooperativeDetailsViewContract view;

  @override
  void initState() {
    super.initState();
    view = CooperativeDetailsView(controller: this);
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
