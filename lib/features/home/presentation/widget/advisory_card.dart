import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/data/model/advisory.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/component/card_container_widget.dart';
import '../../../../core/resources/vectors.dart';

class AdvisoryMessageWidget extends StatelessWidget {
  final Advisory data;
  final Function() onTap;
  const AdvisoryMessageWidget({
    super.key,
    required this.data,
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
        child: Column(
          children: [
            Row(
              children: [
                SvgPicture.asset(AppIcon.advice),
                8.horizontalSpace,
                (data.title ?? 'N/A').toText(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  translate: false,
                ),
                const Spacer(),
                (data.getDateLabel()).toText(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  translate: false,
                ),
              ],
            ),
            12.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: (data.description ?? 'Not Available').toText(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    translate: false,
                  ),
                ),
              ],
            ),
            8.verticalSpace,
            Row(
              children: [
                'Targeted: '.toText(
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                  translate: false,
                ),
                (data.audience?.title ?? 'N/A').toText(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
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
