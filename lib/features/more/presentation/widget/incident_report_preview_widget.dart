import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/data/model/incident_report.dart';
import '../../../../core/resources/vectors.dart';

class IncidentReportPreviewWidget extends StatelessWidget {
  final IncidentReport data;
  const IncidentReportPreviewWidget({super.key, required this.data});

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
            crossAxisAlignment: CrossAxisAlignment.start,
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
                        AppIcon.addFarmer,
                        height: 20.sp,
                        width: 20.sp,
                      ),
                      4.horizontalSpace,
                      Expanded(
                        child: 'Incident Report Details'.toText(
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
                padding:REdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                'Incident Date'.toText(
                  fontSize: 12,
                  color: AppColors.accentText,
                  translate: false,
                  fontWeight: FontWeight.w700,
                ),
                (data.date ?? 'N/A').toText(
                  fontSize: 14,
                  translate: false,
                  fontWeight: FontWeight.w700,
                ),
                16.verticalSpace,
                'Incident Title'.toText(
                  fontSize: 12,
                  color: AppColors.accentText,
                  translate: false,
                  fontWeight: FontWeight.w700,
                ),
                (data.title ?? 'N/A').toText(
                  fontSize: 14,
                  translate: false,
                  fontWeight: FontWeight.w700,
                ),
                16.verticalSpace,
                'LGA'.toText(
                  fontSize: 12,
                  color: AppColors.accentText,
                  translate: false,
                  fontWeight: FontWeight.w700,
                ),
                (data.lga?.name ?? 'N/A').toText(
                  fontSize: 14,
                  translate: false,
                  fontWeight: FontWeight.w700,
                ),
                16.verticalSpace,
                'Ward'.toText(
                  fontSize: 12,
                  color: AppColors.accentText,
                  translate: false,
                  fontWeight: FontWeight.w700,
                ),
                (data.ward?.name ?? 'N/A').toText(
                  fontSize: 14,
                  translate: false,
                  fontWeight: FontWeight.w700,
                ),
                16.verticalSpace,
                'Brief Description'.toText(
                  fontSize: 12,
                  color: AppColors.accentText,
                  translate: false,
                  fontWeight: FontWeight.w700,
                ),
                (data.description ?? 'N/A').toText(
                  fontSize: 14,
                  translate: false,
                  fontWeight: FontWeight.w700,
                ),
                25.verticalSpace,

                ]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
