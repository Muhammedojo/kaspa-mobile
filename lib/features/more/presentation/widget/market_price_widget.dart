import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/component/card_container_widget.dart';
import '../../../../core/data/model/market_data.dart';

class MarketPriceCard extends StatelessWidget {
  final MarketData data;
  final Function() onTap;
  const MarketPriceCard({super.key, required this.data, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CardContainerWidget(
        child: Row(
          children: [
            SvgPicture.asset('assets/vectors/coops.svg'),
            8.horizontalSpace,
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                '${data.market?.name}'.toText(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  translate: false,
                ),
                '0 Members'.toText(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  translate: false,
                ),
              ],
            ),
            const Spacer(),
            'verified'.toText(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColors.colorPrimary,
              translate: false,
            ),
          ],
        ),
      ),
    );
  }
}
