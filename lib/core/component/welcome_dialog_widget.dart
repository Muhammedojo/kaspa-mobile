import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kaspa/core/theme/colors.dart';
import 'package:kaspa/core/utils/extensions.dart';

class WelcomeDialog extends StatelessWidget {
  final String? message;
  final String? image;
  final String? title;
  final VoidCallback onTap;

  const WelcomeDialog({
    super.key,
    required this.message,
    this.image,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Container(
        alignment: Alignment.center,
        margin: REdgeInsets.only(left: 0.0, right: 0.0),
        child: Stack(
          children: <Widget>[
            Container(
              //alignment: Alignment.center,
              padding: REdgeInsets.only(
                top: 18.0.sp,
                left: 10.0.sp,
                right: 10.0.sp,
                bottom: 10.0.sp,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(13.r)),
              ),
              margin: REdgeInsets.only(top: 13.0.sp, right: 8.0.sp),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  image != null && image?.isNotEmpty == true
                      ? Center(
                        child: Image.asset(
                          image!,
                          fit: BoxFit.fill,
                          height: 150.h,
                        ),
                      )
                      : Container(),
                  5.verticalSpace,
                  Center(
                    child: title!.toText(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  5.verticalSpace,
                  Center(
                    child: message!.toText(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      translate: false,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  5.verticalSpace,
                  Divider(),
                  2.verticalSpace,
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: onTap,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryGreen,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        child: Padding(
                          padding:REdgeInsets.symmetric(horizontal: 16.0),
                          child: 'close'.toText(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primaryBackground
                          ),
                        ),
                      ),
                    ],
                  ),
                  5.verticalSpace,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
