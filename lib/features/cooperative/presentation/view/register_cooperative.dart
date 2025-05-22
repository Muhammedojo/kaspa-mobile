import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_validator/form_validator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kaspa/core/utils/extensions.dart';
import '../../../../core/component/button.dart';
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
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Utils.customAppBar(
                    context,
                    'register_cooperative',
                    false,
                    () {},
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
                  16.verticalSpace,
                  'date_of_incorporation'.toText(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),

                  InkWell(
                    onTap: () => controller.selectDate(context),
                    child: IgnorePointer(
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        style: Styles.x14dp_4A4A4A(14.0.sp),
                        readOnly: true,
                        validator: ValidationBuilder().required().build(),
                        controller: controller.doiController,
                        decoration:
                            Styles.textFormFieldDecorationBorderWithBackground(
                              'DD/MM/YYYY',
                              showPrefixIcon: true,
                              iconData: Icons.calendar_month,
                              '',
                            ),
                      ),
                    ),
                  ),
                  16.verticalSpace,
                  'certificate_number'.toText(
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
                      keyboardType: TextInputType.text,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      textInputAction: TextInputAction.next,
                      decoration:
                          Styles.textFormFieldDecorationBorderWithBackground(
                            'Enter Certificate Number',
                            '',
                            check: false,
                          ),
                      onChanged: (value) {},
                    ),
                  ),
                  16.verticalSpace,
                  'cooperative_certificate'.toText(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  16.verticalSpace,
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
                            crossAxisAlignment: CrossAxisAlignment.stretch,
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
                                            "Upload Cooperative's Certificate",
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
                       BlocListener<CooperativeCubit, CooperativeState>(
                    listener: (context, state) {
                      if (state is CooperativeLoading) {
                        Utils.showLoading(context);
                      } else if (state is CreateCooperativeSuccess) {
                        Utils.hideLoading(context);
                        controller.clearScreen();
                        Utils.showToastSuccess(
                          context,
                          'cooperative_created_successfully'.tr(),
                          '',
                          () {
                            Navigator.pop(context);
                          },
                        );
                      } else if (state is CooperativeFailure) {
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
                      onPressed: () => controller.saveCooperative(),
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
