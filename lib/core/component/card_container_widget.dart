import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/colors.dart';

class CardContainerWidget extends StatelessWidget {
  final Widget? child;
  final double? verticalPadding;
  final Decoration? decoration;
  const CardContainerWidget(
      {super.key, this.child, this.verticalPadding, this.decoration});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: REdgeInsets.symmetric(
            horizontal: 12, vertical: verticalPadding ?? 16),
        decoration: decoration ??
            ShapeDecoration(
              shape: RoundedRectangleBorder(
                side:
                    const BorderSide(width: 0.40, color: AppColors.ColorAccent),
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
        child: child);
  }
}
