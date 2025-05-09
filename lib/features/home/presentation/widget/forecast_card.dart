import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kaspa/core/theme/colors.dart';
import 'package:kaspa/core/utils/extensions.dart';

import '../../../../core/resources/vectors.dart';

class ForecastCard extends StatelessWidget {
  const ForecastCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: REdgeInsets.symmetric(vertical: 15, horizontal: 14),
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
          12.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  '41°C'.toText(
                    translate: false,
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                  'Sunrise - 5:45AM | Sunset - 6:30PM'.toText(
                    translate: false,
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: AppColors.accentText,
                  ),
                ],
              ),
              SvgPicture.asset(AppIcon.sun),
            ],
          ),
          10.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildWeatherDetail('1,013 hPa', 'Pressure'),
              _buildWeatherDetail('60%', 'Humidity'),
              _buildWeatherDetail('100km/h', 'Wind'),
              _buildWeatherDetail('32°C', 'Soil Temp'),
            ],
          ),
          10.verticalSpace,
          const Divider(),
          10.verticalSpace,
          Row(
            children: [
              SvgPicture.asset(AppIcon.info),
              8.horizontalSpace,
              Expanded(
                child: 'Today is a good day to plant new seeds'.toText(
                  translate: false,
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SvgPicture.asset(AppIcon.refresh),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildWeatherDetail(String value, String label) {
    return Column(
      children: [
        value.toText(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          translate: false,
        ),
        label.toText(
          translate: false,
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: AppColors.ColorAccent,
        ),
      ],
    );
  }
}
