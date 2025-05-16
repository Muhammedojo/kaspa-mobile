import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/function.dart';
import '../../../../core/utils/styles.dart';
import '../contract/cooperative_details.dart';

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
            Utils.customAppBar(context, 'cooperative_details', true, () {}),
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
                            'Approved'.toText(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              translate: false,
                            ),
                          ],
                        ),
                      ],
                    ),
                    24.verticalSpace,
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
                        (controller.cooperative.secretary ?? 'Not Available').toText(
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
                        (controller.cooperative.lga?.name ?? 'Not Available').toText(
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
                        (controller.cooperative.ward?.name ?? 'Not Available').toText(
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
                        (controller.cooperative.dateOfIncorporation ?? 'Not Available').toText(
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
                        (controller.cooperative.certificate?.fileName ?? 'Not Available')
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
}
