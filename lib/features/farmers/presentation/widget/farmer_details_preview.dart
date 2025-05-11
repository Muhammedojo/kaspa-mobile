import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/theme/colors.dart';

class FarmerConfirmation extends StatelessWidget {
  final String name;
  final String age;
  final String gender;
  final String phone;
  final String nin;
  final String address;
  final String lga;
  final String ward;
  final String registrationDate;
  final String registrationOfficer;
  final String? cooperative;
  final Function() proceed;

  const FarmerConfirmation({
    super.key,
    required this.name,
    required this.age,
    required this.gender,
    required this.phone,
    required this.nin,
    required this.address,
    required this.lga,
    required this.ward,
    required this.registrationDate,
    required this.registrationOfficer,
    this.cooperative,
    required this.proceed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xffD1D5DB)),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r),
          topRight: Radius.circular(24.r),
        ),
        color: AppColors.ColorAccent,
      ),
      child: Padding(
        padding: REdgeInsets.symmetric(horizontal: 28.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 10.h),
                SvgPicture.asset('assets/images/rectangle.svg'),
                SizedBox(height: 34.h),

                'Confirm Farmer Detail'.toText(),
                20.verticalSpace,

                CircleAvatar(
                  // backgroundImage: FileImage(File(photoPath)),
                  radius: 50.r,
                ),
            20.verticalSpace,
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 6.h),
                    HorizontalWidget(value: '', label: ''),
                    HorizontalWidget(value: '', label: ''),
                    HorizontalWidget(value: '', label: ''),
                    HorizontalWidget(value: '', label: ''),
                    HorizontalWidget(value: '', label: ''),
                    HorizontalWidget(value: '', label: ''),
                    HorizontalWidget(value: '', label: ''),
                    HorizontalWidget(value: '', label: ''),
                    HorizontalWidget(value: '', label: ''),
                    HorizontalWidget(value: '', label: ''),
                    HorizontalWidget(value: '', label: ''),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: proceed,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.r),
                  color: AppColors.accentText,
                ),
                child: Center(
                  child: Padding(
                    padding: REdgeInsets.symmetric(vertical: 15.0),
                    child: Text(
                      'confirm_and_proceed'.tr(),
                      style: TextStyle(
                        fontSize: 16.sp,
                        // fontFamily: Styles.FONT_TEXT_FAMILY,
                        color: const Color(0xffFFFFFF),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
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

class HorizontalWidget extends StatelessWidget {
  final String? label, value;
  const HorizontalWidget({super.key, this.label, this.value});

  @override
  Widget build(BuildContext context) => Column(
    children: [
      Row(
        children: [
          '$label'.toText(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.accentText,
          ),
          const Spacer(),
          '$value'.toText(
            textAlign: TextAlign.end,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ],
      ),
      16.verticalSpace,
      const Divider(),
    ],
  );
}
