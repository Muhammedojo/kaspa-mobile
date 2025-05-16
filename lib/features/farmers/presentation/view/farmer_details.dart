import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kaspa/features/farmers/presentation/widget/custom_tile.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/function.dart';
import '../../../../core/utils/styles.dart';
import '../contract/farmer_details.dart';

class FarmerDetailsView extends StatelessWidget
    implements FarmerDetailsViewContract {
  const FarmerDetailsView({super.key, required this.controller});

  final FarmerDetailsControllerContract controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return Container(
      decoration: Styles.colorComboDecoration(),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Utils.customAppBar(context, 'farmer_details', true, () {}),
            24.verticalSpace,
            Expanded(
              child: Padding(
                padding: REdgeInsets.symmetric(horizontal: 16.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Farmer info section
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
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                '${controller.farmer.title} ${controller.farmer.firstName} ${controller.farmer.lastName}'
                                    .toText(
                                      translate: false,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                '${controller.farmer.folioId}'.toText(
                                  translate: false,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                                '${controller.farmer.phoneNumber}'.toText(
                                  translate: false,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                                (controller.farmer.cooperative?.name ??
                                        'Cooperative Name')
                                    .toText(
                                      translate: false,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      24.verticalSpace,
                      CustomTile(
                        title: "Farmer's Bio",
                        body: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                "Date of Birth:".toText(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                                8.horizontalSpace,
                                Expanded(
                                  child: (controller.farmer.age ??
                                          'Not available')
                                      .toText(translate: false, fontSize: 14),
                                ),
                              ],
                            ),
                            12.verticalSpace,
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                "Gender:".toText(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                                8.horizontalSpace,
                                Expanded(
                                  child: (controller.farmer.gender ??
                                          'Not specified')
                                      .toText(translate: false, fontSize: 14),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      16.verticalSpace,
                      CustomTile(
                        title: "Next of Kin",
                        body: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                "Date of Birth:".toText(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                                8.horizontalSpace,
                                Expanded(
                                  child: (controller.farmer.age ??
                                          'Not available')
                                      .toText(translate: false, fontSize: 14),
                                ),
                              ],
                            ),
                            12.verticalSpace,
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                "Gender:".toText(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                                8.horizontalSpace,
                                Expanded(
                                  child: (controller.farmer.gender ??
                                          'Not specified')
                                      .toText(translate: false, fontSize: 14),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                  16.verticalSpace,
                     CustomTile(
                        title: "Financial details", 
                        body: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                "Date of Birth:".toText(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                                8.horizontalSpace,
                                Expanded(
                                  child: (controller.farmer.age ?? 'Not available').toText(
                                    translate: false,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            12.verticalSpace,
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                "Gender:".toText(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600, 
                                ),
                                8.horizontalSpace,
                                Expanded(
                                  child: (controller.farmer.gender ?? 'Not specified').toText(
                                    translate: false,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      16.verticalSpace,
                         CustomTile(
                        title: "Farmer's Loan", 
                        body: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                "Date of Birth:".toText(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                                8.horizontalSpace,
                                Expanded(
                                  child: (controller.farmer.age ?? 'Not available').toText(
                                    translate: false,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            12.verticalSpace,
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                "Gender:".toText(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600, 
                                ),
                                8.horizontalSpace,
                                Expanded(
                                  child: (controller.farmer.gender ?? 'Not specified').toText(
                                    translate: false,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      
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
}
