import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/function.dart';
import '../../../../core/utils/styles.dart';
import '../contract/update_cooperative_exco.dart';

class UpdateCooperativeExcoView extends StatelessWidget
    implements UpdateCooperativeExcoViewContract {
  const UpdateCooperativeExcoView({super.key, required this.controller});

  final UpdateCooperativeExcoControllerContract controller;

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
