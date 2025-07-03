import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kaspa/core/utils/extensions.dart';

import '../../../../core/theme/colors.dart';

class MoreWidget extends StatelessWidget {
  final String icon;
  final String label;
  final Function() onTap;
  const MoreWidget({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        children: [
          InkWell(
            onTap: onTap,
            child: Row(
              children: [
                SvgPicture.asset(icon),
                8.horizontalSpace,
                label.toText(fontSize: 14, fontWeight: FontWeight.w500),
              ],
            ),
          ),
          5.verticalSpace,
          const Divider(thickness: 0.5, color: AppColors.lightGrey),
        ],
      ),
    );
  }
}
