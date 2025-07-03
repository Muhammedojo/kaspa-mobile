import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/component/pages_bar.dart';
import '../../../../core/navigation/navigator.dart';
import '../../../../core/resources/vectors.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/styles.dart';
import '../../../home/presentation/controller/profile_issue.dart';
import '../contract/more.dart';
import '../controller/incident_report.dart';
import '../controller/market_price.dart';
import '../widget/more_widget.dart';

class MoreView extends StatelessWidget implements MoreViewContract {
  const MoreView({super.key, required this.controller});

  final MoreControllerContract controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,

      body: _body(context),
    );
  }

  Widget _body(context) {
    return Container(
      decoration: Styles.colorComboDecoration(),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PageBar(onTap: () {}),
            20.verticalSpace,

            MoreWidget(
              icon: AppIcon.coop,
              label: 'weather',
              onTap: () {
                // pushTo(CooperativeScreen(), context);
              },
            ),
            MoreWidget(
              icon: AppIcon.coop,
              label: 'price_updates',
              onTap: () {
                pushTo(MarketPriceScreen(), context);
              },
            ),
            MoreWidget(
              icon: AppIcon.coop,
              label: 'farmers_profile_issues',
              onTap: () {
                pushTo(ProfileIssueScreen(), context);
              },
            ),
            MoreWidget(
              icon: AppIcon.incident,
              label: 'incidents',
              onTap: () {
                pushTo(IncidentReportScreen(), context);
              },
            ),
            MoreWidget(
              icon: AppIcon.coop,
              label: 'my_tasks',
              onTap: () {
                //pushTo(CooperativeScreen(), context);
              },
            ),
            MoreWidget(
              icon: AppIcon.coop,
              label: 'ai_chat_history',
              onTap: () {
                //pushTo(CooperativeScreen(), context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
