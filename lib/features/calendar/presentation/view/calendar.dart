import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kaspa/core/utils/extensions.dart';
import '../../../../core/data/model/crop.dart';
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
                    title: 'Crop Calendar'.toText(
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

                  SliverList(
                    delegate: SliverChildBuilderDelegate((
                      BuildContext context,
                      int index,
                    ) {
                      return CropCard(data: Crop(), onTap: () {});
                    }, childCount: 14),
                    
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
            fontWeight: FontWeight.w700,
            color: isSelected ? Colors.white : AppColors.primaryText,
          ),

          date.toText(
            fontSize: 12,
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
          color: isSelected ? AppColors.colorPrimary : Colors.grey[700],
          fontWeight: FontWeight.w700,
          fontSize: 12,
        ),
      ),
    );
  }
}
