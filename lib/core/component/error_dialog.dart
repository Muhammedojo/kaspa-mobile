import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kaspa/core/resources/images.dart';
import 'package:kaspa/core/resources/vectors.dart';
import 'package:kaspa/core/utils/extensions.dart';
import '../theme/colors.dart';

class ErrorDialogWidget extends StatelessWidget {
  final String? message;
  final String? title;
  final VoidCallback onTap;
  const ErrorDialogWidget({
    super.key,
    required this.message,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0.0,

      backgroundColor: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.lightGrey,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.r),
                topRight: Radius.circular(8.r),
              ),
            ),
            child: Padding(
              padding: REdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
              child: Row(
                children: [
                  Image.asset(AppImage.error,height: 32.sp,width: 32.sp,),
                  4.horizontalSpace,
                  Expanded(
                    child: 'Error!!!'.toText(
                      translate: false,
                      fontSize: 12,
                      color: AppColors.primaryRed,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  InkWell(
                     onTap: (){
                      Navigator.pop(context);
                    },
                    child:
                     SvgPicture.asset(AppIcon.cancel,height: 32.sp,width: 32.sp,),
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(color: AppColors.primaryBackground),
            child: Padding(
              padding: REdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
              child: '$message'.toText(
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: AppColors.lightGrey,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8.r),
                bottomRight: Radius.circular(8.r),
              ),
            ),
            child: Padding(
              padding: REdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.sp),
                            color: AppColors.primaryRed,
                          ),
                          child: Center(
                            child: Padding(
                              padding: REdgeInsets.symmetric(vertical: 15.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: onTap,
                                    child: ('try_again').toText(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.primaryBackground,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                8.verticalSpace,
                      Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.sp),
                            border: Border.all(color: AppColors.accentText),
                            color: Colors.transparent,
                          ),
                          child: Center(
                            child: Padding(
                              padding: REdgeInsets.symmetric(vertical: 15.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: onTap,
                                    child: (title ?? 'cancel').toText(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.accentText,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
               
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
