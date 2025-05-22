import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/resources/vectors.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/component/card_container_widget.dart';
import '../../../../core/data/model/crop.dart';

class CropCard extends StatelessWidget {
  final Crop data;
  final Function() onTap;
  const CropCard({super.key, required this.data, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: onTap,
      child: CardContainerWidget(child:
       Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(AppIcon.sun),
        (data.product?.name ?? 'Maize').toText(fontSize: 14,fontWeight: FontWeight.w700,translate: false),
        (data.variety ?? '').toText(fontSize: 12,fontWeight: FontWeight.w500,translate: false)
       ],)));
  
  }
}