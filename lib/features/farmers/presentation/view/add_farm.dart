import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_validator/form_validator.dart';
import '../../../../../core/component/button.dart';
import '../../../../core/data/model/lga.dart';
import '../../../../core/data/model/ward.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/resources/vectors.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/function.dart';
import '../../../../core/utils/global_variables.dart';
import '../../../../core/utils/styles.dart';
import '../../../home/presentation/bloc/bloc.dart';
import '../../../home/presentation/bloc/farm/farm_cubit.dart';
import '../contract/add_farm.dart';
import '../widget/points.dart';

class AddFarmView extends StatelessWidget implements AddFarmViewContract {
  const AddFarmView({super.key, required this.controller});

  final AddFarmControllerContract controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      body: _body(context),
    );
  }

  Widget _body(context) {
    return Container(
      decoration: Styles.colorComboDecoration(context),
      child: SafeArea(
        child: Padding(
          padding: REdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: controller.formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Utils.customAppBar(
                    context,
                    '${controller.farmer.firstName} ${controller.farmer.lastName} / New Farm',
                    false,
                    () {},
                  ),
                  24.verticalSpace,
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
                      validator: ValidationBuilder(optional: true).build(),
                      keyboardType: TextInputType.name,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
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
                                  (w) => w.pk == controller.selectedWard?.pk,
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
                  'Ownership Type'.toText(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    translate: false,
                  ),

                  Padding(
                    padding: REdgeInsets.only(top: 5.0),
                    child: DropdownButtonFormField<String>(
                      validator: ValidationBuilder().required().build(),
                      borderRadius: const BorderRadius.all(Radius.zero),
                      value: controller.selectedOwnershipType,
                      onChanged: (newValue) {
                        controller.onSelectOwnershipType(newValue);
                      },
                      items:
                          GlobalVariables().ownershipTypeList.map((
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

                  16.verticalSpace,
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
                              padding: REdgeInsets.symmetric(vertical: 50.0),
                              child: CircularProgressIndicator(
                                color: AppColors.colorPrimary,
                              ),
                            ),
                          )
                          : InkWell(
                            onTap:
                                controller.isFetchingLocation
                                    ? null
                                    : () =>
                                        controller.onAddFarmLocation(context),
                            child: DottedBorder(
                              color: AppColors.primaryGreen,
                              radius: Radius.circular(8.r),
                              strokeWidth: 2,
                              borderType: BorderType.RRect,
                              dashPattern: const [10, 6],
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppColors.primaryGreen.withAlpha(
                                    (0.1 * 255).toInt(),
                                  ),
                                  borderRadius: BorderRadius.circular(8.r),
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
                            controller.currentFarmLocationCoordinates.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final coordinate =
                              controller.currentFarmLocationCoordinates[index];
                          return Padding(
                            padding: REdgeInsets.only(bottom: 8.0),
                            child: Points(
                              lat: coordinate.latitude!.toStringAsFixed(6),
                              long: coordinate.longitude!.toStringAsFixed(6),
                              delete: () {
                                controller.onDeleteFarmLocationCoordinates(
                                  index,
                                );
                              },
                              showIcon: true,
                              point: index + 1,
                            ),
                          );
                        },
                      ),
                  if (controller.currentFarmLocationCoordinates.isNotEmpty)
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
                                    : () =>
                                        controller.onAddFarmLocation(context),
                            child: DottedBorder(
                              color: AppColors.bgGreen,
                              radius: Radius.circular(10.r),
                              strokeWidth: 2,
                              dashPattern: const [8, 6],
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppColors.primaryGreen.withAlpha(
                                    (0.07 * 255).toInt(),
                                  ),
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                child: Padding(
                                  padding: REdgeInsets.symmetric(
                                    vertical: 10.0,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                  30.verticalSpace,
                  controller.currentFarmLocationCoordinates.length < 4
                      ? SizedBox.shrink()
                      : BlocListener<FarmCubit, FarmState>(
                        listener: (context, state) {
                          if (state is FarmLoading) {
                            Utils.showLoading(context);
                          } else if (state is FarmSuccess) {
                            Utils.hideLoading(context);

                            Utils.showToastSuccess(
                              context,
                              'Congratulations! The farm has been added successfully.',
                              'Go to Farm Location List',
                              () {
                                Navigator.of(
                                  context,
                                  rootNavigator: true,
                                ).pop();
                                Navigator.pop(context);
                              },
                            );
                          } else if (state is FarmFailure) {
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
                          label: 'Add Farm',
                          onPressed: () {
                            controller.addNewFarm(controller.farmer.folioId);
                          },
                        ),
                      ),
                  20.verticalSpace,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
