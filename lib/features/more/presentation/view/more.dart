import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kaspa/core/utils/extensions.dart';
import '../../../../core/component/pages_bar.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/styles.dart';import '../contract/more.dart';


class MoreView extends StatelessWidget
    implements MoreViewContract {
  const MoreView({super.key, required this.controller});

  final MoreControllerContract controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
    
      body: _body(),
    );
  }

  Widget _body() {
    return Container(
      decoration: Styles.colorComboDecoration(),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PageBar(onTap: () {}),
            20.verticalSpace,
         Center(child: 'More Page'.toText(fontSize: 18, fontWeight: FontWeight.w700),)
          ],
        ),
      ),
    );
  }

}
