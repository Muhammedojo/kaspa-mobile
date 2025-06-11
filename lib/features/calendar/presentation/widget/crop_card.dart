import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/data/model/crop_calendar.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/component/card_container_widget.dart';
import '../../../../core/data/model/crop.dart';

class CropCard extends StatelessWidget {
  final CropCalendar data;
  final Function() onTap;
  const CropCard({super.key, required this.data, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: REdgeInsets.symmetric(vertical: 8.0),
        child: CardContainerWidget(
          child: Row(
            children: [
              Container(
                width: 48.sp,
                height: 48.sp,
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
                  (data.crop?.product?.name ?? 'Maize').toText(
                    fontSize: 14,
                    translate: false,
                    fontWeight: FontWeight.w700,
                  ),
                  4.horizontalSpace,
                  (data.crop?.variety ?? 'Suwan-1').toText(
                    fontSize: 12,
                    translate: false,
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
                    child: (data.stage ?? '').toText(
                      fontSize: 12,
                      translate: false,
                      color: AppColors.primaryGreen,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  ('25 May - 25 June').toText(
                    fontSize: 12,
                    translate: false,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
