import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kaspa/core/data/model/incident_report.dart';
import 'package:kaspa/core/utils/extensions.dart';
import '../../../../core/component/card_container_widget.dart';
import '../../../../core/resources/vectors.dart';
import '../../../../core/theme/colors.dart';

class ReportCard extends StatelessWidget {
  final IncidentReport data;
  final Function() onTap;
  const ReportCard({super.key, required this.data, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CardContainerWidget(
        decoration: BoxDecoration(
          color: Color(0xffF8F8F8),
          borderRadius: BorderRadius.circular(8),
          border: BoxBorder.all(color: Color(0xffC8C8C8), width: 0.5),
        ),
        child: Row(
          children: [
            SvgPicture.asset(AppIcon.incident),
            8.horizontalSpace,
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                '${data.title}'.toText(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  translate: false,
                ),
                '${data.lga?.name ?? ''}, ${data.ward?.name ?? ''}'.toText(
                  fontSize: 12,
                  color: AppColors.accentText,
                  fontWeight: FontWeight.w500,
                  translate: false,
                ),
                '2 attached documents'.toText(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
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
