import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kaspa/core/theme/colors.dart';
import 'package:kaspa/core/utils/extensions.dart';

import '../../../../core/data/model/weather.dart';
import '../../../../core/resources/vectors.dart';

class ForecastCard extends StatelessWidget {
  final Weather weather;
  const ForecastCard({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: REdgeInsets.symmetric(vertical: 10, horizontal: 14),
      decoration: BoxDecoration(
        color: AppColors.primaryBackground,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              "week_forecast".toText(
                fontSize: 10,
                fontWeight: FontWeight.w700,
                color: AppColors.accentText,
              ),
              "Swipe back to see today’s weather".toText(
                translate: false,
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: AppColors.accentText,
              ),
            ],
          ),
          10.verticalSpace,
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildWeatherDetail('', ''),
                8.horizontalSpace,
                _buildWeatherDetail('', ''),
                8.horizontalSpace,
                _buildWeatherDetail('', ''),
                8.horizontalSpace,
                _buildWeatherDetail('', ''),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWeatherDetail(String value, String label) {
    return Container(
      width: 100.w,
      padding: REdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: AppColors.bgGreen.withAlpha((0.3 * 255).toInt()),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          'TOMORROW'.toText(
            fontSize: 10,
            fontWeight: FontWeight.w700,
            color: AppColors.primaryGreen,
            translate: false,
          ),

          SvgPicture.asset(AppIcon.sun),
          2.verticalSpace,
          '34°C'.toText(
            translate: false,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
          'Temperature'.toText(
            translate: false,
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: AppColors.ColorAccent,
          ),

          2.verticalSpace,
          '60%'.toText(
            translate: false,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
          'Humidity'.toText(
            translate: false,
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: AppColors.ColorAccent,
          ),
          2.verticalSpace,
          '34km/h'.toText(
            translate: false,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
          'Wind'.toText(
            translate: false,
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: AppColors.ColorAccent,
          ),
        ],
      ),
    );
  }
}
