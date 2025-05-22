import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/theme/colors.dart';

class CooperativeDetailsCard extends StatelessWidget {
  const CooperativeDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        image: DecorationImage(
          image: AssetImage('assets/images/walletBg.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: REdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    'total_member'.toText(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryBackground,
                    ),
                    '1200'.toText(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      translate: false,
                      color: AppColors.primaryBackground,
                    ),
                  ],
                ),
                '|'.toText(fontSize: 12, fontWeight: FontWeight.w600),
                Column(
                  children: [
                    'wallet_balance'.toText(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryBackground,
                    ),
                    'NGN 50000'.toText(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      translate: false,
                      color: AppColors.primaryBackground,
                    ),
                  ],
                ),
                '|'.toText(fontSize: 12, fontWeight: FontWeight.w600),

                Column(
                  children: [
                    'credit_score'.toText(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryBackground,
                    ),
                    '700'.toText(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      translate: false,
                      color: AppColors.primaryBackground,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
