import 'dart:math';
import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_validator/form_validator.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../../core/utils/global_variables.dart';
import 'package:loader_overlay/loader_overlay.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/function.dart';
import '../../../../core/utils/styles.dart';
import '../../../home/presentation/bloc/bloc.dart';
import '../../../home/presentation/bloc/product/cubit.dart';
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
                children: [Utils.customAppBar(context, 'register_farmer')],
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
                onStepTapped: (index) {
                  controller.onStepTapped(index);
                },
                onStepContinue: () {
                  if (controller.formKey.currentState != null &&
                      controller.formKey.currentState!.validate()) {
                    controller.onStepTapped(controller.currentStep + 1);
                  }
                },
                onStepCancel: () {
                  controller.onStepTapped(controller.currentStep - 1);
                },
                currentStep: controller.currentStep,
                elevation: 0,
                steps: [
                  Step(
                    title: ''.toText(),
                    isActive: controller.currentStep >= 0,
                    stepStyle: StepStyle(
                      color:
                          controller.currentStep >= 0
                              ? AppColors.colorPrimary
                              : AppColors.ColorAccent,
                    ),

                    content: Form(
                      key: controller.formKey1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          'name'.toText(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                          // Padding(
                          //   padding: REdgeInsets.only(top: 5.0),
                          //   child: TextFormField(
                          //     controller: controller.firstNameController,
                          //     style: Styles.x14dp_4A4A4A(14.0.sp),
                          //     maxLines: 1,
                          //     validator: ValidationBuilder().required().build(),
                          //     keyboardType: TextInputType.name,
                          //     autovalidateMode:
                          //         AutovalidateMode.onUserInteraction,
                          //     textInputAction: TextInputAction.next,
                          //     decoration:
                          //         Styles.textFormFieldDecorationBorderWithBackground(
                          //           'Muhammad',
                          //           '',
                          //           check: false,
                          //         ),
                          //     onChanged: (value) {},
                          //   ),
                          // ),
                        controller.farmLocations.isEmpty? 
                              InkWell(
                                onTap: () {
                                   controller
                                                        .onAddFarmFarmLocation();
                                },
                                child: DottedBorder(
                                                            color: const Color(0xff1D925D),
                                                            radius: Radius.circular(8.r),
                                                            strokeWidth: 2,
                                                            dashPattern: const [10, 6],
                                                            child: Container(
                                decoration: BoxDecoration(
                                  color: AppColors.primaryGreen.withAlpha(
                                    (0.1 * 255).toInt(),
                                  ),
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                child: Padding(
                                  padding: REdgeInsets.symmetric(vertical: 25.0),
                                  child: Column(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/vectors/image.svg',
                                      ),
                                      Center(
                                        child: 'Add Farm'.toText(
                                          fontSize: 14,
                                          translate: false,
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.colorPrimary,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                                            ),
                                                          ),
                              )
                        :
                        
                          ListView.builder(
                            itemCount: controller.farmLocations.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(
                                      color: Color(0xffF5F6F7),
                                    ),
                                    child: Padding(
                                      padding: REdgeInsets.symmetric(
                                        horizontal: 12.0,
                                        vertical: 14.0,
                                      ),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                            'assets/vectors/addFarmer.svg',
                                            height: 36.w,
                                            width: 36.w,
                                            fit: BoxFit.scaleDown,
                                          ),
                                          SizedBox(width: 9.w),
                                          Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              'Farm Location Added'.toText(
                                                translate: false,
                                                fontSize: 14,
                                              ),
                                            ],
                                          ),
                                          const Spacer(),
                                          Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  controller
                                                      .removeCoordinatePoint(
                                                        index,
                                                      );
                                                },
                                                child: SvgPicture.asset(
                                                  'assets/images/cancel.svg',
                                                  height: 24.w,
                                                  width: 24.w,
                                                  fit: BoxFit.scaleDown,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10.h),
                                ],
                              );
                            },
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
                                        controller: controller.ageController,
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
                                        icon: 'arrowDown'.toSvg(),
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
                                                    children: [
                                                      '+234'.toText(
                                                        translate: false,
                                                      ),
                                                    ],
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
                                            child: (e.name!).toText(
                                              translate: false,
                                            ),
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
                                            child: (e.name!).toText(
                                              translate: false,
                                            ),
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
                          80.verticalSpace,
                        ],
                      ),
                    ),
                  ),
                  Step(
                    title: ''.toText(),
                    isActive: controller.currentStep >= 1,
                    stepStyle: StepStyle(
                      color:
                          controller.currentStep >= 1
                              ? AppColors.colorPrimary
                              : AppColors.ColorAccent,
                    ),
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
                                                    children: [
                                                      '+234'.toText(
                                                        translate: false,
                                                      ),
                                                    ],
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

                                  controller:
                                      controller.nokPhoneNumberController,
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
                              validator: ValidationBuilder().required().build(),
                              borderRadius: const BorderRadius.all(Radius.zero),
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
                              icon: 'arrowDown'.toSvg(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Step(
                    title: ''.toText(),
                    isActive: controller.currentStep >= 2,
                    stepStyle: StepStyle(
                      color:
                          controller.currentStep >= 2
                              ? AppColors.colorPrimary
                              : AppColors.ColorAccent,
                    ),
                    content: Form(
                      key: controller.formKey3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          'bank'.toText(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                          Padding(
                            padding: REdgeInsets.only(top: 5.0),
                            child: BlocBuilder<BankCubit, BankState>(
                              builder: (context, state) {
                                if (state is BankLoaded) {
                                  return DropdownButtonFormField(
                                    icon: 'arrowDown'.toSvg(height: 11.sp),
                                    style: Styles.x14dp_4A4A4A(14.0.sp),
                                    decoration:
                                        Styles.textFormFieldDecorationBorderWithBackground(
                                          ''.tr(),
                                          '',
                                        ),
                                    items:
                                        state.bankList.map((e) {
                                          return DropdownMenuItem(
                                            value: e,
                                            child: (e.name!).toText(
                                              translate: false,
                                              textOverflow:
                                                  TextOverflow.ellipsis,
                                            ),
                                          );
                                        }).toList(),
                                    value: controller.selectedBank,
                                    onChanged: (newValue) {
                                      controller.onSelectBank(newValue!);
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
                          'bank_verification_number'.toText(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                          Padding(
                            padding: REdgeInsets.only(top: 5.0),
                            child: TextFormField(
                              controller: controller.bvnController,
                              style: Styles.x14dp_4A4A4A(14.0.sp),
                              maxLines: 1,
                              validator: ValidationBuilder().required().build(),
                              keyboardType: TextInputType.name,
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
                          16.verticalSpace,
                          'account_number'.toText(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                          Padding(
                            padding: REdgeInsets.only(top: 5.0),
                            child: TextFormField(
                              controller: controller.accountNumberController,
                              style: Styles.x14dp_4A4A4A(14.0.sp),
                              maxLines: 1,
                              validator: ValidationBuilder().required().build(),
                              keyboardType: TextInputType.name,
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
                          16.verticalSpace,
                          'account_name'.toText(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                          Padding(
                            padding: REdgeInsets.only(top: 5.0),
                            child: TextFormField(
                              controller: controller.accountNameController,
                              style: Styles.x14dp_4A4A4A(14.0.sp),
                              maxLines: 1,
                              validator: ValidationBuilder().required().build(),
                              keyboardType: TextInputType.name,
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
                          16.verticalSpace,
                        ],
                      ),
                    ),
                  ),
                  Step(
                    title: ''.toText(),
                    isActive: controller.currentStep >= 3,
                    stepStyle: StepStyle(
                      color:
                          controller.currentStep >= 3
                              ? AppColors.colorPrimary
                              : AppColors.ColorAccent,
                    ),
                    content: Form(
                      key: controller.formKey4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          'farm_address'.toText(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                          Padding(
                            padding: REdgeInsets.only(top: 5.0),
                            child: TextFormField(
                              controller: controller.bvnController,
                              style: Styles.x14dp_4A4A4A(14.0.sp),
                              maxLines: 1,
                              validator: ValidationBuilder().required().build(),
                              keyboardType: TextInputType.name,
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
                          16.verticalSpace,
                          'livestock'.toText(
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
                                        state.productList
                                            .where(
                                              (product) =>
                                                  product.type == 'Livestock',
                                            )
                                            .map((e) {
                                              return DropdownMenuItem(
                                                value: e,
                                                child: (e.name ?? '').toText(
                                                  translate: false,
                                                ),
                                              );
                                            })
                                            .toList(),
                                    onChanged: (newValue) {
                                      controller.onSelectLivestock(newValue!);
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
                          'crop'.toText(
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
                                        state.productList
                                            .where(
                                              (product) =>
                                                  product.type == 'Crop',
                                            )
                                            .map((e) {
                                              return DropdownMenuItem(
                                                value: e,
                                                child: (e.name ?? '').toText(
                                                  translate: false,
                                                ),
                                              );
                                            })
                                            .toList(),
                                    onChanged: (newValue) {
                                      controller.onSelectCrops(newValue!);
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
                    isActive: controller.currentStep >= 4,
                    stepStyle: StepStyle(
                      color:
                          controller.currentStep >= 4
                              ? AppColors.colorPrimary
                              : AppColors.ColorAccent,
                    ),
                    content: Form(
                      key: controller.formKey5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DottedBorder(
                            color: const Color(0xff1D925D),
                            radius: Radius.circular(8.r),
                            strokeWidth: 2,
                            dashPattern: const [10, 6],
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.primaryGreen.withAlpha(
                                  (0.1 * 255).toInt(),
                                ),
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: Padding(
                                padding: REdgeInsets.symmetric(vertical: 25.0),
                                child: Column(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/vectors/image.svg',
                                    ),
                                    Center(
                                      child: 'add_farmer_profile_image'.toText(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.colorPrimary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned.fill(
              bottom: 0,
              child: Padding(
                padding: REdgeInsets.symmetric(horizontal: 22.0),
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          color: AppColors.primaryBackground,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 97.w,
                                height: 58.h,
                                child:
                                    controller.currentStep == 0
                                        ? null
                                        : MaterialButton(
                                          color: AppColors.xFFFFFF,
                                          onPressed: () {
                                            controller.back();
                                          },
                                          shape: RoundedRectangleBorder(
                                            side: const BorderSide(
                                              color: Color(0xff54565B),
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              6,
                                            ),
                                          ),
                                          child: 'back'.toText(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                              ),
                              SizedBox(
                                width: 97.w,
                                height: 58.h,
                                child:
                                //  controller.currentStep == 0
                                // &&
                                //         !(controller.image != null ||
                                //             (controller.farmer.photoUrl != null &&
                                //                 controller.farmer.photoUrl!
                                //                     .isNotEmpty))
                                //     ? null
                                //     :
                                MaterialButton(
                                  color: AppColors.colorPrimary,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  onPressed: () {
                                    controller.next(context);
                                  },
                                  child: 'next'.toText(
                                    fontSize: 14,
                                    color: AppColors.primaryBackground,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
