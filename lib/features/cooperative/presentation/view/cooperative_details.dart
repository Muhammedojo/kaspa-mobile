import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/component/pages_bar.dart';
import '../../../../core/navigation/navigator.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/styles.dart';
import '../../../farmers/presentation/controller/register_farmer.dart';
import '../contract/cooperative_details.dart';


class CooperativeDetailsView extends StatelessWidget implements CooperativeDetailsViewContract {
  const CooperativeDetailsView({super.key, required this.controller});

  final CooperativeDetailsControllerContract controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
     floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryGreen,
        onPressed: () => pushTo(RegisterFarmerScreen(), context),
        child: Icon(Icons.add, color: AppColors.primaryBackground),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return 
  Container(
      decoration: Styles.colorComboDecoration(),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PageBar(onTap: () {}),
            20.verticalSpace,
            Expanded(
              child: Padding(
                padding: REdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    'cooperatives'.toText(fontSize: 18, fontWeight: FontWeight.w700),
                    2.verticalSpace,
                    "Here’s a list of cooperatives on KASPA".toText(
                      translate: false,
                      color: AppColors.accentText,
                      fontSize: 12, fontWeight: FontWeight.w500),
               ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
 
  }
}
