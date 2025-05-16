import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kaspa/core/utils/extensions.dart';

import '../../../../core/resources/vectors.dart';
import '../../../../core/theme/colors.dart';

class CustomTile extends StatefulWidget {
  static const duration = Duration(milliseconds: 300);
  final String title;
  final Widget body;
  const CustomTile({super.key, required this.title, required this.body});

  @override
  State<CustomTile> createState() => _CustomTileState();
}

class _CustomTileState extends State<CustomTile> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      padding: REdgeInsets.symmetric(horizontal: 24, vertical: 16),
      duration: CustomTile.duration,
      decoration: ShapeDecoration(
        color: isExpanded ? AppColors.primaryBackground : null,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: isExpanded ? AppColors.faint : const Color(0xFFE4E8EB),
          ),
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: widget.title.toText(
                  translate: false,
                  fontSize: 14,
                  color: isExpanded ? AppColors.colorPrimary : AppColors.accentElement,
                  fontWeight: FontWeight.w600,
                ),
              ),
              16.horizontalSpace,
              GestureDetector(
                onTap: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                child: AnimatedContainer(
                  duration: CustomTile.duration,
                  height: 25.h,
                  width: 25.w,
                  decoration: BoxDecoration(
                    color:
                        isExpanded ? AppColors.lightGrey : AppColors.lightGreen,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: AnimatedRotation(
                    turns: isExpanded ? 0 : 0.125,
                    duration: CustomTile.duration,
                    child: SvgPicture.asset(AppIcon.rightArrow),
                  ),
                ),
              ),
            ],
          ),
          AnimatedCrossFade(
            firstChild: const SizedBox(height: 0),
            secondChild: Padding(
              padding: REdgeInsets.only(top: 16),
              
              child: widget.body,
            ),
            crossFadeState:
                isExpanded
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
            duration: CustomTile.duration,
          ),
        ],
      ),
    );
  }
}
