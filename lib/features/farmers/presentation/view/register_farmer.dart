import 'dart:math';
import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_validator/form_validator.dart';
import '../../../../core/component/button.dart';
import '../../../../core/data/model/model.dart';
import '../../../../core/data/model/product.dart';
import '../../../../core/resources/vectors.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../../core/utils/global_variables.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/function.dart';
import '../../../../core/utils/styles.dart';
import '../../../home/presentation/bloc/bloc.dart';
import '../../../home/presentation/bloc/product/cubit.dart';
import '../bloc/create_farmer/create_farmer_cubit.dart';
import '../bloc/create_farmer/create_farmer_state.dart';
import '../contract/register_farmer.dart';
import '../widget/points.dart';

class RegisterFarmerView extends StatelessWidget
    implements RegisterFarmerViewContract {
  const RegisterFarmerView({super.key, required this.controller});

  final RegisterFarmerControllerContract controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      appBar: Utils.customAppBar(context, 'register_farmer', false, () {}),
      body: BlocListener<CreateFarmerCubit, CreateFarmerState>(
        listener: (context, state) {
          if (state is CreateFarmerLoading) {
            Utils.showLoading(context);
          } else if (state is CreateFarmerSuccess) {
            Utils.hideLoading(context);
            controller.clearScreen();
            Utils.showToastSuccess(
              context,
              'farmer_registered_successfully'.tr(),
              "Go to Farmer's List",
              () {
                Navigator.of(context, rootNavigator: true).pop();
                Navigator.pop(context);
              },
            );
          } else if (state is CreateFarmerFailure) {
            Utils.hideLoading(context);
            Utils.showToastError(context, state.error.toString(), '', () {});
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
                Padding(
                  padding:REdgeInsets.symmetric(horizontal: 16.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        (GlobalVariables()
                                .farmerInformation[controller.currentStep]
                                .tr())
                            .toText(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          Positioned.fill(
            top: 45,
            child: Theme(
              data: Theme.of(
                context,
              ).copyWith(canvasColor: AppColors.primaryBackground),
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
                    title: ''.toText(translate: false),
                    // label: "Farmer’s Personal Information".toText(translate: false),
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
                          'first_name'.toText(
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
                          'last_name'.toText(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                          Padding(
                            padding: REdgeInsets.only(top: 5.0),
                            child: TextFormField(
                              controller: controller.lastNameController,
                              style: Styles.x14dp_4A4A4A(14.0.sp),
                              maxLines: 1,
                              validator: ValidationBuilder().required().build(),
                              keyboardType: TextInputType.name,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              textInputAction: TextInputAction.next,
                              decoration:
                                  Styles.textFormFieldDecorationBorderWithBackground(
                                    'Ojo',
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
                                          .maxLength(11)
                                          .minLength(10)
                                          .build(),
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
                              validator:
                                  ValidationBuilder()
                                      .maxLength(11)
                                      .minLength(11)
                                      .build(),
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
                          BlocBuilder<LgaCubit, LgaState>(
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
                                          Styles
                                              .normalWeightGreyNormalSizeTextStyle,

                                      hintText: "search_lga".tr(),
                                      hintStyle:
                                          Styles
                                              .normalWeightGreyNormalSizeTextStyle,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          8.r,
                                        ),
                                      ),
                                    ),
                                  ),
                                  itemBuilder:
                                      (
                                        context,
                                        lgaItem,
                                        isDisabled,
                                        isSelected,
                                      ) => ListTile(
                                        title: (lgaItem.name ?? '').toText(
                                          translate: false,
                                        ),

                                        selected: isSelected,
                                      ),

                                  emptyBuilder:
                                      (context, searchEntry) => Center(
                                        child: 'no_lga_found'.toText(),
                                      ),
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
                                List<Ward> filteredWards = [];
                                String hintText = 'choose_an_option'.tr();
                                bool isDisabled = false;
                                if (state is WardLoaded) {
                                  if (controller.selectedLga == null) {
                                    hintText = 'select_lga_first'.tr();
                                    isDisabled = true;
                                  } else {
                                    filteredWards =
                                        state.dataList
                                            .where(
                                              (ward) =>
                                                  ward.lga?.id ==
                                                  controller.selectedLga!.pk,
                                            )
                                            .toList();
                                    if (filteredWards.isEmpty) {
                                      hintText = 'no_wards_available'.tr();
                                      isDisabled = true;
                                    }
                                  }
                                } else if (state is WardLoading) {
                                  hintText = 'loading_wards'.tr();
                                  isDisabled = true;
                                } else {
                                  // WardFailure or initial state
                                  hintText = 'wards_not_loaded'.tr();
                                  isDisabled = true;
                                }
                                final Ward? currentSelectedWard =
                                    filteredWards.any(
                                          (w) =>
                                              w.pk ==
                                              controller.selectedWard?.pk,
                                        )
                                        ? controller.selectedWard
                                        : null;

                                return DropdownButtonFormField<Ward>(
                                  icon: 'arrowDown'.toSvg(),
                                  style: Styles.x14dp_4A4A4A(14.0.sp),
                                  decoration:
                                      Styles.textFormFieldDecorationBorderWithBackground(
                                        hintText,
                                        '',
                                      ),
                                  items:
                                      filteredWards.map((e) {
                                        return DropdownMenuItem<Ward>(
                                          value: e,
                                          child: (e.name ?? '').toText(
                                            translate: false,
                                          ),
                                        );
                                      }).toList(),
                                  value: currentSelectedWard,
                                  onChanged:
                                      isDisabled
                                          ? null
                                          : (Ward? newValue) {
                                            controller.onSelectWard(newValue);
                                          },
                                );
                              },
                            ),
                          ),
                          16.verticalSpace,
                          'cooperative'.toText(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),

                          Padding(
                            padding: REdgeInsets.only(top: 5.0),
                            child: BlocBuilder<
                              CooperativeCubit,
                              CooperativeState
                            >(
                              builder: (context, state) {
                                List<Cooperative> cooperatives = [];
                                if (state is CooperativeLoaded) {
                                  cooperatives = state.cooperativeList;
                                }
                                return DropdownSearch<Cooperative>(
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
                                            Styles
                                                .normalWeightGreyNormalSizeTextStyle,

                                        hintText: "search_cooperative".tr(),
                                        hintStyle:
                                            Styles
                                                .normalWeightGreyNormalSizeTextStyle,
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            8.r,
                                          ),
                                        ),
                                      ),
                                    ),
                                    itemBuilder:
                                        (
                                          context,
                                          cooperativeItem,
                                          isDisabled,
                                          isSelected,
                                        ) => ListTile(
                                          title:
                                              ('${cooperativeItem.name ?? ''} ${cooperativeItem.code ?? ''}')
                                                  .toText(translate: false),

                                          selected: isSelected,
                                        ),

                                    emptyBuilder:
                                        (context, searchEntry) => Center(
                                          child:
                                              'no_cooperative_found'.toText(),
                                        ),
                                  ),

                                  items: (filter, infiniteScrollProps) async {
                                    if (filter.isEmpty) {
                                      return cooperatives;
                                    }
                                    return cooperatives.where((cooperative) {
                                      final filterLower = filter.toLowerCase();
                                      return (cooperative.code
                                                  ?.toLowerCase()
                                                  .contains(filterLower) ??
                                              false) ||
                                          (cooperative.name
                                                  ?.toLowerCase()
                                                  .contains(filterLower) ??
                                              false);
                                    }).toList();
                                  },
                                  itemAsString:
                                      (Cooperative? cooperative) =>
                                          '${cooperative?.name ?? ''} ${cooperative?.code ?? ''}',
                                  compareFn: (
                                    Cooperative? item1,
                                    Cooperative? item2,
                                  ) {
                                    return item1?.pk == item2?.pk;
                                  },
                                  selectedItem: controller.selectedCooperative,
                                  onChanged: (Cooperative? newValue) {
                                    if (newValue != null) {
                                      controller.onSelectCooperative(newValue);
                                    }
                                  },
                                  // validator: (Cooperative? value) {
                                  //   if (value == null) {
                                  //     return 'Please select a cooperative.';
                                  //   }
                                  //   if (value.code == null ||
                                  //       value.code!.isEmpty) {
                                  //     return 'Selected cooperative has no code. Please select another or update its data.';
                                  //   }
                                  //   return null;
                                  // },
                                  decoratorProps: DropDownDecoratorProps(
                                    decoration:
                                        Styles.textFormFieldDecorationBorderWithBackground(
                                          'Select a cooperative',
                                          '',
                                        ),
                                  ),
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
                    title: ''.toText(translate: false),
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
                                          .maxLength(11)
                                          .minLength(10)
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
                              validator: ValidationBuilder().build(),
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
                    title: ''.toText(translate: false),
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
                              validator:
                                  ValidationBuilder(optional: true).build(),
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
                              validator:
                                  ValidationBuilder(optional: true).build(),
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
                              validator:
                                  ValidationBuilder(optional: true).build(),
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
                    title: ''.toText(translate: false),
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
                              controller: controller.farmAddressController,
                              style: Styles.x14dp_4A4A4A(14.0.sp),
                              maxLines: 1,
                              validator:
                                  ValidationBuilder(optional: true).build(),
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

                            fontWeight: FontWeight.w600,
                          ),
                          Padding(
                            padding: REdgeInsets.only(top: 5.0),
                            child: BlocBuilder<ProductCubit, ProductState>(
                              builder: (context, productState) {
                                if (productState is ProductLoaded) {
                                  return _buildLivestockSelector(
                                    context,
                                    productState,
                                  );
                                }
                                return Container(
                                  width: double.infinity,
                                  padding: REdgeInsets.symmetric(
                                    horizontal: 12.0,
                                    vertical: 16.0,
                                  ),

                                  child: Text(
                                    productState is ProductLoading
                                        ? 'loading_livestocks'.tr()
                                        : 'livestocks_not_available'.tr(),
                                    style: Styles.x14dp_4A4A4A(
                                      14.0.sp,
                                    ).copyWith(
                                      color: AppColors.accentText.withAlpha(
                                        (0.7 * 255).toInt(),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          16.verticalSpace,
                          'crop'.toText(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                          Padding(
                            padding: REdgeInsets.only(top: 5.0),
                            child: BlocBuilder<ProductCubit, ProductState>(
                              builder: (context, productState) {
                                if (productState is ProductLoaded) {
                                  return _buildCropSelector(
                                    context,
                                    productState,
                                  );
                                }
                                return Container(
                                  width: double.infinity,
                                  padding: REdgeInsets.symmetric(
                                    horizontal: 12.0,
                                    vertical: 16.0,
                                  ),

                                  child: Text(
                                    productState is ProductLoading
                                        ? 'loading_crops'.tr()
                                        : 'crops_not_available'.tr(),
                                    style: Styles.x14dp_4A4A4A(
                                      14.0.sp,
                                    ).copyWith(
                                      color: AppColors.accentText.withAlpha(
                                        (0.7 * 255).toInt(),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),

                          20.verticalSpace,
                        ],
                      ),
                    ),
                  ),
                  Step(
                    title: ''.toText(translate: false),
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
                          Row(
                            children: [
                              'Farm'.toText(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                translate: false,
                              ),
                              const Spacer(),
                              SvgPicture.asset(AppIcon.help),
                              4.horizontalSpace,
                              'Help'.toText(
                                fontSize: 14,
                                translate: false,
                                fontWeight: FontWeight.w700,
                                color: AppColors.primaryGreen,
                              ),
                            ],
                          ),
                          5.verticalSpace,
                          controller.currentFarmLocationCoordinates.isEmpty
                              ? controller.isFetchingLocation
                                  ? Center(
                                    child: Padding(
                                      padding: REdgeInsets.symmetric(
                                        vertical: 50.0,
                                      ),
                                      child: CircularProgressIndicator(
                                        color: AppColors.colorPrimary,
                                      ),
                                    ),
                                  )
                                  : InkWell(
                                    onTap:
                                        controller.isFetchingLocation
                                            ? null
                                            : () => controller
                                                .onAddFarmLocation(context),
                                    child: DottedBorder(
                                      color: AppColors.primaryGreen,
                                      radius: Radius.circular(8.r),
                                       borderType: BorderType.RRect,
                                      strokeWidth: 2,
                                      dashPattern: const [10, 6],
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: AppColors.primaryGreen
                                              .withAlpha((0.1 * 255).toInt()),
                                          borderRadius: BorderRadius.circular(
                                            8.r,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: REdgeInsets.symmetric(
                                            vertical: 20.0,
                                          ),
                                          child: Column(
                                            children: [
                                              SvgPicture.asset(
                                                'assets/vectors/location.svg',
                                                height: 50.sp,
                                                width: 50.sp,
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
                              : ListView.builder(
                                itemCount:
                                    controller
                                        .currentFarmLocationCoordinates
                                        .length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  final coordinate =
                                      controller
                                          .currentFarmLocationCoordinates[index];
                                  return Points(
                                    lat: coordinate.latitude!.toStringAsFixed(
                                      6,
                                    ),
                                    long: coordinate.longitude!.toStringAsFixed(
                                      6,
                                    ),
                                    delete: () {
                                      controller
                                          .onDeleteFarmLocationCoordinates(
                                            index,
                                          );
                                    },
                                    showIcon: true,
                                    point: index + 1,
                                  );
                                },
                              ),
                          if (controller
                              .currentFarmLocationCoordinates
                              .isNotEmpty)
                            controller.isFetchingLocation 
                                ? Center(
                                  child: Padding(
                                    padding: REdgeInsets.all(8.0),
                                    child: SizedBox(
                                      width: 24.sp,
                                      height: 24.sp,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2.0,
                                        color: AppColors.colorPrimary,
                                      ),
                                    ),
                                  ),
                                )
                                : Padding(
                                  padding: REdgeInsets.only(top: 8.0),
                                  child: InkWell(
                                    onTap:
                                        controller.isFetchingLocation
                                            ? null
                                            : () => controller
                                                .onAddFarmLocation(context),
                                    child: DottedBorder(
                                      color: AppColors.bgGreen,
                                      radius: Radius.circular(10.r),
                                      strokeWidth: 2,
                                      dashPattern: const [8, 6],
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: AppColors.primaryGreen
                                              .withAlpha((0.07 * 255).toInt()),
                                          borderRadius: BorderRadius.circular(
                                            8.r,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: REdgeInsets.symmetric(
                                            vertical: 10.0,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.add,
                                                color: AppColors.colorPrimary,
                                              ),
                                              5.horizontalSpace,
                                              'Add Point'.toText(
                                                fontSize: 12,
                                                translate: false,
                                                fontWeight: FontWeight.w700,
                                                color: AppColors.colorPrimary,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                          20.verticalSpace,
                        ],
                      ),
                    ),
                  ),

                  Step(
                    title: ''.toText(translate: false),
                    isActive: controller.currentStep >= 5,
                    stepStyle: StepStyle(
                      color:
                          controller.currentStep >= 5
                              ? AppColors.colorPrimary
                              : AppColors.ColorAccent,
                    ),
                    content: Form(
                      key: controller.formKey6,
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              controller.onSelectImages(
                                controller.imageController,
                              );
                            },
                            child:
                                controller.image != null
                                    ? Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            12.r,
                                          ),
                                          child: Image.file(
                                            controller.image!,
                                            width: 170.w,
                                            height: 200.h,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        10.verticalSpace,
                                        Container(
                                          decoration: BoxDecoration(),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SvgPicture.asset(AppIcon.edit),
                                              5.horizontalSpace,
                                              'Change Image'.toText(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                translate: false,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                    : DottedBorder(
                                      color: AppColors.primaryGreen,
                                      radius: Radius.circular(8.r),
                                      strokeWidth: 2,
                                      borderType: BorderType.RRect,
                                      dashPattern: const [10, 6],
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: AppColors.primaryGreen
                                              .withAlpha((0.1 * 255).toInt()),
                                          borderRadius: BorderRadius.circular(
                                            8.r,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: REdgeInsets.symmetric(
                                            vertical: 25.0,
                                          ),
                                          child: Column(
                                            children: [
                                              SvgPicture.asset(
                                                'assets/vectors/image.svg',
                                              ),
                                              Center(
                                                child:
                                                    'add_farmer_profile_image'
                                                        .toText(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color:
                                                              AppColors
                                                                  .colorPrimary,
                                                        ),
                                              ),
                                            ],
                                          ),
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
                              width: 150.sp,
                              height: 58.sp,
                              child:
                                  controller.currentStep == 0
                                      ? SizedBox.shrink()
                                      : ButtonWidget(
                                        label: 'previous',
                                        bgColor: AppColors.primaryBackground,
                                        textColor: AppColors.accentElement,
                                        onPressed: () => controller.back(),
                                      ),
                            ),
                            SizedBox(
                              width: 150.sp,
                              height: 58.sp,
                              child: ButtonWidget(
                                label:
                                    controller.currentStep == 5
                                        ? 'Submit'
                                        : 'Next',
                                onPressed: () => controller.next(context),
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
    );
  }

  Widget _buildCropSelector(BuildContext context, ProductLoaded productState) {
    final availableCrops =
        productState.productList.where((p) => p.type == 'Crop').toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: REdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          decoration: BoxDecoration(
            color: AppColors.lightGrey,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: AppColors.bgGreen, width: 1.0),
          ),

          child:
              controller.selectedCropsList.isEmpty
                  ? Padding(
                    padding: REdgeInsets.symmetric(vertical: 8.0),
                    child: 'choose_an_option'.toText(
                      color: AppColors.accentText.withAlpha(
                        (0.7 * 255).toInt(),
                      ),
                    ),
                  )
                  : Wrap(
                    spacing: 6.0,
                    runSpacing: 6.0,
                    children:
                        controller.selectedCropsList.map((crop) {
                          return Chip(
                            label: Text(
                              crop.name ?? 'Unknown Crop',
                              style: TextStyle(fontSize: 12.sp),
                            ),
                            onDeleted: () {
                              final newList = List<Product>.from(
                                controller.selectedCropsList,
                              );
                              newList.removeWhere((c) => c.pk == crop.pk);
                              controller.updateSelectedCrops(newList);
                            },
                            deleteIconColor: AppColors.colorPrimary,
                            backgroundColor: AppColors.primaryGreen.withAlpha(
                              (0.1 * 255).toInt(),
                            ),
                            padding: REdgeInsets.all(4.0),
                          );
                        }).toList(),
                  ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {
              _showMultiSelectCropDialog(
                context,
                availableCrops,
                controller.selectedCropsList,
                (newSelection) {
                  controller.updateSelectedCrops(newSelection);
                },
              );
            },
            child: (controller.selectedCropsList.isEmpty
                    ? 'select_crops'.tr()
                    : 'edit_selection'.tr())
                .toText(
                  fontWeight: FontWeight.w500,
                  color: AppColors.colorPrimary,
                ),
          ),
        ),
      ],
    );
  }

  Widget _buildLivestockSelector(
    BuildContext context,
    ProductLoaded productState,
  ) {
    final availableLivestocks =
        productState.productList.where((p) => p.type == 'Livestock').toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: REdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          decoration: BoxDecoration(
            color: AppColors.lightGrey,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: AppColors.bgGreen, width: 1.0),
          ),

          child:
              controller.selectedLivestocksList.isEmpty
                  ? Padding(
                    padding: REdgeInsets.symmetric(vertical: 8.0),
                    child: 'choose_an_option'.toText(
                      color: AppColors.accentText.withAlpha(
                        (0.7 * 255).toInt(),
                      ),
                    ),
                  )
                  : Wrap(
                    spacing: 6.0,
                    runSpacing: 6.0,
                    children:
                        controller.selectedLivestocksList.map((livestock) {
                          return Chip(
                            label: Text(
                              livestock.name ?? 'Unknown Crop',
                              style: TextStyle(fontSize: 12.sp),
                            ),
                            onDeleted: () {
                              final newList = List<Product>.from(
                                controller.selectedLivestocksList,
                              );
                              newList.removeWhere((c) => c.pk == livestock.pk);
                              controller.updateSelectedLivestocks(newList);
                            },
                            deleteIconColor: AppColors.colorPrimary,
                            backgroundColor: AppColors.primaryGreen.withAlpha(
                              (0.1 * 255).toInt(),
                            ),
                            padding: REdgeInsets.all(4.0),
                          );
                        }).toList(),
                  ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {
              _showMultiSelectLivestockDialog(
                context,
                availableLivestocks,
                controller.selectedLivestocksList,
                (newSelection) {
                  controller.updateSelectedLivestocks(newSelection);
                },
              );
            },
            child: (controller.selectedLivestocksList.isEmpty
                    ? 'select_livestocks'.tr()
                    : 'edit_selection'.tr())
                .toText(
                  fontWeight: FontWeight.w500,
                  color: AppColors.colorPrimary,
                ),
          ),
        ),
      ],
    );
  }

  void _showMultiSelectCropDialog(
    BuildContext context,
    List<Product> allCrops,
    List<Product> initiallySelectedCrops,
    Function(List<Product>) onSelectionConfirmed,
  ) {
    List<Product> tempSelectedCrops = List<Product>.from(
      initiallySelectedCrops,
    );

    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setStateDialog) {
            return AlertDialog(
              title: 'select_crops'.toText(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              content: SizedBox(
                width: double.maxFinite,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: allCrops.length,
                  itemBuilder: (BuildContext context, int index) {
                    final crop = allCrops[index];
                    final bool isSelected = tempSelectedCrops.any(
                      (selected) => selected.pk == crop.pk,
                    );
                    return CheckboxListTile(
                      title: (crop.name ?? 'Unknown Crop').toText(
                        translate: false,
                      ),
                      activeColor: AppColors.primaryGreen,
                      value: isSelected,
                      onChanged: (bool? value) {
                        setStateDialog(() {
                          if (value == true) {
                            if (!isSelected) tempSelectedCrops.add(crop);
                          } else {
                            tempSelectedCrops.removeWhere(
                              (selected) => selected.pk == crop.pk,
                            );
                          }
                        });
                      },
                    );
                  },
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: 'cancel'.toText(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),

                  onPressed: () => Navigator.of(dialogContext).pop(),
                ),
                TextButton(
                  child: 'done'.toText(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),

                  onPressed: () {
                    onSelectionConfirmed(tempSelectedCrops);
                    Navigator.of(dialogContext).pop();
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _showMultiSelectLivestockDialog(
    BuildContext context,
    List<Product> allLivestocks,
    List<Product> initiallySelectedLivestocks,
    Function(List<Product>) onSelectionConfirmed,
  ) {
    List<Product> tempSelectedLivestocks = List<Product>.from(
      initiallySelectedLivestocks,
    );

    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setStateDialog) {
            return AlertDialog(
              title: 'select_livestocks'.toText(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              content: SizedBox(
                width: double.maxFinite,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: allLivestocks.length,
                  itemBuilder: (BuildContext context, int index) {
                    final livestock = allLivestocks[index];
                    final bool isSelected = tempSelectedLivestocks.any(
                      (selected) => selected.pk == livestock.pk,
                    );
                    return CheckboxListTile(
                      title: (livestock.name ?? 'Unknown Livestock').toText(
                        translate: false,
                      ),
                      activeColor: AppColors.primaryGreen,
                      value: isSelected,
                      onChanged: (bool? value) {
                        setStateDialog(() {
                          if (value == true) {
                            if (!isSelected) {
                              tempSelectedLivestocks.add(livestock);
                            }
                          } else {
                            tempSelectedLivestocks.removeWhere(
                              (selected) => selected.pk == livestock.pk,
                            );
                          }
                        });
                      },
                    );
                  },
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: 'cancel'.toText(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),

                  onPressed: () => Navigator.of(dialogContext).pop(),
                ),
                TextButton(
                  child: 'done'.toText(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),

                  onPressed: () {
                    onSelectionConfirmed(tempSelectedLivestocks);
                    Navigator.of(dialogContext).pop();
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }
}
