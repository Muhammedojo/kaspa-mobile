import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/function.dart';
import '../../../../core/utils/styles.dart';
import '../contract/farmer_farm_location.dart';

class FarmerFarmLocationView extends StatelessWidget implements FarmerFarmLocationViewContract {
  const FarmerFarmLocationView({super.key, required this.controller});

  final FarmerFarmLocationControllerContract controller;

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           Utils.customAppBar(context, 'farmer_farm_location',false,(){}),
            24.verticalSpace,
        
          ],
        ),
      ),
    );
 
  }
}
