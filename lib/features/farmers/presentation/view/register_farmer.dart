import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_validator/form_validator.dart';
import 'package:kaspa/core/utils/extensions.dart';
import 'package:kaspa/core/utils/global_variables.dart';
import 'package:loader_overlay/loader_overlay.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/function.dart';
import '../../../../core/utils/styles.dart';
import '../../../home/presentation/bloc/bloc.dart';
import '../bloc/create_farmer/create_farmer_cubit.dart';
import '../bloc/create_farmer/create_farmer_state.dart';
import '../contract/register_farmer.dart';

class RegisterFarmerView extends StatelessWidget
    implements RegisterFarmerViewContract {
  const RegisterFarmerView({super.key, required this.controller});

  final RegisterFarmerControllerContract controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      body: BlocListener<CreateFarmerCubit, CreateFarmerState>(
        listener: (stateContext, state) {
          if (state is CreateFarmerLoading) {
            context.loaderOverlay.show();
          }
          if (state is CreateFarmerFailure) {
            context.loaderOverlay.hide();
            Text('Failed');
          }
          if (state is CreateFarmerSuccess) {
            context.loaderOverlay.hide();
            controller.clearScreen();
            Text('Success');
          }
        },
        child: _body(context),
      ),
    );
  }

  Widget _body(context) {
    var bottom = MediaQuery.of(context).viewInsets.bottom;
    bottom = max(min(bottom, 80), 0);
    return SafeArea(
      child: Container(
        decoration: Styles.colorComboDecoration(),
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: AppColors.primaryBackground,
            ),
            Positioned.fill(
              child: Column(
                children: [
                  Utils.customAppBar(context, 'register_farmer')
                  ],
              ),
            ),
            Positioned.fill(
              top: 54,
              child: Stepper(
                clipBehavior: Clip.antiAlias,
                type: StepperType.horizontal,
                controlsBuilder: (context, index) {
                  return const SizedBox();
                },
                physics: const ScrollPhysics(),
                onStepTapped: (index) {},
                currentStep: 0,
                elevation: 0,
                steps: [
                Step(
                    title: ''.toText(),
                    content: Form(
                      key: controller.formKey1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          'name'.toText(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                          Padding(
                            padding: REdgeInsets.only(top: 5.0),
                            child: TextFormField(
                              controller: controller.firstNameController,
                              style: Styles.x14dp_4A4A4A(14.0.sp),
                              maxLines: 1,
                              validator: ValidationBuilder().required().build(),
                              keyboardType: TextInputType.name,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              textInputAction: TextInputAction.next,
                              decoration:
                                  Styles.textFormFieldDecorationBorderWithBackground(
                                    'Muhammad',
                                    '',
                                    check: false,
                                  ),
                              onChanged: (value) {},
                            ),
                          ),
                          16.verticalSpace,
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    'age'.toText(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    Padding(
                                      padding: REdgeInsets.only(top: 5.0),
                                      child: TextFormField(
                                        controller:
                                            controller.ageController,
                                        style: Styles.x14dp_4A4A4A(14.0.sp),
                                        maxLines: 1,
                                        validator:
                                            ValidationBuilder()
                                                .required()
                                                .build(),
                                        keyboardType: TextInputType.number,
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        textInputAction: TextInputAction.next,
                                        decoration:
                                            Styles.textFormFieldDecorationBorderWithBackground(
                                              '',
                                              '',
                                              check: false,
                                            ),
                                        onChanged: (value) {},
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              8.horizontalSpace,
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    'gender'.toText(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    Padding(
                                      padding: REdgeInsets.only(top: 5.0),
                                      child: DropdownButtonFormField<String>(
                                        validator:
                                            ValidationBuilder()
                                                .required()
                                                .build(),
                                        borderRadius: const BorderRadius.all(
                                          Radius.zero,
                                        ),
                                        value: controller.selectedGender,
                                        onChanged: (newValue) {
                                          controller.onSelectGender(newValue);
                                        },
                                        items:
                                            GlobalVariables().genderList.map((
                                              String value,
                                            ) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),
                                        style: Styles.x14dp_4A4A4A(14.0.sp),
                                        decoration:
                                            Styles.textFormFieldDecorationBorderWithBackground(
                                              'choose_an_option'.tr(),
                                              '',
                                            ),
                                       icon: 'arrowDown'.toSvg()
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          16.verticalSpace,
                          'phone_number'.toText(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  inputFormatters: [
                                    //  PhoneNumberFormatter(),
                                    FilteringTextInputFormatter.deny(
                                      RegExp(
                                        r'[!@#$%^&*()?":{}|<>;,_\[.\]\\\-+=/`~]',
                                      ),
                                    ),
                                  ],

                                  keyboardType: TextInputType.phone,
                                  decoration:
                                      Styles.textFormFieldDecorationBorderWithBackground(
                                        'Enter phone number',
                                        '',
                                        showPrefixIcon: true,
                                        check: false,
                                        prefixIconData: Container(
                                          width: 80.sp,
                                          padding: REdgeInsets.symmetric(
                                            vertical: 0,
                                          ),
                                          decoration: BoxDecoration(),
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                height: 30.sp,
                                                child: Center(
                                                  child: Row(
                                                    children: ['+234'.toText(translate: false)],
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: REdgeInsets.all(8.0),
                                                child: SizedBox(
                                                  height: 14.sp,
                                                  width: 14.sp,
                                                  child: 'arrowDown'.toSvg(),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),

                                  controller: controller.phoneNumberController,
                                  validator:
                                      ValidationBuilder()
                                          .required()
                                          .phone()
                                          .build(),
                                  // onChanged: (value) {
                                  //   //controller.validateAndSetPhoneNumber(value);
                                  // },
                                ),
                              ),
                            ],
                          ),

                          16.verticalSpace,
                          'NIN'.toText(
                            fontSize: 14,
                            translate: false,
                            fontWeight: FontWeight.w600,
                          ),
                          Padding(
                            padding: REdgeInsets.only(top: 5.0),
                            child: TextFormField(
                              controller: controller.ninController,
                              style: Styles.x14dp_4A4A4A(14.0.sp),
                              maxLines: 1,

                              validator: ValidationBuilder().required().build(),
                              keyboardType: TextInputType.number,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              textInputAction: TextInputAction.next,
                              decoration:
                                  Styles.textFormFieldDecorationBorderWithBackground(
                                    'Enter your national identification number',
                                    '',
                                    check: false,
                                  ),
                              onChanged: (value) {},
                            ),
                          ),
                          16.verticalSpace,
                          'address'.toText(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                          Padding(
                            padding: REdgeInsets.only(top: 5.0),
                            child: TextFormField(
                              controller: controller.addressController,
                              style: Styles.x14dp_4A4A4A(14.0.sp),
                              maxLines: 1,
                              validator: ValidationBuilder().required().build(),
                              keyboardType: TextInputType.name,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              textInputAction: TextInputAction.next,
                              decoration:
                                  Styles.textFormFieldDecorationBorderWithBackground(
                                    'enter_address'.tr(),
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
                                            child: (e.name!).toText(),
                                          );
                                        }).toList(),
                                    onChanged: (newValue) {
                                      controller.onSelectLga(newValue);
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
                                    onChanged: (newValue) {
                                      controller.onSelectWard(newValue);
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
                     Step(
                    title: ''.toText(),
                    content: Form(
                      key: controller.formKey2,
                      child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                             'nok_name'.toText(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                          Padding(
                            padding: REdgeInsets.only(top: 5.0),
                            child: TextFormField(
                              controller: controller.nokNameController,
                              style: Styles.x14dp_4A4A4A(14.0.sp),
                              maxLines: 1,
                              validator: ValidationBuilder().required().build(),
                              keyboardType: TextInputType.name,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              textInputAction: TextInputAction.next,
                              decoration:
                                  Styles.textFormFieldDecorationBorderWithBackground(
                                    'Muhammad',
                                    '',
                                    check: false,
                                  ),
                              onChanged: (value) {},
                            ),
                          ),
                        16.verticalSpace,
                                  'nok_phone_number'.toText(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  inputFormatters: [
                                    //  PhoneNumberFormatter(),
                                    FilteringTextInputFormatter.deny(
                                      RegExp(
                                        r'[!@#$%^&*()?":{}|<>;,_\[.\]\\\-+=/`~]',
                                      ),
                                    ),
                                  ],

                                  keyboardType: TextInputType.phone,
                                  decoration:
                                      Styles.textFormFieldDecorationBorderWithBackground(
                                        'Enter phone number',
                                        '',
                                        showPrefixIcon: true,
                                        check: false,
                                        prefixIconData: Container(
                                          width: 80.sp,
                                          padding: REdgeInsets.symmetric(
                                            vertical: 0,
                                          ),
                                          decoration: BoxDecoration(),
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                height: 30.sp,
                                                child: Center(
                                                  child: Row(
                                                    children: ['+234'.toText(translate: false)],
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: REdgeInsets.all(8.0),
                                                child: SizedBox(
                                                  height: 14.sp,
                                                  width: 14.sp,
                                                  child: 'arrowDown'.toSvg(),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),

                                  controller: controller.nokPhoneNumberController,
                                  validator:
                                      ValidationBuilder()
                                          .required()
                                          .phone()
                                          .build(),
                                  // onChanged: (value) {
                                  //   //controller.validateAndSetPhoneNumber(value);
                                  // },
                                ),
                              ),
                            ],
                          ),
   16.verticalSpace,
                              'nok_relationship'.toText(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    Padding(
                                      padding: REdgeInsets.only(top: 5.0),
                                      child: DropdownButtonFormField<String>(
                                        validator:
                                            ValidationBuilder()
                                                .required()
                                                .build(),
                                        borderRadius: const BorderRadius.all(
                                          Radius.zero,
                                        ),
                                        value: controller.selectedNokRelationship,
                                        onChanged: (newValue) {
                                          controller.onSelectNokRelationship(newValue);
                                        },
                                        items:
                                            GlobalVariables().nokRelationshipList.map((
                                              String value,
                                            ) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),
                                        style: Styles.x14dp_4A4A4A(14.0.sp),
                                        decoration:
                                            Styles.textFormFieldDecorationBorderWithBackground(
                                              'choose_an_option'.tr(),
                                              '',
                                            ),
                                        icon: 'arrowDown'.toSvg()
                                      ),
                                    ),
                                
                        ])),
                  ),
                 
                  Step(
                    title: ''.toText(),
                    content: Form(child: Column(children: [])),
                  ),
                  Step(
                    title: ''.toText(),
                    content: Form(child: Column(children: [])),
                  ),
                  Step(
                    title: ''.toText(),
                    content: Form(child: Column(children: [])),
                  ),
                ],
              ),
            ),
            Positioned.fill(bottom: 0, child: Column(children: [])),
          ],
        ),
      ),
    );
  }
}
