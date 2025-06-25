import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kaspa/core/theme/colors.dart';
import 'package:kaspa/core/utils/extensions.dart';

import '../../../../core/component/card_container_widget.dart';
import '../../../../core/data/model/cooperative.dart';

class CooperativeCard extends StatelessWidget {
  final Cooperative cooperative;
  final Function() onTap;
  const CooperativeCard({
    super.key,
    required this.cooperative,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CardContainerWidget(
        decoration: BoxDecoration(
          color: Color(0xffF8F8F8),
          borderRadius: BorderRadius.circular(8.r),
          border: BoxBorder.all(color: Color(0xffC8C8C8), width: 0.5),
        ),
        child: Row(
          children: [
            SvgPicture.asset('assets/vectors/coops.svg'),
            8.horizontalSpace,
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                '${cooperative.name}'.toText(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  translate: false,
                ),
                '${cooperative.noOfFarmers} Members'.toText(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  translate: false,
                ),
              ],
            ),
            const Spacer(),
            Container(
              padding: REdgeInsets.symmetric(horizontal: 8 ),
              decoration: BoxDecoration(
                color:AppColors.colorPrimary.withAlpha((0.1 * 255).toInt()),
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(color:AppColors.colorPrimary, width: 0.8),
              ),
              child: ((cooperative.isVerified == true)
                      ? 'Verified'
                      : 'Unverified')
                  .toText(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.colorPrimary,
                    translate: false,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
