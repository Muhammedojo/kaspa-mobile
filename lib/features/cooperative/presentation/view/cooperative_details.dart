import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kaspa/core/navigation/navigator.dart';
import 'package:kaspa/core/resources/vectors.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/function.dart';
import '../../../../core/utils/styles.dart';
import '../contract/cooperative_details.dart';
import '../controller/update_cooperative.dart';
import '../widget/coop_pattern_cont.dart';

class CooperativeDetailsView extends StatelessWidget
    implements CooperativeDetailsViewContract {
  const CooperativeDetailsView({super.key, required this.controller});

  final CooperativeDetailsControllerContract controller;

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
              'cooperative_details',
              true,
              () => Navigator.of(context).pop(),
              actions: [_buildActionsMenu(context)],
            ),
            24.verticalSpace,
            Expanded(
              child: Padding(
                padding: REdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/vectors/coops.svg',
                          height: 80.sp,
                          width: 80.sp,
                        ),
                        8.horizontalSpace,
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            '${controller.cooperative.name}'.toText(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              translate: false,
                            ),
                            ((controller.cooperative.isVerified == true)
                                    ? 'Verified'
                                    : 'Unverified')
                                .toText(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  translate: false,
                                ),
                          ],
                        ),
                      ],
                    ),
                    24.verticalSpace,
                    CooperativeDetailsCard(),
                    24.verticalSpace,
                        
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        'Cooperative Code'.toText(
                          fontSize: 11,
                          color: AppColors.accentText,
                          translate: false,
                          fontWeight: FontWeight.w600,
                        ),
                        (controller.cooperative.code ?? 'Not Available')
                            .toText(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              translate: false,
                            ),
                      ],
                    ),
                    12.verticalSpace,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        'head'.toText(
                          fontSize: 11,
                          color: AppColors.accentText,
                          fontWeight: FontWeight.w600,
                        ),
                        (controller.cooperative.head ?? 'Not Available').toText(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          translate: false,
                        ),
                      ],
                    ),
                    12.verticalSpace,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        'secretary'.toText(
                          fontSize: 11,
                          color: AppColors.accentText,
                          fontWeight: FontWeight.w600,
                        ),
                        (controller.cooperative.secretary ?? 'Not Available')
                            .toText(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              translate: false,
                            ),
                      ],
                    ),
                    12.verticalSpace,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        'lga'.toText(
                          fontSize: 11,
                          color: AppColors.accentText,
                          fontWeight: FontWeight.w600,
                        ),
                        (controller.cooperative.lga?.name ?? 'Not Available')
                            .toText(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              translate: false,
                            ),
                      ],
                    ),
                    12.verticalSpace,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        'ward'.toText(
                          fontSize: 11,
                          color: AppColors.accentText,
                          fontWeight: FontWeight.w600,
                        ),
                        (controller.cooperative.ward?.name ?? 'Not Available')
                            .toText(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              translate: false,
                            ),
                      ],
                    ),
                    12.verticalSpace,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        'date_of_incorporation'.toText(
                          fontSize: 11,
                          color: AppColors.accentText,
                          fontWeight: FontWeight.w600,
                        ),
                        (controller.cooperative.dateOfIncorporation ??
                                'Not Available')
                            .toText(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              translate: false,
                            ),
                      ],
                    ),
                    12.verticalSpace,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        'certificate'.toText(
                          fontSize: 11,
                          color: AppColors.accentText,
                          fontWeight: FontWeight.w600,
                        ),
                        (controller.cooperative.certificate?.fileName ??
                                'Not Available')
                            .toText(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              translate: false,
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

  Widget _buildActionsMenu(BuildContext context) {
    const String editAction = 'edit';
    const String deleteAction = 'delete';

    return PopupMenuButton<String>(
      icon: SvgPicture.asset(AppIcon.more),
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0.r)),
      onSelected: (String item) {
        switch (item) {
          case editAction:
            pushTo(
              UpdateCooperativeScreen(cooperative: controller.cooperative),
              context,
            );
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
                  "Edit cooperative's details".toText(
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
                  SvgPicture.asset(AppIcon.people, height: 14.sp, width: 14.sp),
                  8.horizontalSpace,
                  "View members list".toText(
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
                  SvgPicture.asset(AppIcon.people, height: 14.sp, width: 14.sp),
                  8.horizontalSpace,
                  "Update executive member".toText(
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
                  "Blacklist cooperative".toText(
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
