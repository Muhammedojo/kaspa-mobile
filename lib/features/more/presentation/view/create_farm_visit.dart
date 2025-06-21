import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_validator/form_validator.dart';
import '../../../../core/component/button.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/utils/function.dart';
import '../../../../core/utils/styles.dart';
import '../../../farmers/presentation/bloc/bloc.dart';
import '../../../farmers/presentation/bloc/get_farmer/get_farmer_state.dart';
import '../../../home/presentation/bloc/farm_visit/farm_visit_cubit.dart';
import '../../../home/presentation/bloc/plot/plot_cubit.dart';
import '../../../home/presentation/bloc/product/cubit.dart';
import '../contract/create_farm_visit.dart';

class CreateFarmVisitView extends StatelessWidget
    implements CreateFarmVisitViewContract {
  const CreateFarmVisitView({super.key, required this.controller});

  final CreateFarmVisitControllerContract controller;

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
                Utils.customAppBar(context, 'new_farm_visit', false, () {}),
                25.verticalSpace,
                'farmer'.toText(fontSize: 14, fontWeight: FontWeight.w600),
                Padding(
                  padding: REdgeInsets.only(top: 5.0),
                  child: BlocBuilder<GetFarmersCubit, GetFarmersState>(
                    builder: (context, state) {
                      if (state is FarmerListLoaded) {
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
                                  child: ('${e.firstName} ${e.lastName}')
                                      .toText(translate: false),
                                );
                              }).toList(),
                          onChanged: (newValue) {
                            controller.onSelectFarmer(newValue!);
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
                'plot'.toText(fontSize: 14, fontWeight: FontWeight.w600),
                Padding(
                  padding: REdgeInsets.only(top: 5.0),
                  child: BlocBuilder<PlotCubit, PlotState>(
                    builder: (context, state) {
                      if (state is PlotLoaded) {
                        return DropdownButtonFormField(
                          icon: 'arrowDown'.toSvg(),
                          style: Styles.x14dp_4A4A4A(14.0.sp),
                          decoration:
                              Styles.textFormFieldDecorationBorderWithBackground(
                                'choose_an_option'.tr(),
                                '',
                              ),

                          items:
                              state.plotList.map((e) {
                                return DropdownMenuItem(
                                  value: e,
                                  child: ('${e.sizeInHa} ha').toText(
                                    translate: false,
                                  ),
                                );
                              }).toList(),
                          onChanged: (newValue) {
                            controller.onSelectPlot(newValue!);
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
                'Total area of land being cultivated'.toText(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  translate: false,
                ),
                Padding(
                  padding: REdgeInsets.only(top: 5.0),
                  child: TextFormField(
                    controller: controller.totalAOLController,
                    style: Styles.x14dp_4A4A4A(14.0.sp),
                    maxLines: 1,
                    validator: ValidationBuilder().required().build(),
                    keyboardType: TextInputType.number,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    textInputAction: TextInputAction.next,
                    decoration:
                        Styles.textFormFieldDecorationBorderWithBackground(
                          'Kindly enter the total area of land being cultivated',
                          '',
                          check: false,
                        ),
                    onChanged: (value) {},
                  ),
                ),
                16.verticalSpace,
                'Crop being cultivated'.toText(
                  fontSize: 14,
                  translate: false,
                  fontWeight: FontWeight.w600,
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
                'Area of land (in Ha)'.toText(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  translate: false,
                ),
                Padding(
                  padding: REdgeInsets.only(top: 5.0),
                  child: TextFormField(
                    controller: controller.aolController,
                    style: Styles.x14dp_4A4A4A(14.0.sp),
                    maxLines: 1,
                    validator: ValidationBuilder().required().build(),
                    keyboardType: TextInputType.number,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    textInputAction: TextInputAction.next,
                    decoration:
                        Styles.textFormFieldDecorationBorderWithBackground(
                          'Kindly enter the area of land in Hectares',
                          '',
                          check: false,
                        ),
                    onChanged: (value) {},
                  ),
                ),

                50.verticalSpace,
                BlocListener<FarmVisitCubit, FarmVisitState>(
                  listener: (context, state) {
                    if (state is FarmVisitLoading) {
                      Utils.showLoading(context);
                    } else if (state is CreateVisitSuccess) {
                      Utils.hideLoading(context);
                      controller.clearScreen();
                      Utils.showToastSuccess(
                        context,
                        'visit_logged_successfully'.tr(),
                        '',
                        () {
                          Navigator.pop(context);
                        },
                      );
                    } else if (state is FarmVisitFailure) {
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
                    label: 'submit',
                    onPressed: () => controller.logVisit(),
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
