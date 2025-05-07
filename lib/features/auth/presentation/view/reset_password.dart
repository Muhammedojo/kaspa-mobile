import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_validator/form_validator.dart';
import 'package:kaspa/core/navigation/navigator.dart';
import 'package:kaspa/features/auth/presentation/controller/reset_code.dart';
import '../../../../core/component/pattern_color.dart';
import '../../../../core/resources/images.dart';
import 'package:loader_overlay/loader_overlay.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/function.dart';
import '../../../../core/utils/styles.dart';
import '../bloc/forgot_password/forgot_password_cubit.dart';
import '../bloc/forgot_password/forgot_password_state.dart';
import '../contract/reset_password.dart';
import '../../../../core/utils/extensions.dart';
import '../controller/privacy_policy.dart';
import '../controller/terms.dart';

class ResetPasswordView extends StatelessWidget
    implements ResetPasswordViewContract {
  const ResetPasswordView({super.key, required this.controller});

  final ResetPasswordControllerContract controller;

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
            child: Form(
              key: controller.formKey,
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
                    'enter_your_username'.toText(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    Padding(
                      padding: REdgeInsets.only(top: 5.0),
                      child: TextFormField(
                        controller: controller.emailController,
                        style: Styles.x14dp_4A4A4A(14.0.sp),
                        maxLines: 1,
                        validator: ValidationBuilder().required().build(),
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        decoration:
                            Styles.textFormFieldDecorationBorderWithBackground(
                              'omuhammed',
                              '',
                              showPrefixIcon: true,
                              prefixIconData: Icons.abc,
                              check: false,
                            ),
                        onChanged: (value) {},
                      ),
                    ),
                    12.verticalSpace,
                    BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
                      listener: (context, state) {
                        if (state is ForgotPasswordLoading) {
                          showLoading(context);
                        }

                        if (state is ForgotPasswordSuccess) {
                          final String token = state.response['token'];
                          hideLoading(context);
                          pushTo(
                            ResetCodeScreen(
                              email: controller.emailController.text.trim(),
                              token: token,
                            ),
                            context,
                          );
                        }
                        if (state is ForgotPasswordFailure) {
                          hideLoading(context);
                          Utils.showToastError(context, state.error.toString());
                        }
                      },
                      child: Padding(
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
                            child: 'send_mail'.toText(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: AppColors.primaryBackground,
                            ),
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
