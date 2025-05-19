import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/function.dart';
import '../../../../features/more/presentation/controller/create_market_price.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/component/empty_list_widget.dart';
import '../../../../core/navigation/navigator.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/styles.dart';
import '../../../home/presentation/bloc/bloc.dart';
import '../../../home/presentation/bloc/market_price/cubit.dart';
import '../contract/market_price.dart';
import '../widget/market_price_widget.dart';

class MarketPriceView extends StatelessWidget
    implements MarketPriceViewContract {
  const MarketPriceView({super.key, required this.controller});

  final MarketPriceControllerContract controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryGreen,
        onPressed: () => pushTo(CreateMarketPriceScreen(), context),
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
            Utils.customAppBar(context, 'price_updates', false, () {}),
            20.verticalSpace,
            Expanded(
              child: Padding(
                padding: REdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    "Here’s a list of price updates".toText(
                      translate: false,
                      color: AppColors.accentText,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
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
                                  message: 'market_price_empty',
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
