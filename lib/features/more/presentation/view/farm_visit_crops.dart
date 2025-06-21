import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/component/card_container_widget.dart';
import '../../../../core/component/empty_list_widget.dart';
import '../../../../core/navigation/navigator.dart';
import '../../../../core/resources/vectors.dart';
import '../../../../core/utils/function.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/styles.dart';
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
                      CardContainerWidget(
                        decoration: BoxDecoration(
                          color: Color(0xffF8F8F8),
                          borderRadius: BorderRadius.circular(8.r),
                          border: BoxBorder.all(
                            color: Color(0xffC8C8C8),
                            width: 0.5,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                'List of crops cultivated by farmer'.toText(
                                  translate: false,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ],
                            ),
                            12.verticalSpace,
                            const Divider(),
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
                                        .map((farmCrop) => InkWell(
                                            onTap: () => pushTo(
                                                CropActivitiesScreen(
                                                    farmCrop: farmCrop),
                                                context),
                                            child: Padding(
                                              padding: REdgeInsets.only(
                                                bottom: 12.0,
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
                                                                FontWeight
                                                                    .w700,
                                                          ),
                                                          '${farmCrop.noOfHectares ?? 0} ha'
                                                              .toText(
                                                            translate: false,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500,
                                                          ),
                                                          'No pending farm activity'
                                                              .toText(
                                                            translate: false,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500,
                                                          ),
                                                        ],
                                                      ),
                                                      SvgPicture.asset(
                                                        AppIcon.rightArrow,
                                                      ),
                                                    ],
                                                  ),
                                                  10.verticalSpace,
                                                  const Divider(),
                                                ],
                                              ),
                                            ),
                                          ))
                                        .toList(),
                              ),
                          ],
                        ),
                      ),

                      // "Here’s a list of farm visits".toText(
                      //   translate: false,
                      //   color: AppColors.accentText,
                      //   fontSize: 12,
                      //   fontWeight: FontWeight.w500,
                      // ),
                      // 16.verticalSpace,
                      // Expanded(
                      //   child: BlocBuilder<FarmVisitCubit, FarmVisitState>(
                      //     builder: (context, state) {
                      //       if (state is FarmVisitLoading) {
                      //         return ErrorWidgets(title: "empty", message: '');
                      //       }
                      //       if (state is FarmVisitLoaded) {
                      //         return state.farmVisitList.isEmpty
                      //             ? ErrorWidgets(message: 'visit_list_empty')
                      //             : ListView.separated(
                      //               itemCount: state.farmVisitList.length,
                      //               physics:
                      //                   const AlwaysScrollableScrollPhysics(),
                      //               itemBuilder: (context, index) {
                      //                 return FarmVisitCard(
                      //                   data: state.farmVisitList[index],
                      //                   onTap: () {
                      //                     // pushTo(
                      //                     //   CooperativeDetailsScreen(
                      //                     //     cooperative:
                      //                     //         state.cooperativeList[index],
                      //                     //   ),
                      //                     //   context,
                      //                     // );
                      //                   },
                      //                 );
                      //               },
                      //               separatorBuilder:
                      //                   (BuildContext context, int index) =>
                      //                       12.verticalSpace,
                      //             );
                      //       }
                      //       if (state is FarmVisitFailure) {
                      //         return ErrorWidgets(
                      //           title: "Error",
                      //           message: state.toString(),
                      //         );
                      //       }
                      //       return const SizedBox.shrink();
                      //     },
                      //   ),
                      // ),
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
