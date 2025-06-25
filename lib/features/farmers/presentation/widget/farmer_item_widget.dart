import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/component/card_container_widget.dart';
import '../../../../core/data/model/farmer.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/theme/colors.dart';

class FarmerCard extends StatelessWidget {
  final Function() onTap;
  final Farmer farmer;
  const FarmerCard({super.key, required this.farmer, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CardContainerWidget(
        decoration: BoxDecoration(
          color: Color(0xffF8F8F8),
          borderRadius: BorderRadius.circular(8.r),
          border: BoxBorder.all(color: Color(0xffC8C8C8), width: 0.5),
        ),
        child: Row(
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
                    '${farmer.firstName} ${farmer.lastName}'.toText(
                      translate: false,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                    (farmer.cooperative?.name ?? 'Null Cooperative').toText(
                      translate: false,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                    '${farmer.folioId}'.toText(
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
                Container(
              padding: REdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color:AppColors.colorPrimary.withAlpha((0.1 * 255).toInt()),
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(color:AppColors.colorPrimary, width: 0.8),
              ),child:
                (farmer.isVerified == true
                    ? 'Verified': 'Unverified').toText(
                  translate: false,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),),
                '${farmer.phoneNumber}'.toText(
                  translate: false,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
