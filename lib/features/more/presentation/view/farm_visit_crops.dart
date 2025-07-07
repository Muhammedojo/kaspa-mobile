import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_validator/form_validator.dart';
import '../../../../core/component/button.dart';
import '../../../../core/component/card_container_widget.dart';
import '../../../../core/component/empty_list_widget.dart';
import '../../../../core/navigation/navigator.dart';
import '../../../../core/resources/vectors.dart';
import '../../../../core/utils/function.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/styles.dart';
import '../../../home/presentation/bloc/farm_visit/farm_visit_cubit.dart';
import '../../../home/presentation/bloc/product/cubit.dart';
import '../contract/farm_visit_crops.dart';
import '../controller/crop_activities.dart';

class FarmVisitCropsView extends StatelessWidget
    implements FarmVisitCropsViewContract {
  const FarmVisitCropsView({super.key, required this.controller});

  final FarmVisitCropsControllerContract controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.primaryGreen,
        heroTag: "new_crop",
        onPressed: () {
          addNewCropModal(context);
        },
        label: Row(
          children: [
            Icon(Icons.add, color: AppColors.primaryBackground),
            5.horizontalSpace,
            'Add new crop'.toText(
              translate: false,
              fontWeight: FontWeight.w700,
              color: AppColors.primaryBackground,
              fontSize: 14,
            ),
          ],
        ),
      ),
      body: _body(context),
    );
  }

  Widget _body(context) {
    return Container(
      decoration: Styles.colorComboDecoration(),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Utils.customAppBar(context, 'farm_visit', false, () {}),
            20.verticalSpace,
            Expanded(
              child: Padding(
                padding: REdgeInsets.symmetric(horizontal: 12.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 24.r,
                            backgroundColor: AppColors.accentText,
                            child: Icon(
                              Icons.person,
                              size: 24.r,
                              color: AppColors.ColorAccent,
                            ),
                          ),
                          12.horizontalSpace,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                (controller.visit.farmerName ?? 'N/A').toText(
                                  translate: false,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                                (controller.visit.folioId ?? 'N/A').toText(
                                  translate: false,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                                '${controller.visit.address}'.toText(
                                  translate: false,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      16.verticalSpace,
                      'List of crops cultivated on this plot'.toText(
                        translate: false,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                      12.verticalSpace,
                      if (controller.visit.farmCrops.isEmpty)
                        ErrorWidgets(
                          title: "Oops",
                          message: 'No Crop Cultivated',
                        )
                      else
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:
                              controller.visit.farmCrops
                                  .map(
                                    (farmCrop) => InkWell(
                                      onTap:
                                          () => pushTo(
                                            CropActivitiesScreen(
                                              farmCrop: farmCrop,
                                            ),
                                            context,
                                          ),
                                      child: Padding(
                                        padding: REdgeInsets.only(bottom: 12.0),
                                        child: CardContainerWidget(
                                          decoration: BoxDecoration(
                                            color: Color(0xffF8F8F8),
                                            borderRadius: BorderRadius.circular(
                                              8.r,
                                            ),
                                            border: BoxBorder.all(
                                              color: Color(0xffC8C8C8),
                                              width: 0.5,
                                            ),
                                          ),
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      (farmCrop
                                                                  .crop
                                                                  ?.product
                                                                  ?.name ??
                                                              'N/A')
                                                          .toText(
                                                            translate: false,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                          ),
                                                      '${farmCrop.noOfHectares ?? 0} ha'
                                                          .toText(
                                                            translate: false,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                      'No pending farm activity'
                                                          .toText(
                                                            translate: false,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ],
                                                  ),
                                                  SvgPicture.asset(
                                                    AppIcon.rightArrow,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
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

  void addNewCropModal(context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.r),
              topRight: Radius.circular(8.r),
            ),
            color: AppColors.primaryBackground,
          ),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.bgGreen,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.r),
                    topRight: Radius.circular(16.r),
                  ),
                ),
                child: Padding(
                  padding: REdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 16,
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        AppIcon.crop,
                        height: 20.sp,
                        width: 20.sp,
                      ),
                      4.horizontalSpace,
                      Expanded(
                        child: 'Add Crop & Area of Land'.toText(
                          fontSize: 12,
                          color: AppColors.colorPrimary,
                          translate: false,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: SvgPicture.asset(
                          AppIcon.cancel,
                          height: 32.sp,
                          width: 32.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: REdgeInsets.symmetric(horizontal: 16.0),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      15.verticalSpace,
                      'Kindly enter the different crops being cultivated by the farmer and the area of land being used:'
                          .toText(
                            translate: false,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.accentText,
                          ),
                      20.verticalSpace,
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
                                    state.productList
                                        .where(
                                          (product) => product.type == 'Crop',
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
                            // controller.clearScreen();
                            Utils.showToastSuccess(
                              context,
                              'Crop added successfully',
                              'Close',
                              () {
                                Navigator.of(
                                  context,
                                  rootNavigator: true,
                                ).pop();
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
                          label: 'add',
                          onPressed: () => controller.addCrop(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
