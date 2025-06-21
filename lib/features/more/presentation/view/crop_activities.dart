import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/component/card_container_widget.dart';
import '../../../../core/component/empty_list_widget.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/extensions.dart';

import '../../../../core/utils/function.dart';
import '../../../../core/utils/styles.dart';
import '../../../home/presentation/bloc/farm_crop_activity/farm_crop_activity_cubit.dart';
import '../contract/crop_activities.dart';

class CropActivitiesView extends StatelessWidget
    implements CropActivitiesViewContract {
  const CropActivitiesView({super.key, required this.controller});

  final CropActivitiesControllerContract controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      body: _body(context),
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
                false, () {
              Navigator.pop(context);
            }),
            Expanded(
              child: Padding(
                padding: REdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                child:
                    BlocBuilder<FarmCropActivityCubit, FarmCropActivityState>(
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
                          return CardContainerWidget(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                               
                                (activity.activity?.activity ?? 'No Activity Title').toText(fontWeight: FontWeight.bold,translate: false),
                                4.verticalSpace,
                                (activity.activity?.description ?? 'No description')
                                    .toText(translate: false),
                                8.verticalSpace,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    'Start: ${activity.activity?.startDate ?? 'N/A'}'
                                        .toText(
                                            fontSize: 12,
                                            color: AppColors.accentText,
                                            translate: false),
                                    'End: ${activity.activity?.endDate ?? 'N/A'}'
                                        .toText(
                                            fontSize: 12,
                                            color: AppColors.accentText,
                                            translate: false),
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                      );
                    }
                    if (state is FarmCropActivityFailure) {
                      return ErrorWidgets(
                        title: 'Error',
                        message: state.error,
                      );
                    }
                    return Center(
                      child: 'No activities loaded.'.toText(translate: false),
                    );
                  },
                ),
              ),
         ) ],
        ),
      ),
    );
  }
}