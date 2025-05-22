import 'package:flutter/material.dart';
import '../../../../core/data/model/cooperative.dart';
import '../contract/update_cooperative_exco.dart';
import '../view/update_cooperative_exco.dart';


class UpdateCooperativeExcoScreen extends StatefulWidget {
  final Cooperative cooperative;
  const UpdateCooperativeExcoScreen({super.key,required this.cooperative});

  @override
  State<UpdateCooperativeExcoScreen> createState() => _UpdateCooperativeExcoScreenState();
}

class _UpdateCooperativeExcoScreenState extends State<UpdateCooperativeExcoScreen>
    implements UpdateCooperativeExcoControllerContract {
  late final UpdateCooperativeExcoViewContract view;

  @override
  void initState() {
    super.initState();
    cooperative = widget.cooperative;
    view = UpdateCooperativeExcoView(controller: this);
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
