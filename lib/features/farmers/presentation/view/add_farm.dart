import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_validator/form_validator.dart';
import '../../../../../core/component/button.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/resources/vectors.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/function.dart';
import '../../../../core/utils/styles.dart';
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
      decoration: Styles.colorComboDecoration(),
      child: SafeArea(
        child: Padding(
          padding: REdgeInsets.symmetric(horizontal: 16.0),
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
              'farm_address'.toText(fontSize: 14, fontWeight: FontWeight.w600),
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
                                : () => controller.onAddFarmLocation(context),
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
                              padding: REdgeInsets.symmetric(vertical: 20.0),
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
                    itemCount: controller.currentFarmLocationCoordinates.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final coordinate =
                          controller.currentFarmLocationCoordinates[index];
                      return Points(
                        lat: coordinate.latitude!.toStringAsFixed(6),
                        long: coordinate.longitude!.toStringAsFixed(6),
                        delete: () {
                          controller.onDeleteFarmLocationCoordinates(index);
                        },
                        showIcon: true,
                        point: index + 1,
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
                                : () => controller.onAddFarmLocation(context),
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
                              padding: REdgeInsets.symmetric(vertical: 10.0),
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
                  : ButtonWidget(label: 'Add Farm', onPressed: () {
                    controller.addNewFarm();
                  }),
              20.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
