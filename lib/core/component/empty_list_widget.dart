import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../core/utils/extensions.dart';
import '../resources/vectors.dart';



class ErrorWidgets extends StatelessWidget {
  const ErrorWidgets({
    super.key,
    this.title = '',
    required this.message,
  });

  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppIcon.empty,
            width: 56.sp,
            height: 56.sp,
          ),
          16.verticalSpace,
          title.isNotEmpty ? title.toText(fontSize: 16, fontWeight: FontWeight.w700) : const SizedBox.shrink(),
          8.verticalSpace,
          message.toText(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
