import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kaspa/core/utils/extensions.dart';
import '../../../../core/component/pattern_color.dart';
import '../../../../core/resources/images.dart';
import 'package:loader_overlay/loader_overlay.dart';
import '../../../../core/theme/colors.dart';
import '../contract/auth_option.dart';

class AuthOptionView extends StatelessWidget implements AuthOptionViewContract {
  const AuthOptionView({super.key, required this.controller});

  final AuthOptionControllerContract controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,

      body: _body(context),
    );
  }

  Widget _body(context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          WidgetWrapper(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.6,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/pattern.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [Text('')],
              ),
            ),
          ),
          Padding(
            padding: REdgeInsets.symmetric(horizontal: 12.0.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Image.asset(AppImage.horizontalLogo)],
                ),
                'KASPA Digitally Connects Farmers to '.toText(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.accentText,
                ),
                'Resources, Markets, and Support.'.toText(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.accentText,
                ),
                30.verticalSpace,
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          controller.navigateToLogin();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.sp),
                            color: AppColors.primaryGreen,
                          ),
                          child: Padding(
                            padding: REdgeInsets.symmetric(
                              vertical: 15.0,
                              horizontal: 32,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                'log_in'.toText(
                                  fontSize: 14,
                                  color: AppColors.primaryBackground,
                                  fontWeight: FontWeight.w600,
                                ),

                                Icon(
                                  Icons.arrow_forward_outlined,
                                  color: AppColors.primaryBackground,
                                  size: 14.sp,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                16.verticalSpace,
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          controller.navigateToResetPassword();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.sp),
                            color: AppColors.primaryBackground,
                            border: Border.all(color: AppColors.accentText),
                          ),
                          child: Padding(
                            padding: REdgeInsets.symmetric(
                              vertical: 15.0,
                              horizontal: 32,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                'reset_your_password'.toText(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                                Icon(Icons.arrow_forward_outlined, size: 14.sp),
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
        ],
      ),
    );
  }

  void hideLoading(BuildContext context) {
    return context.loaderOverlay.hide();
  }

  void showLoading(BuildContext context) {
    return context.loaderOverlay.show();
  }
}
