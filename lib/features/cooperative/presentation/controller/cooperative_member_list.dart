import 'package:flutter/material.dart';
import '../../../../core/data/model/cooperative.dart';
import '../contract/cooperative_member_list.dart';
import '../view/cooperative_member_list.dart';


class CooperativeMemberScreen extends StatefulWidget {
  final Cooperative cooperative;
  const CooperativeMemberScreen({super.key,required this.cooperative});

  @override
  State<CooperativeMemberScreen> createState() => _CooperativeMemberScreenState();
}

class _CooperativeMemberScreenState extends State<CooperativeMemberScreen>
    implements CooperativeMemberControllerContract {
  late final CooperativeMemberViewContract view;

  @override
  void initState() {
    super.initState();
    cooperative = widget.cooperative;
    view = CooperativeMemberView(controller: this);
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
