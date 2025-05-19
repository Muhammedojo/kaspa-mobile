import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/component/empty_list_widget.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/component/pages_bar.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/styles.dart';
import '../../../farmers/presentation/bloc/get_farmer/get_farmer_state.dart';
import '../../../home/presentation/bloc/crop/crop_cubit.dart';
import '../contract/calendar.dart';
import '../widget/crop_card.dart';

class CalendarView extends StatelessWidget implements CalendarViewContract {
  const CalendarView({super.key, required this.controller});

  final CalendarControllerContract controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,

      body: _body(),
    );
  }

  Widget _body() {
    return Container(
      decoration: Styles.colorComboDecoration(),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PageBar(onTap: () {}),
            24.verticalSpace,
            Expanded(
              child: Padding(
                padding: REdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    'crop_calendar'.toText(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                    16.verticalSpace,
                    Expanded(
                      child: BlocBuilder<CropCubit, CropState>(
                        builder: (context, state) {
                          if (state is FarmerListLoading) {
                            return ErrorWidgets(
                              title: "empty".tr(),
                              message: '',
                            );
                          }
                          if (state is CropLoaded) {
                            return state.cropList.isEmpty
                                ? ErrorWidgets(
                                  title: 'crop_list_empty',
                                  message: '',
                                )
                                : GridView.builder(
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        crossAxisSpacing: 12,
                                        mainAxisSpacing: 12,
                                        childAspectRatio: 0.8,
                                      ),
                                  itemCount: state.cropList.length,
                                  physics:
                                      const AlwaysScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return CropCard(
                                      data: state.cropList[index],
                                      onTap: () {},
                                    );
                                  },
                                );
                          }
                          if (state is CropFailure) {
                            return ErrorWidgets(
                              title: "Error",
                              message: state.error,
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
