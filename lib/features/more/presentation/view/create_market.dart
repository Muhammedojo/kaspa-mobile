import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_validator/form_validator.dart';
import 'package:kaspa/core/utils/extensions.dart';
import '../../../../core/component/button.dart';
import '../../../../core/utils/function.dart';
import '../../../../core/utils/styles.dart';
import '../../../home/presentation/bloc/bloc.dart';
import '../../../home/presentation/bloc/market/cubit.dart';
import '../contract/create_market.dart';

class CreateMarketView extends StatelessWidget
    implements CreateMarketViewContract {
  const CreateMarketView({super.key, required this.controller});

  final CreateMarketControllerContract controller;

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
                Utils.customAppBar(context, 'create_market'),
                16.verticalSpace,
                'name'.toText(fontSize: 14, fontWeight: FontWeight.w600),
                Padding(
                  padding: REdgeInsets.only(top: 5.0),
                  child: TextFormField(
                    controller: controller.nameController,
                    style: Styles.x14dp_4A4A4A(14.0.sp),
                    maxLines: 1,
                    validator: ValidationBuilder().required().build(),
                    keyboardType: TextInputType.name,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    textInputAction: TextInputAction.next,
                    decoration:
                        Styles.textFormFieldDecorationBorderWithBackground(
                          'Enter market name',
                          '',
                          check: false,
                        ),
                    onChanged: (value) {},
                  ),
                ),
                16.verticalSpace,
                'ward'.toText(
                  fontSize: 14,
                  translate: false,
                  fontWeight: FontWeight.w600,
                ),
                Padding(
                  padding: REdgeInsets.only(top: 5.0),
                  child: BlocBuilder<WardCubit, WardState>(
                    builder: (context, state) {
                      if (state is WardLoaded) {
                        return DropdownButtonFormField(
                          icon: 'arrowDown'.toSvg(),
                          style: Styles.x14dp_4A4A4A(14.0.sp),
                          decoration:
                              Styles.textFormFieldDecorationBorderWithBackground(
                                'choose_an_option'.tr(),
                                '',
                              ),
                          items:
                              state.dataList.map((e) {
                                return DropdownMenuItem(
                                  value: e,
                                  child: (e.name!).toText(translate: false),
                                );
                              }).toList(),
                          value: controller.selectedWard,
                          onChanged: (newValue) {
                            controller.onSelectWard(newValue!);
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
                                'choose_an_option'.tr(),
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
                'address'.toText(fontSize: 14, fontWeight: FontWeight.w600),
                Padding(
                  padding: REdgeInsets.only(top: 5.0),
                  child: TextFormField(
                    controller: controller.addressController,
                    style: Styles.x14dp_4A4A4A(14.0.sp),
                    maxLines: 1,
                    validator: ValidationBuilder().required().build(),
                    keyboardType: TextInputType.name,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    textInputAction: TextInputAction.next,
                    decoration:
                        Styles.textFormFieldDecorationBorderWithBackground(
                          'Enter market address',
                          '',
                          check: false,
                        ),
                    onChanged: (value) {},
                  ),
                ),
                16.verticalSpace,

                30.verticalSpace,
                BlocListener<MarketCubit, MarketState>(
                  listener: (context, state) {
                    if (state is MarketLoading) {
                      Utils.showLoading(context);
                    } else if (state is CreateMarketSuccess) {
                      Utils.hideLoading(context);
                      Utils.showToastSuccess(
                        context,
                        'market_created_successfully'.tr(),
                        '',
                        () {
                          Navigator.pop(context);
                        },
                      );
                    } else if (state is MarketFailure) {
                      Utils.hideLoading(context);
                      Utils.showToastError(
                        context,
                        state.error.toString(),
                        '',
                        () {},
                      );
                    } else {
                      Utils.hideLoading(context);
                    }
                  },
                  child: ButtonWidget(
                    label: 'create_market',
                    onPressed: () => controller.createMarket(),
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
