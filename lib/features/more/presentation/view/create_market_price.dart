import 'package:dropdown_search/dropdown_search.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_validator/form_validator.dart';
import '../../../../core/component/button.dart';
import '../../../../core/data/model/lga.dart';
import '../../../../core/data/model/market.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/utils/function.dart';
import '../../../../core/utils/styles.dart';
import '../../../home/presentation/bloc/bloc.dart';
import '../../../home/presentation/bloc/market/cubit.dart';
import '../../../home/presentation/bloc/market_price/cubit.dart';
import '../../../home/presentation/bloc/product/cubit.dart';
import '../contract/create_market_price.dart';

class CreateMarketPriceView extends StatelessWidget
    implements CreateMarketPriceViewContract {
  const CreateMarketPriceView({super.key, required this.controller});

  final CreateMarketPriceControllerContract controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _body(context));
  }

  Widget _body(context) {
    return Container(
      decoration: Styles.colorComboDecoration(),
      child: SafeArea(
        child: Padding(
          padding: REdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Utils.customAppBar(context, 'new_price_update', false, () {}),
                25.verticalSpace,
                'LGA'.toText(
                  fontSize: 14,
                  translate: false,
                  fontWeight: FontWeight.w600,
                ),
                Padding(
                  padding: REdgeInsets.only(top: 5.0),
                  child: BlocBuilder<LgaCubit, LgaState>(
                    builder: (context, state) {
                      List<Lga> lgas = [];
                      if (state is LgaLoaded) {
                        lgas = state.dataList;
                      }

                      return DropdownSearch<Lga>(
                        suffixProps: DropdownSuffixProps(
                          dropdownButtonProps: DropdownButtonProps(
                            iconClosed: 'arrowDown'.toSvg(),
                          ),
                        ),
                        popupProps: PopupProps.menu(
                          showSearchBox: true,
                          searchFieldProps: TextFieldProps(
                            decoration: InputDecoration(
                              labelStyle:
                                  Styles.normalWeightGreyNormalSizeTextStyle,

                              hintText: "search_lga".tr(),
                              hintStyle:
                                  Styles.normalWeightGreyNormalSizeTextStyle,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                            ),
                          ),
                          itemBuilder:
                              (context, lgaItem, isDisabled, isSelected) =>
                                  ListTile(
                                    title: (lgaItem.name ?? '').toText(
                                      translate: false,
                                    ),
                                    selected: isSelected,
                                  ),

                          emptyBuilder:
                              (context, searchEntry) =>
                                  Center(child: 'no_lga_found'.toText()),
                        ),
                        items: (filter, infiniteScrollProps) async {
                          if (filter.isEmpty) {
                            return lgas;
                          }
                          return lgas
                              .where(
                                (lga) =>
                                    lga.name?.toLowerCase().contains(
                                      filter.toLowerCase(),
                                    ) ??
                                    false,
                              )
                              .toList();
                        },
                        itemAsString: (Lga? lga) => lga?.name ?? '',
                        compareFn: (Lga? item1, Lga? item2) {
                          return item1?.pk == item2?.pk;
                        },
                        selectedItem: controller.selectedLga,
                        onChanged: (Lga? newValue) {
                          if (newValue != null) {
                            controller.onSelectLga(newValue);
                          }
                        },
                        decoratorProps: DropDownDecoratorProps(
                          decoration:
                              Styles.textFormFieldDecorationBorderWithBackground(
                                'choose_an_option'.tr(),
                                '',
                              ),
                        ),
                      );
                    },
                  ),
                ),
                16.verticalSpace,
                'market'.toText(fontSize: 14, fontWeight: FontWeight.w600),
                Padding(
                  padding: REdgeInsets.only(top: 5.0),
                  child: BlocBuilder<MarketCubit, MarketState>(
                    builder: (context, state) {
                      List<Market> filteredMarkets = [];
                      String hintText = 'choose_an_option'.tr();
                      bool isDisabled = false;

                      if (state is MarketLoaded) {
                        if (controller.selectedLga == null) {
                          hintText = 'select_lga_first'.tr();
                          isDisabled = true;
                        } else {
                          filteredMarkets =
                              state.marketList
                                  .where(
                                    (market) =>
                                        market.lga?.id ==
                                        controller.selectedLga!.pk,
                                  )
                                  .toList();
                          if (filteredMarkets.isEmpty) {
                            hintText = 'no_markets_available'.tr();
                            isDisabled = true;
                          }
                        }
                      } else if (state is MarketLoading) {
                        hintText = 'loading_markets'.tr();
                        isDisabled = true;
                      } else {
                        hintText = 'markets_not_loaded'.tr();
                        isDisabled = true;
                      }
                      final Market? currentSelectedMarket =
                          filteredMarkets.any(
                                (w) => w.pk == controller.selectedMarket?.pk,
                              )
                              ? controller.selectedMarket
                              : null;
                      return DropdownButtonFormField<Market>(
                        icon: 'arrowDown'.toSvg(),
                        style: Styles.x14dp_4A4A4A(14.0.sp),
                        decoration:
                            Styles.textFormFieldDecorationBorderWithBackground(
                              hintText,
                              '',
                            ),
                        items:
                            filteredMarkets.map((e) {
                              return DropdownMenuItem<Market>(
                                value: e,
                                child: (e.name ?? '').toText(translate: false),
                              );
                            }).toList(),
                        value: currentSelectedMarket,
                        onChanged:
                            isDisabled
                                ? null
                                : (Market? newValue) {
                                  controller.onSelectMarket(newValue);
                                },
                      );
                    },
                  ),
                ),

                16.verticalSpace,
                'Commodity/Livestock'.toText(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  translate: false,
                ),
                Padding(
                  padding: REdgeInsets.only(top: 5.0),
                  child: BlocBuilder<ProductCubit, ProductState>(
                    builder: (context, state) {
                      if (state is ProductLoaded) {
                        return DropdownButtonFormField(
                          icon: 'arrowDown'.toSvg(),
                          style: Styles.x14dp_4A4A4A(14.0.sp),
                          decoration:
                              Styles.textFormFieldDecorationBorderWithBackground(
                                'choose_an_option'.tr(),
                                '',
                              ),

                          items:
                              state.productList.map((e) {
                                return DropdownMenuItem(
                                  value: e,
                                  child: (e.name ?? '').toText(
                                    translate: false,
                                  ),
                                );
                              }).toList(),
                          onChanged: (newValue) {
                            controller.onSelectCrop(newValue!);
                          },
                        );
                      }
                      return DropdownButtonFormField(
                        style: Styles.x14dp_4A4A4A(14.0.sp),
                        items: [],
                        onChanged: (_) {},
                      );
                    },
                  ),
                ),
                16.verticalSpace,
                'price'.toText(fontSize: 14, fontWeight: FontWeight.w600),
                Padding(
                  padding: REdgeInsets.only(top: 5.0),
                  child: TextFormField(
                    controller: controller.priceController,
                    style: Styles.x14dp_4A4A4A(14.0.sp),
                    maxLines: 1,
                    validator: ValidationBuilder().required().build(),
                    keyboardType: TextInputType.number,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    textInputAction: TextInputAction.next,
                    decoration:
                        Styles.textFormFieldDecorationBorderWithBackground(
                          '2000',
                          '',
                          check: false,
                        ),
                    onChanged: (value) {},
                  ),
                ),
                16.verticalSpace,
                'Volume(optional)'.toText(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  translate: false,
                ),
                Padding(
                  padding: REdgeInsets.only(top: 5.0),
                  child: TextFormField(
                    controller: controller.volumeController,
                    style: Styles.x14dp_4A4A4A(14.0.sp),
                    maxLines: 1,
                    validator: ValidationBuilder(optional: true).build(),
                    keyboardType: TextInputType.number,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    textInputAction: TextInputAction.next,
                    decoration:
                        Styles.textFormFieldDecorationBorderWithBackground(
                          '1000',
                          '',
                          check: false,
                        ),
                    onChanged: (value) {},
                  ),
                ),

                50.verticalSpace,
                BlocListener<MarketPriceCubit, MarketPriceState>(
                  listener: (context, state) {
                    if (state is MarketPriceLoading) {
                      Utils.showLoading(context);
                    } else if (state is CreateMarketPriceSuccess) {
                      Utils.hideLoading(context);
                      controller.clearScreen();
                      Utils.showToastSuccess(
                        context,
                        'price_logged_successfully'.tr(),
                        'Go to Price List',
                        () {
                          Navigator.of(context, rootNavigator: true).pop();
                          Navigator.pop(context);
                        },
                      );
                    } else if (state is MarketFailure) {
                      Utils.hideLoading(context);
                      Utils.showToastError(
                        context,
                        state.toString(),
                        '',
                        () {},
                      );
                    } else {
                      Utils.hideLoading(context);
                    }
                  },

                  child: ButtonWidget(
                    label: 'log_price',
                    onPressed: () => controller.logPrice(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
