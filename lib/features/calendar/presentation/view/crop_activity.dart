import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../../../../core/component/empty_list_widget.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/function.dart';
import '../../../../core/utils/styles.dart';
import '../../../farmers/presentation/widget/custom_tile.dart';
import '../contract/crop_activity.dart';

class CropActivityView extends StatelessWidget
    implements CropActivityViewContract {
  const CropActivityView({super.key, required this.controller});

  final CropActivityControllerContract controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      body: _body(context),
    );
  }

  Widget _body(context) {
    return Container(
      decoration: Styles.colorComboDecoration(context),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Utils.customAppBar(context, 'crop_stage_activity', false, () {}),
            24.verticalSpace,
            Expanded(
              child: Padding(
                padding: REdgeInsets.symmetric(horizontal: 16.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 48.sp,
                            height: 48.sp,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: controller.crop.getCropIcon(),
                          ),
                          16.horizontalSpace,

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              (controller.crop.crop?.product?.name ?? 'Maize')
                                  .toText(
                                    fontSize: 14,
                                    translate: false,
                                    fontWeight: FontWeight.w700,
                                  ),
                              4.horizontalSpace,
                              (controller.crop.crop?.variety ?? 'Suwan-1')
                                  .toText(
                                    fontSize: 12,
                                    translate: false,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ],
                          ),
                          const Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                padding: REdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: controller.crop
                                      .getStageColor()
                                      .withAlpha((0.1 * 255).toInt()),
                                  borderRadius: BorderRadius.circular(16.r),
                                  border: Border.all(
                                    color: controller.crop.getStageColor(),
                                    width: 0.5,
                                  ),
                                ),
                                child: (controller.crop.stage ?? '').toText(
                                  fontSize: 12,
                                  translate: false,
                                  color: controller.crop.getStageColor(),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              // ('25 May - 25 June').toText(
                              //   fontSize: 12,
                              //   translate: false,
                              //   fontWeight: FontWeight.w500,
                              // ),
                            ],
                          ),
                        ],
                      ),
                      24.verticalSpace,
                      Row(
                        children: [
                          'stage_activities'.toText(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: AppColors.accentText,
                          ),
                        ],
                      ),
                      8.verticalSpace,
                      Builder(
                        builder: (context) {
                          final activities = controller.crop.activities;
                          if (activities.isEmpty) {
                            return Padding(
                              padding: REdgeInsets.symmetric(vertical: 20.0),
                              child: ErrorWidgets(
                                message: 'no_activities_for_this_stage',
                              ),
                            );
                          }
                          return ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: activities.length,
                            itemBuilder: (context, index) {
                              final activity = activities[index];
                              return CustomTile(
                                title: "${activity.activity}",
                                body: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Builder(
                                      builder: (context) {
                                        String formattedDateRange =
                                            'Date not specified';
                                        try {
                                          if (activity.startDate != null &&
                                              activity.startDate!.isNotEmpty &&
                                              activity.endDate != null &&
                                              activity.endDate!.isNotEmpty) {
                                            final DateFormat inputFormat =
                                                DateFormat('yyyy-MM-dd');
                                            final DateFormat outputFormat =
                                                DateFormat('dd MMM yyyy');
                                            final DateTime startDate =
                                                inputFormat.parse(
                                                  activity.startDate!,
                                                );
                                            final DateTime endDate = inputFormat
                                                .parse(activity.endDate!);
                                            formattedDateRange =
                                                '${outputFormat.format(startDate)} - ${outputFormat.format(endDate)}';
                                          }
                                        } catch (e) {
                                          debugPrint(
                                            'Error formatting date range: $e',
                                          );
                                        }
                                        return formattedDateRange.toText(
                                          fontSize: 12,
                                          color: AppColors.accentText,
                                        );
                                      },
                                    ),
                                    6.verticalSpace,
                                    Row(
                                      children: [
                                        Expanded(
                                          child: (activity.description ??
                                                  'Not Specified')
                                              .toText(
                                                translate: false,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 14,
                                              ),
                                        ),
                                      ],
                                    ),
                                    12.verticalSpace,
                                  ],
                                ),
                              );
                            },
                            separatorBuilder:
                                (context, index) => 12.verticalSpace,
                          );
                        },
                      ),
                      24.verticalSpace,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
