import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/component/search_bar_widget.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/component/empty_list_widget.dart';
import '../../../../core/component/pages_bar.dart';
import '../../../../core/navigation/navigator.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/function.dart';
import '../../../../core/utils/styles.dart';
import '../../../home/presentation/bloc/bloc.dart';
import '../../../home/presentation/bloc/incident_report/incident_report_cubit.dart';
import '../contract/incident_report.dart';
import '../controller/report_incident.dart';
import '../widget/report_widget.dart';

class IncidentReportView extends StatelessWidget
    implements IncidentReportViewContract {
  const IncidentReportView({super.key, required this.controller});

  final IncidentReportControllerContract controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryGreen,
        onPressed: () => pushTo(ReportIncidentScreen(), context),
        child: Icon(Icons.add, color: AppColors.primaryBackground),
      ),
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
            Utils.customAppBar(context, 'incident_report', false, () {}),
            20.verticalSpace,
            Expanded(
              child: Padding(
                padding: REdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    "Here’s a list of incident reports".toText(
                      translate: false,
                      color: AppColors.accentText,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                    16.verticalSpace,
                    Expanded(
                      child: BlocBuilder<IncidentCubit, IncidentState>(
                        builder: (context, state) {
                          if (state is IncidentLoading) {
                            return ErrorWidgets(title: "empty", message: '');
                          }
                          if (state is IncidentLoaded) {
                            return state.incidentList.isEmpty
                                ? ErrorWidgets(message: 'no_incident_logged')
                                : ListView.separated(
                                  itemCount: state.incidentList.length,
                                  physics:
                                      const AlwaysScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return ReportCard(
                                      data: state.incidentList[index],
                                      onTap: () {
                                        // pushTo(
                                        //   CooperativeDetailsScreen(
                                        //     cooperative:
                                        //         state.cooperativeList[index],
                                        //   ),
                                        //   context,
                                        // );
                                      },
                                    );
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) =>
                                          12.verticalSpace,
                                );
                          }
                          if (state is CooperativeFailure) {
                            return ErrorWidgets(
                              title: "Error",
                              message: state.toString(),
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                    ),
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
