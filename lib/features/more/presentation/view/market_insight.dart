import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/component/search_bar_widget.dart';
import '../../../../core/utils/function.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/component/empty_list_widget.dart';
import '../../../../core/navigation/navigator.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/styles.dart';
import '../../../home/presentation/bloc/bloc.dart';
import '../../../home/presentation/bloc/dod_change/dod_cubit.dart';
import '../contract/market_insight.dart';
import '../controller/market_price.dart';
import '../widget/market_insight.dart';

class MarketInsightView extends StatelessWidget
    implements MarketInsightViewContract {
  const MarketInsightView({super.key, required this.controller});

  final MarketInsightControllerContract controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: AppColors.primaryGreen,
      //   onPressed: () => pushTo(CreateMarketPriceScreen(), context),
      //   child: Icon(Icons.add, color: AppColors.primaryBackground),
      // ),
      body: _body(context),
    );
  }

  Widget _body(context) {
    return Container(
      decoration: Styles.colorComboDecoration(context),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Utils.customAppBar(context, 'Market Insights', false, () {}),

            20.verticalSpace,
            Expanded(
              child: Padding(
                padding: REdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        "Here’s a list of price updates".toText(
                          translate: false,
                          color: AppColors.accentText,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),

                        InkWell(
                          onTap: () {
                            pushTo(MarketPriceScreen(), context);
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
                    10.verticalSpace,
                    SearchBarWidget(
                      hint: 'search_insight',
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
                      child: BlocBuilder<DodCubit, DodState>(
                        builder: (context, state) {
                          if (state is DodLoading) {
                            return ErrorWidgets(title: "empty", message: '');
                          }
                          if (state is DodLoaded) {
                           // debugPrint('DOD List Length: ${state.dodList.length}');
                            return state.dodList.isEmpty
                                ? ErrorWidgets(message: 'empty')
                                : ListView.separated(
                                  itemCount: state.dodList.length,
                                  physics:
                                      const AlwaysScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return MarketInsightCard(
                                      data: state.dodList[index],
                                      onTap: () {
                                        // controller.previewLogModal(item);
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
