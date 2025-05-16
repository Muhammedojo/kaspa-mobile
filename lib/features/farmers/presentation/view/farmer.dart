import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/component/pages_bar.dart';
import '../../../../core/component/empty_list_widget.dart';
import '../../../../core/component/search_bar_widget.dart';
import '../../../../core/navigation/navigator.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/styles.dart';
import '../bloc/get_farmer/get_farmer_cubit.dart';
import '../bloc/get_farmer/get_farmer_state.dart';
import '../contract/farmer.dart';
import '../controller/farmer_details.dart';
import '../controller/register_farmer.dart';
import '../widget/farmer_item_widget.dart';

class FarmerView extends StatelessWidget implements FarmerViewContract {
  const FarmerView({super.key, required this.controller});

  final FarmerControllerContract controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryGreen,
        onPressed: () => pushTo(RegisterFarmerScreen(), context),
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
            PageBar(
              onTap: () {
                //   pushTo(FarmerRegistrationWithStepper(), context);
              },
            ),
            24.verticalSpace,
            Expanded(
              child: Padding(
                padding: REdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    'farmers'.toText(fontSize: 18, fontWeight: FontWeight.w700),
                    SearchBarWidget(
                      hint: 'search_for_a_farmer',
                      onTextChanged: (text) {
                        final String currentQuery = text ?? "";
                        final bool isQueryPresent = currentQuery.isNotEmpty;

                        controller.updateSearchStatus(isQueryPresent);
                        controller.searchFarmer(currentQuery);
                      },
                      searchController: controller.searchController,
                      onClearSearch: () => controller.onClearSearch(),
                      isSearching: controller.isSearching,
                    ),
                    16.verticalSpace,
                    Expanded(
                      child: BlocBuilder<GetFarmersCubit, GetFarmersState>(
                        builder: (context, state) {
                          if (state is FarmerListLoading) {
                            return ErrorWidgets(
                              title: "empty".tr(),
                              message: '',
                            );
                          }
                          if (state is FarmerListLoaded) {
                            return state.dataList.isEmpty
                                ? ErrorWidgets(message: 'farmer_list_empty')
                                : ListView.separated(
                                  itemCount: state.dataList.length,
                                  physics:
                                      const AlwaysScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return FarmerCard(
                                      farmer: state.dataList[index],
                                      onTap:
                                          () => pushTo(
                                            FarmerDetailsScreen(
                                              farmer: state.dataList[index],
                                            ),
                                            context,
                                          ),
                                    );
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) =>
                                          12.verticalSpace,
                                );
                          }
                          if (state is FarmerListFailure) {
                            return ErrorWidgets(
                              title: "Error",
                              message: state.error,
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
