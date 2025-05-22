import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/data/model/farm_visit.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/component/card_container_widget.dart';

class FarmVisitCard extends StatelessWidget {
  final FarmVisit data;
  final Function() onTap;
  const FarmVisitCard({super.key, required this.data, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CardContainerWidget(
        child: Row(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                '${data.name}'.toText(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  translate: false,
                ),
                '0 Visit'.toText(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  translate: false,
                ),
              ],
            ),
            const Spacer(),
            Column(
              children: [
                'verified'.toText(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.colorPrimary,
                  translate: false,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
