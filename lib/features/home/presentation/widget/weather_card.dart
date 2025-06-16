import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kaspa/core/theme/colors.dart';
import 'package:kaspa/core/utils/extensions.dart';

import '../../../../core/data/model/insight.dart';
import '../../../../core/resources/vectors.dart';

class WeatherCard extends StatelessWidget {
  final Insight insight;
  final Function() onTap;
  const WeatherCard({super.key, required this.insight, required this.onTap});

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
              "today_weather".toText(
                fontSize: 10,
                fontWeight: FontWeight.w700,
                color: AppColors.accentText,
              ),
              "Swipe to see this week’s Forecast".toText(
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
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      '${insight.weather.tempMean}°C'.toText(
                        translate: false,
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                      ),
                      8.horizontalSpace,
                      '${insight.weather.tempMax}°/${insight.weather.tempMin}°'
                          .toText(
                            translate: false,
                            fontSize: 12,
                            color: AppColors.accentText,
                            fontWeight: FontWeight.w600,
                          ),
                    ],
                  ),

                  'Sunrise - ${_formatTimeDisplay(insight.weather.sunrise)}AM | Sunset - ${_formatTimeDisplay(insight.weather.sunset)}PM'
                      .toText(
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
              _buildWeatherDetail('-- hPa', 'Pressure'),
              _buildWeatherDetail('--%', 'Humidity'),
              _buildWeatherDetail(
                '${insight.weather.windSpeedMax}km/h',
                'Wind',
              ),
              _buildWeatherDetail('--°C', 'Soil Temp'),
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
              GestureDetector(
                onTap: onTap,
                child: SvgPicture.asset(AppIcon.refresh),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildWeatherDetail(String value, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      // crossAxisAlignment: CrossAxisAlignment.start,
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

  String _formatTimeDisplay(String? timeStr) {
    if (timeStr != null && timeStr.length >= 5) {
      return timeStr.substring(0, 5);
    }
    return "--:--";
  }
}
