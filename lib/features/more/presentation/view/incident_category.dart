import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kaspa/core/utils/extensions.dart';
import '../../../../core/navigation/navigator.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/function.dart';
import '../../../../core/component/empty_list_widget.dart';
import '../../../../core/utils/styles.dart';
import '../../../home/presentation/bloc/incident_report/incident_report_cubit.dart';
import '../contract/incident_category.dart';
import '../controller/incident_report.dart';
import '../widget/incident_category.dart';

class IncidentCategoryView extends StatelessWidget
    implements IncidentCategoryViewContract {
  const IncidentCategoryView({super.key, required this.controller});

  final IncidentCategoryControllerContract controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _body(context));
  }

  Widget _body(context) {
    return Container(
      decoration: Styles.colorComboDecoration(context),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Utils.customAppBar(context, 'Incident Reports', false, () {}),
            20.verticalSpace,
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  'Here’s a list of incident categories'.toText(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    translate: false,
                  ),
                  InkWell(
                    onTap: () {
                      pushTo(IncidentReportScreen(), context);
                    },
                    child: Container(
                      padding: REdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        color: AppColors.colorPrimary.withAlpha(
                          (0.1 * 255).toInt(),
                        ),
                        borderRadius: BorderRadius.circular(16.r),
                        border: Border.all(
                          color: AppColors.colorPrimary,
                          width: 0.8,
                        ),
                      ),
                      child: 'History'.toText(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.colorPrimary,
                        translate: false,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            20.verticalSpace,
            Expanded(
              child: Padding(
                padding: REdgeInsets.symmetric(horizontal: 12.0),
                child: BlocBuilder<IncidentCubit, IncidentState>(
                  builder: (context, state) {
                    if (state is IncidentLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (state is IncidentLoaded) {
                      final pestAttackCount =
                          state.incidentList
                              .where((r) => r.category == 'Pest Attack')
                              .length;
                      final weatherCount =
                          state.incidentList
                              .where((r) => r.category == 'Weather')
                              .length;
                      final securityCount =
                          state.incidentList
                              .where((r) => r.category == 'Security')
                              .length;
                      final othersCount =
                          state.incidentList
                              .where((r) => r.category == 'Other')
                              .length;
                      final totalCount = state.incidentList.length;

                      final categories = [
                        {'name': 'Pest Attack', 'count': pestAttackCount},
                        {
                          'name': 'Weather and Environment',
                          'count': weatherCount,
                        },
                        {'name': 'Security', 'count': securityCount},
                        {'name': 'Others', 'count': othersCount},
                        {'name': 'Total', 'count': totalCount},
                      ];

                      return ListView.separated(
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          return IncidentCategoryCard(
                            category: categories[index]['name'] as String,
                            count: categories[index]['count'] as int,
                          );
                        },
                        separatorBuilder: (context, index) => 12.verticalSpace,
                      );
                    }
                    if (state is IncidentFailure) {
                      return ErrorWidgets(
                        title: "Error",
                        message: state.toString(),
                      );
                    }
                    return ErrorWidgets(message: 'no_incidents_found');
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
