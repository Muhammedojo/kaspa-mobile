import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/images.dart';
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
            data.isCrop()
                ? Image.asset(AppImage.crop)
                : Image.asset(AppImage.livestock),
            8.horizontalSpace,
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                (data.product?.product?.name ?? 'Maize').toText(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  translate: false,
                ),
                (data.market?.name ?? 'Kaspa Market').toText(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  translate: false,
                ),
              ],
            ),
            const Spacer(),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                'NGN ${data.price ?? 0.0}'.toText(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: AppColors.colorPrimary,
                  translate: false,
                ),
                ' ${data.date ?? '2025-01-01'}'.toText(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  translate: false,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
