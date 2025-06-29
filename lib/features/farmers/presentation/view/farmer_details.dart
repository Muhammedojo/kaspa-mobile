import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kaspa/core/navigation/navigator.dart';
import 'package:kaspa/features/farmers/presentation/controller/farmer_farm_location.dart';
import '../../../../core/resources/vectors.dart';
import '../../../../features/farmers/presentation/widget/custom_tile.dart';
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
            Utils.customAppBar(
              context,
              'farmer_details',
              true,
              () => Navigator.of(context).pop(),
              actions: [_buildActionsMenu(context)],
            ),
            24.verticalSpace,
            Expanded(
              child: Padding(
                padding: REdgeInsets.symmetric(horizontal: 16.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                '${controller.farmer.title ?? ''} ${controller.farmer.firstName} ${controller.farmer.lastName}'
                                    .toText(
                                      translate: false,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                (controller.farmer.folioId ?? 'N/A').toText(
                                  translate: false,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                                (controller.farmer.phoneNumber ?? 'N/A').toText(
                                  translate: false,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                                (controller.farmer.cooperative?.name ??
                                        'N/A')
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
                                "age".toText(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                                8.horizontalSpace,
                                Expanded(
                                  child: (controller.farmer.age ??
                                          'Not available')
                                      .toText(
                                        translate: false,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                      ),
                                ),
                              ],
                            ),
                            12.verticalSpace,
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                "gender".toText(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                                8.horizontalSpace,
                                Expanded(
                                  child: (controller.farmer.gender ??
                                          'Not specified')
                                      .toText(
                                        translate: false,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                      ),
                                ),
                              ],
                            ),
                            12.verticalSpace,
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                "NIN".toText(
                                  fontSize: 14,
                                  translate: false,
                                  fontWeight: FontWeight.w500,
                                ),
                                8.horizontalSpace,
                                Expanded(
                                  child: (controller.farmer.nin ??
                                          'Not available')
                                      .toText(
                                        translate: false,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                      ),
                                ),
                              ],
                            ),
                            12.verticalSpace,
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                "address".toText(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                                8.horizontalSpace,
                                Expanded(
                                  child: (controller.farmer.address ??
                                          'Not specified')
                                      .toText(
                                        translate: false,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                      ),
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
                                "NOK Name".toText(
                                  fontSize: 14,
                                  translate: false,
                                  fontWeight: FontWeight.w600,
                                ),
                                8.horizontalSpace,
                                Expanded(
                                  child: (controller.farmer.nokDetails?.name ??
                                          'Not available')
                                      .toText(translate: false, fontSize: 14),
                                ),
                              ],
                            ),
                            12.verticalSpace,
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                "NOK Relationship".toText(
                                  fontSize: 14,
                                     translate: false,
                                  fontWeight: FontWeight.w600,
                                ),
                                8.horizontalSpace,
                                Expanded(
                                  child: (controller
                                              .farmer
                                              .nokDetails
                                              ?.relationship ??
                                          'Not specified')
                                      .toText(translate: false, fontSize: 14),
                                ),
                              ],
                            ),
                            12.verticalSpace,
                            Row(
                              children: [
                                "NOK Phone".toText(
                                  fontSize: 14,
                                     translate: false,
                                  fontWeight: FontWeight.w600,
                                ),
                                8.horizontalSpace,
                                Expanded(
                                  child: (controller
                                              .farmer
                                              .nokDetails
                                              ?.phoneNumber ??
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
                              children: [
                                "wallet_balance".toText(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                                8.horizontalSpace,
                                Expanded(
                                  child: (controller.farmer.lastName ??
                                          'NGN 60,000.00')
                                      .toText(translate: false, fontSize: 14),
                                ),
                              ],
                            ),
                            12.verticalSpace,
                            Row(
                              children: [
                                "credit_score".toText(
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
                            12.verticalSpace,
                            Row(
                              children: [
                                "account_details".toText(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                                8.horizontalSpace,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    (controller
                                                .farmer
                                                .bankDetails
                                                ?.accountNumber ??
                                            'Not specified')
                                        .toText(translate: false, fontSize: 14),
                                    (controller
                                                .farmer
                                                .bankDetails
                                                ?.accountName ??
                                            'Not specified')
                                        .toText(translate: false, fontSize: 14),
                                    SizedBox(
                                      width: 210.w,
                                      child: (controller
                                                  .farmer
                                                  .bankDetails
                                                  ?.bank
                                                  ?.name ??
                                              'Not specified')
                                          .toText(
                                            textOverflow: TextOverflow.ellipsis,
                                            translate: false,
                                            fontSize: 14,
                                          ),
                                    ),
                                  ],
                                ),
                                // Expanded(
                                //   child: (controller.farmer.gender ?? 'Not specified').toText(
                                //     translate: false,
                                //     fontSize: 14,
                                //   ),
                                // ),
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
                              children: [
                                "wallet_balance".toText(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                                8.horizontalSpace,
                                Expanded(
                                  child: (controller.farmer.lastName ??
                                          'NGN 60,000.00')
                                      .toText(translate: false, fontSize: 14),
                                ),
                              ],
                            ),
                            12.verticalSpace,
                            Row(
                              children: [
                                "credit_score".toText(
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
                            12.verticalSpace,
                            Row(
                              children: [
                                "account_details".toText(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                                8.horizontalSpace,
                                Column(
                                  children: [
                                    (controller.farmer.accountNumber ??
                                            'Not specified')
                                        .toText(translate: false, fontSize: 14),
                                    (controller.farmer.accountName ??
                                            'Not specified')
                                        .toText(translate: false, fontSize: 14),
                                    ('UBA').toText(
                                      translate: false,
                                      fontSize: 14,
                                    ),
                                  ],
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

  Widget _buildActionsMenu(BuildContext context) {
    const String viewFarmAction = 'viewFarm';
    const String deleteAction = 'delete';
    const String editAction = 'edit';


    return PopupMenuButton<String>(
      icon: SvgPicture.asset(AppIcon.more),
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0.r)),
      onSelected: (String item) {
        switch (item) {
          case viewFarmAction:
            pushTo(FarmerFarmLocationScreen(farmer: controller.farmer), context);
            break;
          case deleteAction:
            debugPrint('Delete cooperative selected');

            break;
        }
      },
      itemBuilder:
          (BuildContext context) => <PopupMenuEntry<String>>[
            PopupMenuItem<String>(
              value: editAction,
              child: Row(
                children: [
                  SvgPicture.asset(AppIcon.edit, height: 14.sp, width: 14.sp),
                  8.horizontalSpace,
                  "Edit farmer's details".toText(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.accentText,
                    translate: false,
                  ),
                ],
              ),
            ),
            const PopupMenuDivider(),
            PopupMenuItem<String>(
              value: viewFarmAction,
              child: Row(
                children: [
                  SvgPicture.asset(AppIcon.farm, height: 14.sp, width: 14.sp),
                  8.horizontalSpace,
                  "View farm location".toText(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.accentText,
                    translate: false,
                  ),
                ],
              ),
            ),

            const PopupMenuDivider(),
            PopupMenuItem<String>(
              value: deleteAction,
              child: Row(
                children: [
                  SvgPicture.asset(AppIcon.money, height: 14.sp, width: 14.sp),
                  8.horizontalSpace,
                  "View transaction history".toText(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.accentText,
                    translate: false,
                  ),
                ],
              ),
            ),
            const PopupMenuDivider(),
            PopupMenuItem<String>(
              value: deleteAction,
              child: Row(
                children: [
                  SvgPicture.asset(
                    AppIcon.blacklist,
                    height: 14.sp,
                    width: 14.sp,
                  ),
                  8.horizontalSpace,
                  "Suspend from cooperative".toText(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.accentText,
                    translate: false,
                  ),
                ],
              ),
            ),

            const PopupMenuDivider(),
            PopupMenuItem<String>(
              value: deleteAction,
              child: Row(
                children: [
                  SvgPicture.asset(
                    AppIcon.blacklist,
                    height: 14.sp,
                    width: 14.sp,
                  ),
                  8.horizontalSpace,
                  "Blacklist farmer".toText(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.accentText,
                    translate: false,
                  ),
                ],
              ),
            ),
          ],
    );
  }
}
