import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kaspa/features/calendar/presentation/controller/crop_activity.dart';
import '../../../../core/navigation/navigator.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../features/home/presentation/bloc/crop_calendar/crop_calendar_cubit.dart';
import '../../../../core/component/empty_list_widget.dart';
import '../../../../core/data/model/crop_calendar.dart';
import '../../../../core/resources/vectors.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/styles.dart';
import '../contract/calendar.dart';
import '../widget/crop_card.dart';

class CalendarView extends StatelessWidget implements CalendarViewContract {
  const CalendarView({super.key, required this.controller});

  final CalendarControllerContract controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,

      body: _body(context),
    );
  }

  Widget _body(context) {
    return Container(
      decoration: Styles.colorComboDecoration(),
      child: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 14.0),
              child: CustomScrollView(
                controller: controller.scrollController,
                slivers: [
                  SliverAppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    floating: false,
                    pinned: false,
                    title: 'Crops'.toText(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      translate: false,
                    ),
                    centerTitle: true,
                    actions: [SvgPicture.asset(AppIcon.calendar)],
                  ),

                  SliverToBoxAdapter(
                    child: Container(
                      color: Colors.transparent,
                      padding: REdgeInsets.symmetric(vertical: 8),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset(AppIcon.left),
                              'May 2025'.toText(
                                translate: false,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                              SvgPicture.asset(AppIcon.right),
                            ],
                          ),
                          16.verticalSpace,

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _buildCalendarDay('Thu', '22', false),
                              _buildCalendarDay('Fri', '23', true),
                              _buildCalendarDay('Sat', '24', false),
                              _buildCalendarDay('Sun', '25', false),
                              _buildCalendarDay('Mon', '26', false),
                              _buildCalendarDay('Tue', '27', false),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  SliverToBoxAdapter(
                    child: Padding(
                      padding: REdgeInsets.all(16),
                      child: 'Crops currently in season'.toText(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        translate: false,
                      ),
                    ),
                  ),

                  if (!controller.showFixedTabs)
                    SliverToBoxAdapter(child: _buildTabBar()),

                  BlocBuilder<CropCalendarCubit, CropCalendarState>(
                    builder: (context, state) {
                      if (state is CropCalendarLoading) {
                        return SliverToBoxAdapter(
                          child: ErrorWidgets(title: "empty".tr(), message: ''),
                        );
                      }
                      if (state is CropCalendarLoaded) {
                        List<CropCalendar> filteredList =
                            state.cropCalendarList;
                        String emptyListMessageKey = 'crop_list_empty';

                        if (controller.selectedTabIndex == 1) {
                          filteredList =
                              state.cropCalendarList
                                  .where(
                                    (item) =>
                                        item.stage?.toLowerCase() == "planting",
                                  )
                                  .toList();
                          if (state.cropCalendarList.isNotEmpty &&
                              filteredList.isEmpty) {
                            emptyListMessageKey = 'no_crops_in_planting_stage';
                          }
                        } else if (controller.selectedTabIndex == 2) {
                          filteredList =
                              state.cropCalendarList
                                  .where(
                                    (item) =>
                                        item.stage?.toLowerCase() == "growing",
                                  )
                                  .toList();
                          if (state.cropCalendarList.isNotEmpty &&
                              filteredList.isEmpty) {
                            emptyListMessageKey = 'no_crops_in_growing_stage';
                          }
                        } else if (controller.selectedTabIndex == 3) {
                          filteredList =
                              state.cropCalendarList
                                  .where(
                                    (item) =>
                                        item.stage?.toLowerCase() ==
                                        "harvesting",
                                  )
                                  .toList();
                          if (state.cropCalendarList.isNotEmpty &&
                              filteredList.isEmpty) {
                            emptyListMessageKey =
                                'no_crops_in_harvesting_stage';
                          }
                        }

                        if (filteredList.isEmpty) {
                          return SliverToBoxAdapter(
                            child: Padding(
                              padding: REdgeInsets.symmetric(vertical: 15.0),
                              child: ErrorWidgets(
                                message: emptyListMessageKey,
                              ),
                            ),
                          );
                        }
                        return SliverToBoxAdapter(
                          child: ListView.separated(
                            itemCount: filteredList.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            separatorBuilder:
                                (BuildContext context, int separatorIndex) =>
                                    12.verticalSpace,
                            itemBuilder: (BuildContext context, int itemIndex) {
                              final cropCalendarItem = filteredList[itemIndex];
                              return CropCard(
                                data: cropCalendarItem,
                                onTap: () {
                                  pushTo(CropActivityScreen(crop: state.cropCalendarList[itemIndex]),context);
                                },
                              );
                            },
                          ),
                        );
                      }
                      return SliverToBoxAdapter(child: const SizedBox.shrink());
                    },
                  ),
                ],
              ),
            ),
            if (controller.showFixedTabs)
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: AppColors.bgGreen.withAlpha((0.93 * 255).toInt()),
                  child: SafeArea(
                    child: Column(
                      children: [
                        Container(
                          color: Colors.transparent,
                          padding: REdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              12.horizontalSpace,
                              'Crops currently in season'.toText(
                                fontSize: 14,
                                translate: false,
                                fontWeight: FontWeight.w700,
                              ),
                            ],
                          ),
                        ),
                        _buildTabBar(),
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

  Widget _buildCalendarDay(String day, String date, bool isSelected) {
    return Container(
      width: 50,
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected ? Colors.green : Colors.white,
          width: 2,
        ),
        color: isSelected ? Colors.green : Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          day.toText(
            fontSize: 12,
            translate: false,
            fontWeight: FontWeight.w700,
            color: isSelected ? Colors.white : AppColors.primaryText,
          ),

          date.toText(
            fontSize: 12,
            translate: false,
            fontWeight: FontWeight.w700,
            color: isSelected ? Colors.white : AppColors.accentElement,
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      height: 60,
      padding: REdgeInsets.symmetric(vertical: 8),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _buildTab('All', 0),
            _buildTab('Planting Stage', 1),
            _buildTab('Growing Stage', 2),
            _buildTab('Harvesting Stage', 3),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(String text, int index) {
    bool isSelected = controller.selectedTabIndex == index;
    return GestureDetector(
      onTap: () {
        controller.tabClick(index);
      },
      child: Container(
        padding: REdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryBackground : Colors.grey[100],
        ),
        child: text.toText(
          translate: false,
          color: isSelected ? AppColors.colorPrimary : Colors.grey[700],
          fontWeight: FontWeight.w700,
          fontSize: 12,
        ),
      ),
    );
  }
}
