import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/component/card_container_widget.dart';
import '../../../../core/data/model/crop.dart';

class CropCard extends StatelessWidget {
  final Crop data;
  final Function() onTap;
  const CropCard({super.key, required this.data, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CardContainerWidget(
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: data.getCropColor(),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Icon(data.getCropIcon(), color: Colors.white, size: 24),
            ),
            16.horizontalSpace,

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                (
                  //data.name ??
                 'Maize').toText(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
                4.horizontalSpace,
                (
                  //data.variety ??
                  'Suwan-1').toText(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  padding: REdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: AppColors.bgGreen.withAlpha((0.3 * 255).toInt()),
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(color: AppColors.bgGreen, width: 1),
                  ),
                  child: 'Growing Stage'.toText(
                    fontSize: 12,
                    color: AppColors.primaryGreen,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                ('25 May - 25 June').toText(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
