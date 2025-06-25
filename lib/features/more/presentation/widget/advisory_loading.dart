import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/resources/vectors.dart';

class AdvisoryLoadingWidget extends StatelessWidget {
  const AdvisoryLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8.r),
          topRight: Radius.circular(8.r),
        ),
        color: AppColors.primaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,

        children: [
          Column(
            mainAxisSize: MainAxisSize.min,

            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.bgGreen,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.r),
                    topRight: Radius.circular(16.r),
                  ),
                ),
                child: Padding(
                  padding: REdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 16,
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        AppIcon.boxFly,
                        height: 20.sp,
                        width: 20.sp,
                      ),
                      4.horizontalSpace,
                      Expanded(
                        child: 'Generate Advisory Message'.toText(
                          fontSize: 12,
                          color: AppColors.colorPrimary,
                          translate: false,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: SvgPicture.asset(
                          AppIcon.cancel,
                          height: 32.sp,
                          width: 32.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              20.verticalSpace,
              Padding(
                padding: REdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AppIcon.bot, height: 80.w, width: 80.w),
                    8.verticalSpace,
                    'Generating advisory message...'.toText(
                      translate: false,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    'This may take a few seconds.'.toText(
                      translate: false,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    25.verticalSpace,
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
