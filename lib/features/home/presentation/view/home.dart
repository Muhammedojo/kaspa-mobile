import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/theme/colors.dart';
import '../contract/home.dart';

class HomeView extends StatelessWidget implements HomeViewContract {
  const HomeView({super.key, required this.controller});

  final HomeControllerContract controller;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: Scaffold(
        bottomNavigationBar: _navBar(context),
        backgroundColor: AppColors.primaryBackground,
        body: controller.widgetOptions.elementAt(controller.selectedIndex),
      ),
    );
  }

  Widget _navBar(context) {
    return BottomNavigationBar(
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.primaryBackground,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/vectors/inactiveDash.svg',height: 16.sp,width: 16.sp ),
          activeIcon: SvgPicture.asset('assets/vectors/activeDash.svg',height: 16.sp,width: 16.sp ),
          label: 'dashboard'.tr(),
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/vectors/inactiveFarmer.svg',height: 16.sp,width: 16.sp ,),
          activeIcon: SvgPicture.asset('assets/vectors/activeFarmer.svg',height: 16.sp,width: 16.sp ),
          label: 'farmers'.tr(),
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/vectors/inactiveCoop.svg',height: 16.sp,width: 16.sp ),
          activeIcon: SvgPicture.asset('assets/vectors/inactiveCoop.svg',height: 16.sp,width: 16.sp ),
          label: 'cooperatives'.tr(),
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/vectors/inactiveCal.svg',height: 16.sp,width: 16.sp ),
          activeIcon: SvgPicture.asset('assets/vectors/inactiveCal.svg',height: 16.sp,width: 16.sp ),
          label: 'calendar'.tr(),
        ),
         BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/vectors/inactiveMore.svg',height: 16.sp,width: 16.sp ),
          activeIcon: SvgPicture.asset('assets/vectors/inactiveMore.svg',height: 16.sp,width: 16.sp ),
          label: 'more'.tr(),
        ),
      ],
      currentIndex: controller.selectedIndex,
      selectedItemColor: AppColors.primaryGreen,
      unselectedItemColor: AppColors.ColorAccent,
      onTap: controller.onItemTapped,
    );
  }
}
