import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/function.dart';
import '../../../../core/utils/styles.dart';
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
      decoration: Styles.colorComboDecoration(),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Utils.customAppBar(
              context,
              'cooperative_confirmation_details',
              false,
              (){}
            ),
            24.verticalSpace,
          ],
        ),
      ),
    );
  }
}
