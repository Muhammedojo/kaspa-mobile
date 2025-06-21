import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/component/search_bar_widget.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/component/empty_list_widget.dart';
import '../../../../core/component/pages_bar.dart';
import '../../../../core/navigation/navigator.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/styles.dart';
import '../../../home/presentation/bloc/bloc.dart';
import '../contract/cooperative.dart';
import '../controller/cooperative_details.dart';
import '../controller/register_cooperative.dart';
import '../widget/cooperative_card.dart';

class CooperativeView extends StatelessWidget
    implements CooperativeViewContract {
  const CooperativeView({super.key, required this.controller});

  final CooperativeControllerContract controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryGreen,
        onPressed: () => pushTo(RegisterCooperativeScreen(), context),
        child: Icon(Icons.add, color: AppColors.primaryBackground),
      ),
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
            Expanded(
              child: Padding(
                padding: REdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    'cooperatives'.toText(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),

                    SearchBarWidget(
                      hint: 'search_for_a_cooperative',
                      onTextChanged: (text) {
                        final String currentQuery = text ?? "";
                        final bool isQueryPresent = currentQuery.isNotEmpty;
                        controller.updateSearchStatus(isQueryPresent);
                        controller.searchCooperative(currentQuery);
                      },
                      searchController: controller.searchController,
                      onClearSearch: () => controller.onClearSearch(),
                      isSearching: controller.isSearching,
                    ),
                    16.verticalSpace,

                    Expanded(
                      child: BlocBuilder<CooperativeCubit, CooperativeState>(
                        builder: (context, state) {
                          if (state is CooperativeLoading) {
                            return ErrorWidgets(title: "empty", message: '');
                          }
                          if (state is CooperativeLoaded) {
                            return state.cooperativeList.isEmpty
                                ? ErrorWidgets(
                                  message: 'cooperative_list_empty',
                                )
                                : ListView.separated(
                                  itemCount: state.cooperativeList.length,
                                  physics:
                                      const AlwaysScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return CooperativeCard(
                                      cooperative: state.cooperativeList[index],
                                      onTap:
                                          () => pushTo(
                                            CooperativeDetailsScreen(
                                              cooperative:
                                                  state.cooperativeList[index],
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
