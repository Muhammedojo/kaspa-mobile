import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_validator/form_validator.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';
import '../../../../core/navigation/route_constant.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/function.dart';
import '../../../../core/utils/styles.dart';
import '../bloc/auth/auth_cubit.dart';
import '../bloc/user/user_cubit.dart';
import '../contract/login.dart';
import '../../../../core/utils/extensions.dart';

class LoginView extends StatelessWidget implements LoginViewContract {
  const LoginView({super.key, required this.controller});

  final LoginControllerContract controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
     
      body: _body(context),
    );
  }

  Widget _body(context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Form(
        key: controller.formKey,
        child: Padding(
          padding: REdgeInsets.all(24.0.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
          
              Padding(
                  padding: EdgeInsets.only(top: 52.0.h),
                  child: 'welcome_back'
                      .toText(fontSize: 25, fontWeight: FontWeight.w700)),
              2.verticalSpace,
              Padding(
                  padding: REdgeInsets.only(top: 0.0.h),
                  child: 'login_to_your_account'
                      .toText(fontSize: 16, fontWeight: FontWeight.w400)),
              80.verticalSpace,
              'username'.toText(fontSize: 14, fontWeight: FontWeight.w500),
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
                          'omuhammed', '',
                          check: false),
                  onChanged: (value) {},
                ),
              ),
              20.verticalSpace,
              'password'.toText(fontSize: 14, fontWeight: FontWeight.w500),
              Padding(
                padding: REdgeInsets.only(top: 5.0),
                child: TextFormField(
                  textInputAction: TextInputAction.done,
                  obscureText: controller.obscurePassword,
                  controller: controller.passwordController,
                  validator: ValidationBuilder().required().build(),
                  style: Styles.x14dp_4A4A4A(14.0.sp),
                  maxLines: 1,
                  decoration: Styles.passwordFieldDecoration(
                      '*** *** *** **',
                      '',
                      controller.obscurePassword,
                      () => controller.onPasswordVisible()),
                  onChanged: (value) {},
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
              ),
              BlocListener<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is AuthLoginLoading) {
                    showLoading(context);
                  }

                  if (state is AuthLoginSuccess) {
                    hideLoading(context);
                    context.read<UserCubit>().getUser();
                    context.goNamed(RouteConstant.homePage);
                  }
                  if (state is AuthLoginFailure) {
                    hideLoading(context);
                  Utils.showToastError(context, state.error.toString());
                  }
                },
                child: Padding(
                  padding: REdgeInsets.only(top: 40.0),
                  child: ElevatedButton(
                    onPressed: () {
                      controller.onPressLoginButton();
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryGreen),
                    child: Padding(
                      padding: REdgeInsets.symmetric(vertical: 15.0),
                      child: 'sign_in'.toText(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryBackground),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: REdgeInsets.only(top: 20.0.h),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Checkbox(
                          fillColor:
                              MaterialStateProperty.resolveWith((states) {
                            if (states.contains(MaterialState.disabled)) {
                              return Colors.green.withOpacity(.32);
                            }
                            return Colors.white;
                          }),
                          activeColor: Colors.green,
                          checkColor: Colors.green,
                          value: controller.rememberMe,
                          onChanged: (value) {
                            controller.onSelectRememberMe(value);
                          },
                        ),
                        'remember_me'.toText(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          //decoration: TextDecoration.underline
                        ),
                      ],
                    ),

                    InkWell(
                      onTap: () {
                     //   pushTo(ForgotPasswordScreen(), context);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: REdgeInsets.all(2.sp),
                        child: 'forgot_password'.toText(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Padding(
                  padding: REdgeInsets.only(top: 50.0.h),
                  child: InkWell(
                    child: SizedBox(
                      width: MediaQuery.sizeOf(context).width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.phone,
                            size: 16.sp,
                            color: AppColors.colorPrimary,
                          ),
                          10.horizontalSpace,
                          "having_issues".toText(
                              color: AppColors.colorPrimary, fontSize: 12.sp),
                          8.horizontalSpace,
                          "contact_support".toText(
                              color: AppColors.colorPrimary, fontSize: 12.sp),
                        ],
                      ),
                    ),
                    onTap: () {
                      //controller.contactSupportTeam();
                    },
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: REdgeInsets.only(top: 50.0.h),
                  child:
                      "v.${const String.fromEnvironment("version", defaultValue: "1.0.72")}+${const String.fromEnvironment("build_number", defaultValue: "72")}"
                          .toText(
                              translate: false,
                              fontSize: 12,
                              fontWeight: FontWeight.normal),
                ),
              ),
            ],
          ),
        ),
      ),
  

    ));
  }
   void hideLoading(BuildContext context) {
    return context.loaderOverlay.hide();
  }

  void showLoading(BuildContext context) {
    return context.loaderOverlay.show();
  }
}
