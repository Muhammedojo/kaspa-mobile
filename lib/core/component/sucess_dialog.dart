import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kaspa/core/utils/extensions.dart';
import '../theme/colors.dart';

class DialogWidget extends StatelessWidget {
  const DialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
       elevation: 0.0,
      
      backgroundColor: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
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
                  SvgPicture.asset('assets/vectors/success.svg'),
                  4.horizontalSpace,
                  Expanded(
                    child: ''.toText(fontSize: 14, fontWeight: FontWeight.w700),
                  ),
                  Icon(Icons.close),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(color: AppColors.primaryBackground),
            child: Padding(
              padding: REdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
              child:
                  'Congratulations! You have successfully performed the action / An error occurred. Kindly try again ensuring that you are connected to the internet.'
                      .toText(fontSize: 14, fontWeight: FontWeight.w700),
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
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.sp),
                        border: Border.all(color: AppColors.ColorAccent),
                        color: Colors.transparent,
                      ),
                      child: Center(
                        child: Padding(
                          padding: REdgeInsets.symmetric(vertical: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              'cancel'.toText(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.ColorAccent,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  // 4.horizontalSpace,
                  // Expanded(
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(6.sp),
                  //       color: AppColors.primaryGreen,
                  //     ),
                  //     child: Center(
                  //       child: Padding(
                  //         padding: REdgeInsets.symmetric(vertical: 15.0),
                  //         child: Row(
                  //           mainAxisAlignment: MainAxisAlignment.center,
                  //           children: [
                  //             'Proceed'.toText(
                  //               fontSize: 11.sp,
                  //               fontWeight: FontWeight.w600,
                  //               color: AppColors.ColorAccent,
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
               
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
