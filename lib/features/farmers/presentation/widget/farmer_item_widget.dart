import 'package:flutter/material.dart';
import 'package:kaspa/core/component/card_container_widget.dart';

class FarmerCard extends StatelessWidget {
  const FarmerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CardContainerWidget(child: Row(children: [
      Column(children: [
        Text('Farmer 1')
      ],)
    ],),);
  }
}