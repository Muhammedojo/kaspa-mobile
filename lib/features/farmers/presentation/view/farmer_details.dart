import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kaspa/core/component/pages_bar.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/styles.dart';
import '../contract/farmer_details.dart';

class FarmerDetailsView extends StatelessWidget implements FarmerDetailsViewContract {
  const FarmerDetailsView({super.key, required this.controller});

  final FarmerDetailsControllerContract controller;

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
                    'farmers'.toText(fontSize: 18, fontWeight: FontWeight.w700),
                 
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
