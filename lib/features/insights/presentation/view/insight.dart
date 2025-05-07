import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/resources/vectors.dart';
import '../../../../core/theme/colors.dart';
import '../contract/insight.dart';


class InsightView extends StatelessWidget implements InsightViewContract {
  const InsightView({super.key, required this.controller});

  final InsightControllerContract controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryGreen,
        onPressed: () {},
        child: SvgPicture.asset(
          AppIcon.success,
        ),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return SafeArea(
        child: SingleChildScrollView(
      child: Padding(
        padding: REdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [],
        ),
      ),
    ));
  }
}
