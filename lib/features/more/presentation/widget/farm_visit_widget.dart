import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        decoration: BoxDecoration(
          color: Color(0xffF8F8F8),
          borderRadius: BorderRadius.circular(8.r),
          border: BoxBorder.all(color: Color(0xffC8C8C8), width: 0.5),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 24.r,
              backgroundColor: AppColors.bgGreen,
              child: Icon(
                Icons.person_2_outlined,
                size: 24.r,
                color: AppColors.ColorAccent,
              ),
            ),
            8.horizontalSpace,
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                (data.name ?? 'N/A').toText(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  translate: false,
                ),
                SizedBox(
                  width: 180.w,
                  child: '${data.address}'.toText(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    textOverflow: TextOverflow.ellipsis,
                    translate: false,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                '${data.farmCrops.length} crop'.toText(
                  fontSize: 14,
                  color: AppColors.colorPrimary,
                  fontWeight: FontWeight.w700,
                  translate: false,
                ),
                'No pending activity'.toText(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,

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
