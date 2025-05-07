import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import '../../../../core/component/pattern_color.dart';
import '../../../../core/navigation/navigator.dart';
import '../../../../core/resources/images.dart';
import 'package:loader_overlay/loader_overlay.dart';
import '../../../../core/theme/colors.dart';
import '../contract/reset_code.dart';
import '../../../../core/utils/extensions.dart';
import '../controller/privacy_policy.dart';
import '../controller/terms.dart';

class ResetCodeView extends StatelessWidget implements ResetCodeViewContract {
  const ResetCodeView({super.key, required this.controller});

  final ResetCodeControllerContract controller;

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
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/pattern.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: REdgeInsets.symmetric(vertical: 40.0),
                    child: Image.asset(AppImage.verticalLogo),
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(),
            child: Padding(
              padding: REdgeInsets.symmetric(horizontal: 15.0.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  'reset_password'.toText(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                  24.verticalSpace,
                  'Kindly enter the 6-alphanumeric code that was sent to ${controller.email} email address'
                      .toText(fontSize: 14, fontWeight: FontWeight.w600),
                  24.verticalSpace,
                  Pinput(
                    controller: controller.codeController,
                    length: 6,
                    defaultPinTheme: PinTheme(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        color: AppColors.primaryBackground,
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(
                          color: AppColors.lightGrey,
                          width: 2.w,
                        ),
                      ),
                      textStyle: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ),
                  12.verticalSpace,
                  Padding(
                    padding: REdgeInsets.only(top: 24.0),
                    child: ElevatedButton(
                      onPressed: () {
                        controller.onPressButton();
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0.r),
                        ),
                        backgroundColor: AppColors.primaryGreen,
                      ),
                      child: Padding(
                        padding: REdgeInsets.symmetric(vertical: 15.0),
                        child: 'proceed'.toText(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryBackground,
                        ),
                      ),
                    ),
                  ),
                  80.verticalSpace,

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          pushTo(TermsScreen(), context);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          padding: REdgeInsets.all(2.sp),
                          child: 'terms_of_service'.toText(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: AppColors.colorPrimary,
                          ),
                        ),
                      ),
                      Text(' | ', style: TextStyle(color: Colors.grey)),
                      InkWell(
                        onTap: () {
                          pushTo(PrivacyPolicyScreen(), context);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          padding: REdgeInsets.all(2.sp),
                          child: 'privacy_policy'.toText(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: AppColors.colorPrimary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  16.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      '© 2025 KASPA. All rights reserved'.toText(
                        translate: false,
                        color: AppColors.ColorAccent,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
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

  void hideLoading(BuildContext context) {
    return context.loaderOverlay.hide();
  }

  void showLoading(BuildContext context) {
    return context.loaderOverlay.show();
  }
}
