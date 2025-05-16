import 'package:flutter/material.dart';
import '../../../../core/data/model/cooperative.dart';
import '../contract/cooperative_confirmation.dart';
import '../view/cooperative_confirmation.dart';


class CooperativeConfirmationScreen extends StatefulWidget {
  final Cooperative cooperative;
  const CooperativeConfirmationScreen({super.key,required this.cooperative});

  @override
  State<CooperativeConfirmationScreen> createState() => _CooperativeConfirmationScreenState();
}

class _CooperativeConfirmationScreenState extends State<CooperativeConfirmationScreen>
    implements CooperativeConfirmationControllerContract {
  late final CooperativeConfirmationViewContract view;

  @override
  void initState() {
    super.initState();
    cooperative = widget.cooperative;
    view = CooperativeConfirmationView(controller: this);
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
  Cooperative cooperative = Cooperative();
}
