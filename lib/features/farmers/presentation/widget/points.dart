import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kaspa/core/utils/extensions.dart';

import '../../../../core/theme/colors.dart';

class Points extends StatefulWidget {
  final String lat;
  final String long;
  final Function delete;
  final int point;
  final bool showIcon;

  const Points({
    required this.delete,
    required this.lat,
    required this.showIcon,
    required this.long,
    required this.point,
    super.key,
  });

  @override
  State<Points> createState() => _PointsState();
}

class _PointsState extends State<Points> {
  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: AppColors.primaryGreen,
      radius: Radius.circular(10.r),
      borderType: BorderType.RRect,
      strokeWidth: 1,
      dashPattern: const [8, 6],
      child: Container(
        decoration: BoxDecoration(color: AppColors.bgGreen.withAlpha((0.4 * 225 ).toInt())),

        padding: REdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            'Point ${widget.point}'.toText(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              translate: false,
              textHeight: 15.84 / 12,
              color: AppColors.accentText,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                widget.long.toText(
                  fontSize: 14,
                  textHeight: 13.2 / 14,
                  translate: false,
                  color: AppColors.accentText,
                  fontWeight: FontWeight.w600,
                ),
                10.verticalSpace,
                'Longitude'.toText(
                  fontSize: 14,
                  translate: false,
                  textHeight: 13.2 / 14,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                widget.lat.toText(
                  fontSize: 14,
                  textHeight: 13.2 / 14,
                  translate: false,
                  color: AppColors.accentText,
                  fontWeight: FontWeight.w600,
                ),
                10.verticalSpace,
                'Latitude'.toText(
                  fontSize: 14,
                  textHeight: 13.2 / 14,
                  translate: false,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
            if (widget.showIcon)
              IconButton(
                onPressed: () {
                  widget.delete();
                },
                icon: const Icon(Icons.delete, color: AppColors.burntRed),
              ),
          ],
        ),
      ),
    );
  }
}
