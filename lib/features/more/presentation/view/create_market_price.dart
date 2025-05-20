import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_validator/form_validator.dart';
import '../../../../core/component/button.dart';
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
                      if (state is LgaLoaded) {
                        return DropdownButtonFormField(
                          icon: 'arrowDown'.toSvg(),
                          style: Styles.x14dp_4A4A4A(14.0.sp),
                          decoration:
                              Styles.textFormFieldDecorationBorderWithBackground(
                                'Choose the option',
                                '',
                              ),
                          items:
                              state.dataList.map((e) {
                                return DropdownMenuItem(
                                  value: e,
                                  child: (e.name!).toText(translate: false),
                                );
                              }).toList(),
                          value: controller.selectedLga,
                          onChanged: (newValue) {
                            controller.onSelectLga(newValue!);
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
                'market'.toText(fontSize: 14, fontWeight: FontWeight.w600),
                Padding(
                  padding: REdgeInsets.only(top: 5.0),
                  child: BlocBuilder<MarketCubit, MarketState>(
                    builder: (context, state) {
                      if (state is MarketLoaded) {
                        return DropdownButtonFormField(
                          icon: 'arrowDown'.toSvg(),
                          style: Styles.x14dp_4A4A4A(14.0.sp),
                          decoration:
                              Styles.textFormFieldDecorationBorderWithBackground(
                                'choose_an_option'.tr(),
                                '',
                              ),

                          items:
                              state.marketList.map((e) {
                                return DropdownMenuItem(
                                  value: e,
                                  child: (e.name ?? '').toText(
                                    translate: false,
                                  ),
                                );
                              }).toList(),
                          onChanged: (newValue) {
                            controller.onSelectMarket(newValue!);
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
                    validator: ValidationBuilder().required().build(),
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
                        '',
                        () {
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
