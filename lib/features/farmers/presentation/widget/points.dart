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
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.brown),
        color: AppColors.brown.withOpacity(0.05),
      ),
      margin: EdgeInsets.only(bottom: 12.h),
      padding: REdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          'Point ${widget.point}'.toText(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              textHeight: 15.84 / 12,
              color: AppColors.brown),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              widget.long.toText(fontSize: 10, textHeight: 13.2 / 10),
              10.verticalSpace,
              'Longitude'.toText(
                  fontSize: 10,
                  textHeight: 13.2 / 10,
                ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              widget.lat.toText(fontSize: 10, textHeight: 13.2 / 10),
              10.verticalSpace,
              'Latitude'.toText(
                  fontSize: 10,
                  textHeight: 13.2 / 10,
                 ),
            ],
          ),
          if (widget.showIcon)
            IconButton(
              onPressed: () {
                widget.delete();
              },
              icon: const Icon(
                Icons.delete,
                color: AppColors.burntRed,
              ),
            ),
        ],
      ),
    );
  }
}
