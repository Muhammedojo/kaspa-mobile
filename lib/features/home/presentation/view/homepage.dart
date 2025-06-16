import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/component/card_container_widget.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/component/empty_list_widget.dart';
import '../../../../core/resources/vectors.dart';
import '../../../../core/utils/styles.dart';
import '../../../../core/component/pages_bar.dart';
import '../../../auth/presentation/bloc/user/cubit.dart';
import '../bloc/farmer_dashboard/farmer_dashboard_cubit.dart';
import '../bloc/insight/insight_cubit.dart';
import '../bloc/weather_lga/cubit.dart';
import '../contract/homepage.dart';
import '../widget/forecast_card.dart';
import '../widget/weather_card.dart';

class HomePageView extends StatelessWidget implements HomePageViewContract {
  const HomePageView({super.key, required this.controller});

  final HomePageControllerContract controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.transparent, body: _body(context));
  }

  Widget _body(context) {
    return Container(
      decoration: Styles.colorComboDecoration(),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              PageBar(
                onTap: () {
                  controller.logout();
                },
              ),
              24.verticalSpace,
              Padding(
                padding: REdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(AppIcon.location),
                        8.horizontalSpace,
                        BlocBuilder<UserCubit, UserState>(
                          builder: (context, stateBloc) {
                            if (stateBloc is UserLoaded) {
                              return stateBloc.login.fullname.toString().toText(
                                translate: false,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              );
                            }
                            return 'N/A'.toText();
                          },
                        ),
                      ],
                    ),
                    16.verticalSpace,
                    SizedBox(
                      height: 280.h,
                      child: PageView(
                        controller: controller.pageController,
                        children: [
                          BlocBuilder<InsightCubit, InsightState>(
                            builder: (context, state) {
                              if (state is InsightLoading) {
                                return Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.colorPrimary,
                                  ),
                                );
                              }
                              if (state is InsightLoaded) {
                                if (state.insightList.isEmpty) {
                                  return ErrorWidgets(
                                    message:
                                        'Weather data not available for your location.',
                                  );
                                }
                                final currentWeatherData = state.insightList[0];

                                return WeatherCard(insight: currentWeatherData, onTap: () { 
                                  controller.refreshData();

                                 },);
                              }

                              return ErrorWidgets(
                                message: 'Unable to load weather data.',
                              );
                            },
                          ),
                            BlocBuilder<LgaWeatherCubit, LgaWeatherState>(
                            builder: (context, state) {
                              if (state is LgaWeatherLoading) {
                                return Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.colorPrimary,
                                  ),
                                );
                              }
                              if (state is LgaWeatherLoaded) {
                                if (state.weatherList.isEmpty) {
                                  return ErrorWidgets(
                                    message:
                                        'Weather data not available for your location.',
                                  );
                                }
                              
                                return ForecastCard(weather: state.weatherList,);
                              }

                              return ErrorWidgets(
                                message: 'Unable to load weather data.',
                              );
                            },
                          ),
                          
                        ],
                        onPageChanged: (index) {
                          controller.monitor(index);
                        },
                      ),
                    ),
                    10.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(2, (index) {
                        return Container(
                          width: controller.currentPage == index ? 30 : 15,
                          height: 6,
                          margin: REdgeInsets.symmetric(horizontal: 2),
                          decoration: BoxDecoration(
                            color:
                                controller.currentPage == index
                                    ? AppColors.colorPrimary
                                    : AppColors.ColorAccent,
                            borderRadius: BorderRadius.circular(3),
                          ),
                        );
                      }),
                    ),
                    16.verticalSpace,
                    Row(
                      children: [
                        'preferred_quick_actions'.toText(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                        ),
                      ],
                    ),
                    12.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildQuickActionButton(
                          'Register a',
                          'Farmer',
                          AppIcon.addFarmer,
                          AppColors.bgGreen,
                          () => controller.registerFarmer(),
                        ),
                        _buildQuickActionButton(
                          'Farm',
                          'Visit',
                          AppIcon.farmVisit,
                          AppColors.bgBlue,
                          () => controller.farmVisit(),
                        ),
                        _buildQuickActionButton(
                          'Price',
                          'Updates',
                          AppIcon.cal,
                          AppColors.bgYellow,
                          () => controller.priceUpdate(),
                        ),
                        _buildQuickActionButton(
                          'Report an',
                          'Incident',
                          AppIcon.warning,
                          AppColors.bgRed,
                          () => controller.report(),
                        ),
                      ],
                    ),
                    16.verticalSpace,
                    CardContainerWidget(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              'advisory_message'.toText(
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                              ),
                            ],
                          ),
                          10.verticalSpace,
                          const Divider(),
                          12.verticalSpace,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              '29 new Advisory Messages for 400 of your farmers'
                                  .toText(
                                    fontSize: 12,
                                    translate: false,
                                    color: AppColors.colorPrimary,
                                    fontWeight: FontWeight.w700,
                                  ),
                              SvgPicture.asset(AppIcon.rightArrow),
                            ],
                          ),
                        ],
                      ),
                    ),
                    16.verticalSpace,

                    BlocBuilder<DashboardCubit, DashboardState>(
                      builder: (context, stateBloc) {
                        if (stateBloc is DashboardLoaded) {
                          return CardContainerWidget(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    'farmer_summary'.toText(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ],
                                ),
                                10.verticalSpace,
                                const Divider(),
                                12.verticalSpace,
                                Row(
                                  children: [
                                    (stateBloc.dashboardList.isNotEmpty
                                            ? '${stateBloc.dashboardList[0].farmers.total}'
                                            : '0')
                                        .toText(
                                          fontSize: 24,
                                          translate: false,
                                          fontWeight: FontWeight.w800,
                                        ),
                                    8.horizontalSpace,
                                    'farmers_registered'.toText(
                                      fontSize: 12,
                                      color: AppColors.accentText,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ],
                                ),
                                8.verticalSpace,
                                Row(
                                  children: [
                                    '23,000'.toText(
                                      fontSize: 10,
                                      translate: false,
                                      color: AppColors.brown,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    8.horizontalSpace,
                                    'Unverified Farmers (45%)'.toText(
                                      fontSize: 10,
                                      translate: false,
                                      color: AppColors.accentText,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ],
                                ),
                                LinearProgressIndicator(
                                  value: 0.45,
                                  minHeight: 8,
                                  borderRadius: BorderRadius.circular(4.r),
                                  backgroundColor: AppColors.brown.withAlpha(
                                    ((0.4 * 255).toInt()),
                                  ),
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    AppColors.brown,
                                  ),
                                ),
                                8.verticalSpace,
                                const Divider(),
                                10.verticalSpace,
                                Row(
                                  children: [
                                    '690 Profile Issues'.toText(
                                      fontSize: 10,
                                      translate: false,
                                      color: AppColors.burntRed,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    8.horizontalSpace,
                                    'tap_to_view'.toText(
                                      fontSize: 10,
                                      color: AppColors.accentText,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    SvgPicture.asset(AppIcon.rightArrow),
                                  ],
                                ),
                              ],
                            ),
                          );
                        }
                        return CardContainerWidget(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  'farmer_summary'.toText(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ],
                              ),
                              10.verticalSpace,
                              const Divider(),
                              12.verticalSpace,
                              Row(
                                children: [
                                  '23,000,987'.toText(
                                    fontSize: 24,
                                    translate: false,
                                    fontWeight: FontWeight.w800,
                                  ),
                                  8.horizontalSpace,
                                  'farmers_registered'.toText(
                                    fontSize: 12,
                                    color: AppColors.accentText,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ],
                              ),
                              8.verticalSpace,
                              Row(
                                children: [
                                  '23,000'.toText(
                                    fontSize: 10,
                                    translate: false,
                                    color: AppColors.brown,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  8.horizontalSpace,
                                  'Unverified Farmers (45%)'.toText(
                                    fontSize: 10,
                                    translate: false,
                                    color: AppColors.accentText,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ],
                              ),
                              LinearProgressIndicator(
                                value: 0.45,
                                minHeight: 8,
                                borderRadius: BorderRadius.circular(4.r),
                                backgroundColor: AppColors.brown.withAlpha(
                                  ((0.4 * 255).toInt()),
                                ),
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  AppColors.brown,
                                ),
                              ),
                              8.verticalSpace,
                              const Divider(),
                              10.verticalSpace,
                              Row(
                                children: [
                                  '690 Profile Issues'.toText(
                                    fontSize: 10,
                                    translate: false,
                                    color: AppColors.burntRed,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  8.horizontalSpace,
                                  'tap_to_view'.toText(
                                    fontSize: 10,
                                    color: AppColors.accentText,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  SvgPicture.asset(AppIcon.rightArrow),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildQuickActionButton(
    String label,
    String labels,
    String icon,
    Color bgColor,
    final Function() onTap,
  ) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 90.w,
        padding: REdgeInsets.symmetric(vertical: 13),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(icon, height: 18.sp, width: 18.sp),
            8.verticalSpace,
            label.toText(
              fontSize: 12,
              translate: false,
              fontWeight: FontWeight.w500,
              textAlign: TextAlign.center,
            ),
            labels.toText(
              translate: false,
              fontSize: 12,
              fontWeight: FontWeight.w500,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
