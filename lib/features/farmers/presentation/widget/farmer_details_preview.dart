import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/resources/vectors.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/theme/colors.dart';

class FarmerConfirmation extends StatelessWidget {
  final String fName;
  final String lName;
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
    required this.fName,
       required this.lName,
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
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8.r),
          topRight: Radius.circular(8.r),
        ),
        color: Colors.transparent,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.bgGreen,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.r),
                    topRight: Radius.circular(16.r),
                  ),
                ),
                child: Padding(
                  padding: REdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 16,
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        AppIcon.addFarmer,
                        height: 20.sp,
                        width: 20.sp,
                      ),
                      4.horizontalSpace,
                      Expanded(
                        child: 'Confirm Farmer Detail'.toText(
                          fontSize: 12,
                          color: AppColors.colorPrimary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: SvgPicture.asset(
                          AppIcon.cancel,
                          height: 32.sp,
                          width: 32.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              20.verticalSpace,

              CircleAvatar(
                // backgroundImage: FileImage(File(photoPath)),
                radius: 40.r,
              ),
              20.verticalSpace,
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: REdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 6.h),
                    HorizontalWidget(value: fName, label: 'first_name'),
                     HorizontalWidget(value: lName, label: 'last_name'),
                    HorizontalWidget(value: age, label: 'age'),
                    HorizontalWidget(value: gender, label: 'gender'),
                    HorizontalWidget(value: phone, label: 'phone_number'),
                    HorizontalWidget(value: nin, label: 'NIN'),
                    HorizontalWidget(value: address, label: 'address'),
                    HorizontalWidget(value: lga, label: 'lga'),
                    HorizontalWidget(value: ward, label: 'ward'),
                    HorizontalWidget(
                      value: registrationDate,
                      label: 'registration_date',
                    ),
                    HorizontalWidget(
                      value: registrationOfficer,
                      label: 'registration_officer',
                    ),
                    HorizontalWidget(value: cooperative, label: 'cooperative'),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: REdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
            child: InkWell(
              onTap: proceed,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.r),
                  color: AppColors.colorPrimary,
                ),
                child: Center(
                  child: Padding(
                    padding: REdgeInsets.symmetric(vertical: 15.0),
                    child: 'confirm'.toText(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryBackground,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
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
