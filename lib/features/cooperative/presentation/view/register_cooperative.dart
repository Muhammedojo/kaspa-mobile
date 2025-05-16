import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_validator/form_validator.dart';
import 'package:kaspa/core/utils/extensions.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/function.dart';
import '../../../../core/utils/styles.dart';
import '../../../home/presentation/bloc/bloc.dart';
import '../contract/register_cooperative.dart';

class RegisterCooperativeView extends StatelessWidget
    implements RegisterCooperativeViewContract {
  const RegisterCooperativeView({super.key, required this.controller});

  final RegisterCooperativeControllerContract controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      body: _body(context),
    );
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
                Utils.customAppBar(
                  context,
                  'register_cooperative',
                 
                  false,
                  (){}
                ),
                24.verticalSpace,
                'cooperative_name'.toText(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
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
                          'Kaspa Cooperative',
                          '',
                          check: false,
                        ),
                    onChanged: (value) {},
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
                'Ward of Residence'.toText(
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
