import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../features/more/presentation/controller/create_farm_visit.dart';
import '../../../../core/utils/function.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/component/empty_list_widget.dart';
import '../../../../core/navigation/navigator.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/styles.dart';
import '../../../home/presentation/bloc/farm_visit/farm_visit_cubit.dart';
import '../contract/farm_visit.dart';
import '../widget/farm_visit_widget.dart';

class FarmVisitView extends StatelessWidget implements FarmVisitViewContract {
  const FarmVisitView({super.key, required this.controller});

  final FarmVisitControllerContract controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryGreen,
        onPressed: () => pushTo(CreateFarmVisitScreen(), context),
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
            Utils.customAppBar(context, 'farm_visit', false, () {}),
            20.verticalSpace,
            Expanded(
              child: Padding(
                padding: REdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    2.verticalSpace,
                    "Here’s a list of farm visits".toText(
                      translate: false,
                      color: AppColors.accentText,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                    16.verticalSpace,
                    Expanded(
                      child: BlocBuilder<FarmVisitCubit, FarmVisitState>(
                        builder: (context, state) {
                          if (state is FarmVisitLoading) {
                            return ErrorWidgets(title: "empty", message: '');
                          }
                          if (state is FarmVisitLoaded) {
                            return state.farmVisitList.isEmpty
                                ? ErrorWidgets(message: 'visit_list_empty')
                                : ListView.separated(
                                  itemCount: state.farmVisitList.length,
                                  physics:
                                      const AlwaysScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return FarmVisitCard(
                                      data: state.farmVisitList[index],
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
                          if (state is FarmVisitFailure) {
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
