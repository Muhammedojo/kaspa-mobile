import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_validator/form_validator.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/data/model/lga.dart';
import '../../../../core/data/model/ward.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/component/button.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/function.dart';
import '../../../../core/utils/global_variables.dart';
import '../../../../core/utils/styles.dart';
import '../../../home/presentation/bloc/bloc.dart';
import '../../../home/presentation/bloc/incident_report/incident_report_cubit.dart';
import '../contract/report_incident.dart';

class ReportIncidentView extends StatelessWidget
    implements ReportIncidentViewContract {
  const ReportIncidentView({super.key, required this.controller});

  final ReportIncidentControllerContract controller;

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
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Utils.customAppBar(
                    context,
                    'report_an_incident',
                    false,
                    () {},
                  ),
                  16.verticalSpace,
                  'title'.toText(fontSize: 14, fontWeight: FontWeight.w600),
                  Padding(
                    padding: REdgeInsets.only(top: 5.0),
                    child: TextFormField(
                      controller: controller.titleController,
                      style: Styles.x14dp_4A4A4A(14.0.sp),
                      maxLines: 1,
                      validator: ValidationBuilder().required().build(),
                      keyboardType: TextInputType.name,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      textInputAction: TextInputAction.next,
                      decoration:
                          Styles.textFormFieldDecorationBorderWithBackground(
                            'Kindly enter a short title for the incident',
                            '',
                            check: false,
                          ),
                      onChanged: (value) {},
                    ),
                  ),
16.verticalSpace,
  'category'.toText(fontSize: 14, fontWeight: FontWeight.w600),
                 
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
                                        value: controller.selectedCategory,
                                        onChanged: (newValue) {
                                          controller.onSelectCategory(newValue);
                                        },
                                        items:
                                            GlobalVariables().categoryList.map((
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
                              // icon: 'arrowDown'.toSvg(),
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
                                'Choose LGA',
                                '',
                              ),
                        ),
                      );
                    },
                  ),

                  16.verticalSpace,
                  'ward'.toText(
                    fontSize: 14,
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
                  'brief_description'.toText(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  Padding(
                    padding: REdgeInsets.only(top: 5.0),
                    child: TextFormField(
                      controller: controller.descriptionController,
                      style: Styles.x14dp_4A4A4A(14.0.sp),
                      maxLines: 3,
                      validator: ValidationBuilder().required().build(),
                      keyboardType: TextInputType.name,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      textInputAction: TextInputAction.next,
                      decoration:
                          Styles.textFormFieldDecorationBorderWithBackground(
                            'Kindly describe the incident briefly (what happened, when, and any key details)',
                            '',
                            check: false,
                          ),
                      onChanged: (value) {},
                    ),
                  ),
                  16.verticalSpace,

                  'Add a photo'.toText(
                    fontSize: 14,
                    translate: false,
                    fontWeight: FontWeight.w600,
                  ),
                  controller.imageFileList.isEmpty
                      ? const SizedBox.shrink()
                      : GridView.builder(
                        itemCount: controller.imageFileList.length,
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                            ),
                        itemBuilder: (BuildContext context, int index) {
                          return Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.r),
                                ),
                                child: Image.file(
                                  controller.imageFileList[index],
                                  width: 160.w,
                                  height: 160.h,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                top: 0.0.sp,
                                right: 0.0.sp,
                                child: GestureDetector(
                                  onTap: () {
                                    controller.removeImage(index);
                                  },
                                  child: Icon(
                                    Icons.cancel,
                                    color: Colors.black,
                                    size: 24.0.sp,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                  10.verticalSpace,
                  InkWell(
                    onTap: () {
                      controller.getImage(ImageSource.camera);
                    },
                    child: DottedBorder(
                      color: AppColors.primaryGreen,
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
                          padding: REdgeInsets.symmetric(vertical: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/vectors/document.svg',
                                height: 50.sp,
                                width: 50.sp,
                              ),
                              Padding(
                                padding: REdgeInsets.symmetric(
                                  horizontal: 12.0,
                                  vertical: 8,
                                ),
                                child: RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    style: DefaultTextStyle.of(context).style,
                                    children: <TextSpan>[
                                      TextSpan(
                                        text:
                                            'Upload any document(s) or image(s) related to the incident.!',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'Nunito',
                                          color: AppColors.colorPrimary,
                                          fontWeight: FontWeight.w700,
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
                  ),

                  30.verticalSpace,
                  BlocListener<IncidentCubit, IncidentState>(
                    listener: (context, state) {
                      if (state is IncidentLoading) {
                        Utils.showLoading(context);
                      } else if (state is ReportIncidentSuccess) {
                        Utils.hideLoading(context);
                        controller.clearScreen();
                        Utils.showToastSuccess(
                          context,
                          'incident_reported_successfully'.tr(),
                          'Go to Report List',
                          () {
                            Navigator.of(context, rootNavigator: true).pop();
                            Navigator.pop(context);
                          },
                        );
                      } else if (state is IncidentFailure) {
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
                      label: 'submit',
                      onPressed: () => controller.reportIncident(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
