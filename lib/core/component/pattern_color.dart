import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/theme/colors.dart';

class WidgetWrapper extends StatelessWidget {
  final Widget child;

  const WidgetWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: AppColors.primaryBackground,
          child: SvgPicture.asset(
            "assets/vectors/colorPattern.svg",
             colorFilter: ColorFilter.mode(
              AppColors.colorPrimary.withAlpha((0.3 * 255).round()),
              BlendMode.srcIn,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child,
      ],
    );
  }
}
