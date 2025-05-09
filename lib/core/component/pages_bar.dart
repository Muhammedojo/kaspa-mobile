import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../resources/images.dart';
import '../theme/colors.dart';

class PageBar extends StatelessWidget {
  final Function() onTap;
  const PageBar({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.ColorAccent.withAlpha((0.2 * 255).toInt()),
        ),
      ),
      child: Padding(
        padding: REdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          children: [
            10.horizontalSpace,
            Image.asset(AppImage.horizontalLogo),
            const Spacer(),
            InkWell(
              onTap: onTap,
              child: Icon(Icons.logout, color: AppColors.burntRed)),
            16.horizontalSpace,

            InkWell(
              onTap :(){
               
              },
              child: SvgPicture.asset('assets/vectors/bell.svg')),
            10.horizontalSpace,
          ],
        ),
      ),
    );
  }
}
