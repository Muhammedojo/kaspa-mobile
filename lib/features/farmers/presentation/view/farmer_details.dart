import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/function.dart';
import '../../../../core/utils/styles.dart';
import '../contract/farmer_details.dart';

class FarmerDetailsView extends StatelessWidget implements FarmerDetailsViewContract {
  const FarmerDetailsView({super.key, required this.controller});

  final FarmerDetailsControllerContract controller;

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
            Expanded(
              child: Padding(
                padding: REdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 24.r,
                  backgroundColor: AppColors.accentText,
                  child: Icon(
                    Icons.person,
                    size: 24.r,
                    color: AppColors.ColorAccent,
                  ),
                ),
                12.horizontalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    '${controller.farmer.title} ${controller.farmer.firstName} ${controller.farmer.lastName}'.toText(
                      translate: false,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                    (controller.farmer.cooperative?.name ?? 'Null Cooperative').toText(
                      translate: false,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                    '${controller.farmer.folioId}'.toText(
                      translate: false,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                'Active'.toText(
                  translate: false,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
                '${controller.farmer.phoneNumber}'.toText(
                  translate: false,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          ],
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
