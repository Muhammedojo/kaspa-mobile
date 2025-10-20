import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/resources/vectors.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/component/card_container_widget.dart';

class IncidentCategoryCard extends StatelessWidget {
  final String category;
  final int count;
  const IncidentCategoryCard({super.key, required this.category, required this.count});

  @override
  Widget build(BuildContext context) {
    return CardContainerWidget(
      decoration: BoxDecoration(
        color: Color(0xffF8F8F8),
        borderRadius: BorderRadius.circular(8.r),
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
              category.toText(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                translate: false,
              ),
            ],
          ),
          const Spacer(),
          '$count'.toText(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: AppColors.colorPrimary,
            translate: false,
          ),
        ],
      ),
    );
  }
}
