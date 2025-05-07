import 'package:flutter/material.dart';

import '../../../../core/component/card_container_widget.dart';
import '../../../../core/data/model/cooperative.dart';

class CooperativeCard extends StatelessWidget {
  final Cooperative cooperative;
  final Function() onTap;
  const CooperativeCard({super.key, required this.cooperative, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: onTap,
      child: CardContainerWidget(child: Text('coo')));
  }
}