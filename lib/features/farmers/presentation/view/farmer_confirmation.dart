import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/function.dart';
import '../../../../core/utils/styles.dart';
import '../contract/farmer_confirmation.dart';

class FarmerConfirmationView extends StatelessWidget implements FarmerConfirmationViewContract {
  const FarmerConfirmationView({super.key, required this.controller});

  final FarmerConfirmationControllerContract controller;

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
           Utils.customAppBar(context, 'farmer_details'),
            24.verticalSpace,
        
          ],
        ),
      ),
    );
 
  }
}
