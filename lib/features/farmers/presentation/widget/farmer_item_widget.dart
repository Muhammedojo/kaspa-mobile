import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kaspa/core/component/card_container_widget.dart';
import 'package:kaspa/core/utils/extensions.dart';

import '../../../../core/theme/colors.dart';

class FarmerCard extends StatelessWidget {
  const FarmerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CardContainerWidget(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 24.r,
                backgroundColor: AppColors.accentText,
                child: Icon(
                  Icons.person,
                  size: 24.r,
                  color: AppColors.ColorAccent,
                ),
              ),
              12.horizontalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  'Muhammed Ojo'.toText(
                    translate: false,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                  'Islamic Cooperative'.toText(
                    translate: false,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                  'KA-53632688846434'.toText(
                    translate: false,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
             
              'Active'.toText(
                translate: false,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
              '+234 818 234 1725'.toText(
                translate: false,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
