import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kaspa/core/theme/colors.dart';
import 'package:kaspa/core/utils/extensions.dart';
import '../../../../core/data/model/weather.dart';
import '../../../../core/resources/vectors.dart';

class ForecastCard extends StatelessWidget {
  final List<Weather> weather;

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
            child: Builder(
              builder: (context) {
                final now = DateTime.now();

                final tomorrowStartOfDay = DateTime(
                  now.year,
                  now.month,
                  now.day,
                ).add(const Duration(days: 1));

                List<Weather> displayableWeatherItems =
                    weather.where((item) {
                      if (item.date != null && item.date!.isNotEmpty) {
                        try {
                          final itemDateTime = DateTime.parse(item.date!);
                          final itemDateOnly = DateTime(
                            itemDateTime.year,
                            itemDateTime.month,
                            itemDateTime.day,
                          );
                          return !itemDateOnly.isBefore(tomorrowStartOfDay);
                        } catch (_) {
                          return false;
                        }
                      }
                      return false;
                    }).toList();

                displayableWeatherItems.sort((a, b) {
                  try {
                    final dateA = DateTime.parse(a.date!);
                    final dateB = DateTime.parse(b.date!);
                    return dateA.compareTo(dateB);
                  } catch (_) {
                    return 0;
                  }
                });

                List<Widget> forecastWidgets = [];
                if (displayableWeatherItems.isEmpty) {
                  return "no_forecast_data_from_tomorrow".toText(
                    translate: true,
                  );
                }
                for (int i = 0; i < displayableWeatherItems.length; i++) {
                  forecastWidgets.add(
                    _buildWeatherDetail(
                      displayableWeatherItems[i],
                      _getDayLabel(context, i, displayableWeatherItems[i]),
                    ),
                  );
                  if (i < displayableWeatherItems.length - 1) {
                    forecastWidgets.add(8.horizontalSpace);
                  }
                }
                return Row(children: forecastWidgets);
              },
            ),
          ),
        ],
      ),
    );
  }

  String _getDayLabel(BuildContext context, int index, Weather weatherItem) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    DateTime? itemDate;
    if (weatherItem.date?.isNotEmpty == true) {
      try {
        final parsedDate = DateTime.parse(weatherItem.date!);
        itemDate = DateTime(parsedDate.year, parsedDate.month, parsedDate.day);
      } catch (e) {
        debugPrint('Failed to parse weather date: ${weatherItem.date}');
      }
    }

    itemDate ??= today.add(Duration(days: index + 1));

    final tomorrow = today.add(const Duration(days: 1));
    if (itemDate.isAtSameMomentAs(tomorrow)) {
      return "TOMORROW";
    }

    try {
      return DateFormat(
        'EEE',
        context.locale.languageCode,
      ).format(itemDate).toUpperCase();
    } catch (e) {
      debugPrint('Failed to format date: $e');
      return "DAY ${index + 1}";
    }
  }

  Widget _buildWeatherDetail(Weather item, String dayLabel) {
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
          dayLabel.toText(
            fontSize: 10,
            fontWeight: FontWeight.w700,
            color: AppColors.primaryGreen,
            translate: false,
          ),

          SvgPicture.asset(AppIcon.sun),
          2.verticalSpace,
          '${item.tempMean}°C'.toText(
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
          '${item.precipProbMean}%'.toText(
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
          '${item.windSpeedMax}km/h'.toText(
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
