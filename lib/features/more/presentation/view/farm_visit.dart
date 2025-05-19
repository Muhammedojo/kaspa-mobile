import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../features/more/presentation/controller/create_market_price.dart';
import '../../../../core/component/search_bar_widget.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/component/empty_list_widget.dart';
import '../../../../core/component/pages_bar.dart';
import '../../../../core/navigation/navigator.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/styles.dart';
import '../../../home/presentation/bloc/bloc.dart';
import '../../../home/presentation/bloc/market_price/cubit.dart';
import '../contract/farm_visit.dart';
import '../widget/market_price_widget.dart';

class FarmVisitView extends StatelessWidget
    implements FarmVisitViewContract {
  const FarmVisitView({super.key, required this.controller});

  final FarmVisitControllerContract controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryGreen,
        onPressed: () => pushTo(CreateMarketPriceScreen(), context),
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
                   
                    2.verticalSpace,
                    "Here’s a list of farm visits".toText(
                      translate: false,
                      color: AppColors.accentText,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                    SearchBarWidget(
                      hint: 'search_for_a_cooperative',
                      onTextChanged: (text) {
                        controller.updateSearchStatus(
                          text != null && text.isNotEmpty,
                        );
                        if (text != null && text.isNotEmpty) {
                          controller.searchCooperative(text);
                        }
                      },
                      searchController: controller.searchController,
                      onClearSearch: () => controller.onClearSearch(),
                      isSearching: controller.isSearching,
                    ),
                    16.verticalSpace,
                    Expanded(
                      child: BlocBuilder<MarketPriceCubit, MarketPriceState>(
                        builder: (context, state) {
                          if (state is MarketPriceLoading) {
                            return ErrorWidgets(title: "empty", message: '');
                          }
                          if (state is MarketPriceLoaded) {
                            return state.marketPriceList.isEmpty
                                ? ErrorWidgets(
                                  message: 'market_price_list_empty',
                                )
                                : ListView.separated(
                                  itemCount: state.marketPriceList.length,
                                  physics:
                                      const AlwaysScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return MarketPriceCard(
                                      data: state.marketPriceList[index],
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
