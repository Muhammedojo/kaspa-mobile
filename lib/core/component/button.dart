import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/colors.dart';

class ButtonWidget extends StatelessWidget {
 final String label;
 final Function() onPressed;
  const ButtonWidget({super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.sp),
          color: AppColors.primaryGreen,
        ),
        child: Center(
          child: Padding(
            padding: REdgeInsets.symmetric(vertical: 15.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    label,
                    style: TextStyle(
                        fontSize: 16.sp,
                        color: const Color(0xffFFFFFF),
                        fontWeight: FontWeight.w500),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
