import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/resources/vectors.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/function.dart';
import '../../../auth/presentation/bloc/user/user_cubit.dart';
import '../contract/homepage.dart';

class HomePageView extends StatelessWidget implements HomePageViewContract {
  const HomePageView({super.key, required this.controller});

  final HomePageControllerContract controller;

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
        child: Padding(
          padding: REdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Container(
                    width: 40.sp,
                    height: 40.sp,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: BlocBuilder<UserCubit, UserState>(
                      builder: (context, stateBloc) {
                        if (stateBloc is UserLoaded) {
                          var init = Utils().getInitials(
                            stateBloc.login.fullname.toString(),
                          );
                          return Center(
                            child: init.toText(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              translate: false,
                            ),
                          );
                        }
                        return 'N/A'.toText();
                      },
                    ),
                  ),
                  16.horizontalSpace,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BlocBuilder<UserCubit, UserState>(
                          builder: (context, stateBloc) {
                            if (stateBloc is UserLoaded) {
                              return stateBloc.login.fullname.toString().toText(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                translate: false,
                              );
                            }
                            return 'N/A'.toText();
                          },
                        ),
                        BlocBuilder<UserCubit, UserState>(
                          builder: (context, stateBloc) {
                            if (stateBloc is UserLoaded) {
                              return '${stateBloc.login.userType}'.toText(
                                color: AppColors.preText,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                translate: false,
                              );
                            }
                            return 'N/A'.toText();
                          },
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      controller.logout();
                    },
                    child: Icon(Icons.logout_rounded, color: AppColors.xC12C22),
                  ),
                ],
              ),

              10.verticalSpace,
              BlocBuilder<UserCubit, UserState>(
                builder: (context, stateBloc) {
                  if (stateBloc is UserLoaded) {
                    return Text(
                      'User is ${stateBloc.login.username.toString()}',
                    );
                  }
                  return 'N/A'.toText();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GreenContainer extends StatelessWidget {
  final num targetedHectares;
  final num achievedHectares;
  final String progress;

  const GreenContainer({
    super.key,
    this.targetedHectares = 0,
    this.achievedHectares = 0,
    this.progress = '0',
  });

  @override
  Widget build(BuildContext context) {
    double progressValue = (double.parse(progress) * 100.0);
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.secondaryGreen,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  'achieved'.toText(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.secondaryText,
                  ),
                  '${achievedHectares.format()} Ha'.toText(
                    translate: false,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.secondaryText,
                  ),
                ],
              ),
              SvgPicture.asset(AppIcon.solidFarmer, height: 48.w, width: 48.w),
            ],
          ),
          SizedBox(height: 16),
          LinearProgressIndicator(
            value: progressValue,
            backgroundColor: Colors.green[200],
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              'Target: ${targetedHectares.format()} Ha'.toText(
                fontSize: 12,
                translate: false,
                fontWeight: FontWeight.w500,
                color: AppColors.secondaryText,
              ),
              '$progress%'.toText(
                translate: false,
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AppColors.secondaryText,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
