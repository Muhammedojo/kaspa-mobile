import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/component/card_container_widget.dart';
import '../../../../core/component/empty_list_widget.dart';
import '../../../../core/data/model/crop_activities.dart';
import '../../../../core/resources/vectors.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/utils/function.dart';
import '../../../../core/utils/styles.dart';
import '../../../home/presentation/bloc/advisory/crop_advisory_cubit.dart';
import '../../../home/presentation/bloc/farm_crop_activity/farm_crop_activity_cubit.dart';
import '../../../home/presentation/bloc/insight/insight_cubit.dart';
import '../contract/crop_activities.dart';
import '../widget/advisory_loading.dart';
import '../widget/advisory_preview.dart';

class CropActivitiesView extends StatelessWidget
    implements CropActivitiesViewContract {
  const CropActivitiesView({super.key, required this.controller});

  final CropActivitiesControllerContract controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.primaryGreen,
        heroTag: "generate_advisory",
        onPressed: () {
          _onGenerateAdvisoryPressed(context);
        },
        label: Row(
          children: [
            SvgPicture.asset('assets/vectors/fly.svg'),
            5.horizontalSpace,
            'Generate Advisory'.toText(
              translate: false,
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: AppColors.primaryBackground,
            ),
          ],
        ),
      ),
      body: BlocListener<CropAdvisoryCubit, CropAdvisoryState>(
        listener: (context, state) {
          if (state is CropAdvisoryLoading) {
            showModalBottomSheet(
              context: context,
              isDismissible: false,
              enableDrag: false,
              builder: (BuildContext context) {
                return AdvisoryLoadingWidget();
              },
            );
          } else if (state is CropAdvisoryLoaded) {
            Navigator.pop(context);
            _showAdvisoryDialog(context, state.advisory);
          } else if (state is CropAdvisoryFailure) {
            Navigator.of(context).pop();
            Utils.showToastError(context, state.error, '', () {
                  
            });
          }
        },

        child: _body(context),
      ),
    );
  }

  Widget _body(BuildContext context) {
    return Container(
      decoration: Styles.colorComboDecoration(),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Utils.customAppBar(
              context,
              controller.farmCrop.crop?.product?.name ?? 'Crop Activities',
              false,
              () {
                Navigator.pop(context);
              },
            ),
            Expanded(
              child: Padding(
                padding: REdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                child: BlocBuilder<
                  FarmCropActivityCubit,
                  FarmCropActivityState
                >(
                  builder: (context, state) {
                    if (state is FarmCropActivityLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (state is FarmCropActivityLoaded) {
                      final activities = state.farmCropActivityList;

                      if (activities.isEmpty) {
                        return const ErrorWidgets(
                          message: 'No activities found for this crop.',
                        );
                      }

                      return ListView.separated(
                        itemCount: activities.length,
                        separatorBuilder: (context, index) => 12.verticalSpace,
                        itemBuilder: (context, index) {
                          final activity = activities[index];
                          return InkWell(
                            onTap: () {
                              controller.previewLogModal(activity);
                            },
                            child: CardContainerWidget(
                              decoration: BoxDecoration(
                                color: Color(0xffF8F8F8),
                                borderRadius: BorderRadius.circular(8.r),
                                border: BoxBorder.all(
                                  color: Color(0xffC8C8C8),
                                  width: 0.5,
                                ),
                              ),
                              child: Row(
                                children: [
                                  Checkbox(
                                    checkColor: AppColors.primaryBackground,
                                    activeColor: AppColors.primaryGreen,
                                    value:
                                        activity.isComplete == true
                                            ? true
                                            : false,
                                    onChanged: (value) {},
                                  ),
                                  8.horizontalSpace,
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          (activity.activity?.activity ??
                                                  'No Activity Title')
                                              .toText(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 14,
                                                translate: false,
                                              ),
                                        ],
                                      ),
                                      8.verticalSpace,
                                      '${activity.activity?.startDate ?? 'N/A'}  -  ${activity.activity?.endDate ?? 'N/A'}'
                                          .toText(
                                            fontSize: 12,
                                            color: AppColors.accentText,
                                            fontWeight: FontWeight.w500,
                                            translate: false,
                                          ),
                                    ],
                                  ),

                                  const Spacer(),
                                  SvgPicture.asset(AppIcon.rightArrow),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                    if (state is FarmCropActivityFailure) {
                      return ErrorWidgets(title: 'Error', message: state.error);
                    }
                    return Center(
                      child: 'No activities loaded.'.toText(translate: false),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onGenerateAdvisoryPressed(BuildContext context) {
    final activityState = context.read<FarmCropActivityCubit>().state;
    final insightState = context.read<InsightCubit>().state;

    if (activityState is! FarmCropActivityLoaded ||
        insightState is! InsightLoaded) {
      Utils.showToastError(
        context,
        'Required data not loaded yet. Please try again.',
        '',
        () {},
      );
      return;
    }

    if (activityState.farmCropActivityList.isEmpty) {
      Utils.showToastError(
        context,
        'No activities found for this crop to generate advisory.',
        '',
        () {},
      );
      return;
    }

    if (insightState.insightList.isEmpty) {
      Utils.showToastError(context, 'Weather data not available.', '', () {});
      return;
    }

    final cropName = controller.farmCrop.crop?.product?.name ?? 'N/A';

    final activities = List<CropActivities>.from(
      activityState.farmCropActivityList,
    );
    activities.sort((a, b) {
      final dateA = DateTime.tryParse(a.activity?.endDate ?? '');
      final dateB = DateTime.tryParse(b.activity?.endDate ?? '');
      if (dateA == null) return 1;
      if (dateB == null) return -1;
      return dateB.compareTo(dateA);
    });
    final lastActivity = activities.first.activity;
    final weatherData = insightState.insightList.first;

    context.read<CropAdvisoryCubit>().generateAdvisory(
      cropName: cropName,
      lastActivity: lastActivity,
      weatherData: weatherData,
    );
  }

  void _showAdvisoryDialog(BuildContext context, String advisoryText) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return AdvisoryPreviewWidget(message: advisoryText);
      },
    );
  }
}
