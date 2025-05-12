import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kaspa/core/utils/extensions.dart';

import '../theme/colors.dart';

class ButtonWidget extends StatelessWidget {
  final String label;
  final Color? bgColor;
  final Color? textColor;
  final Function() onPressed;
  const ButtonWidget({
    super.key,
    required this.label,
    required this.onPressed,
    this.bgColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.sp),
          color: bgColor ?? AppColors.primaryGreen,
          border: Border.all()
        ),
        child: Center(
          child: Padding(
            padding: REdgeInsets.symmetric(vertical: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                label.toText(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: textColor ?? AppColors.primaryBackground,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
