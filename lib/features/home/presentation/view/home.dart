import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/resources/vectors.dart';
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
          icon: SvgPicture.asset(AppIcon.inactiveHome),
          activeIcon: SvgPicture.asset(AppIcon.solidHome),
          label: 'home'.tr(),
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(AppIcon.inactiveFarmer),
          activeIcon: SvgPicture.asset(AppIcon.solidFarmer),
          label: 'farmers'.tr(),
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(AppIcon.inactiveHome),
          activeIcon: SvgPicture.asset(AppIcon.solidHome),
          label: 'agronomy'.tr(),
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(AppIcon.inactiveFarmer),
          activeIcon: SvgPicture.asset(AppIcon.solidFarmer),
          label: 'insights'.tr(),
        ),
      ],
      currentIndex: controller.selectedIndex,
      selectedItemColor: AppColors.primaryGreen,
      unselectedItemColor: AppColors.ColorAccent,
      onTap: controller.onItemTapped,
    );
  }
}
