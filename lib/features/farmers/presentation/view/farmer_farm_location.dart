import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/navigation/navigator.dart';
import '../../../../core/component/empty_list_widget.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/component/card_container_widget.dart';
import '../../../../core/resources/vectors.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/function.dart';
import '../../../../core/utils/styles.dart';
import '../contract/farmer_farm_location.dart';
import '../controller/add_farm.dart';

import 'sample.dart';

class FarmerFarmLocationView extends StatelessWidget
    implements FarmerFarmLocationViewContract {
  const FarmerFarmLocationView({super.key, required this.controller});

  final FarmerFarmLocationControllerContract controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.primaryGreen,
        heroTag: "add_farm",
        onPressed: () {
          pushTo(AddFarmScreen(farmer: controller.farmer), context);
        },
        label: Row(
          children: [
            Icon(Icons.add, color: AppColors.primaryBackground),
            5.horizontalSpace,
            'Add new Farm'.toText(
              translate: false,
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: AppColors.primaryBackground,
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
            Utils.customAppBar(
              context,
              '${controller.farmer.firstName} ${controller.farmer.lastName} Farm Location',
              false,
              () {},
            ),
            24.verticalSpace,

            Expanded(
              child: Padding(
                padding: REdgeInsets.symmetric(horizontal: 16.0),
                child:
                    (controller.farmer.farmerFarms?.isEmpty ?? true)
                        ? ErrorWidgets(
                          message:
                              '${controller.farmer.firstName} ${controller.farmer.lastName} has no farm.',
                        )
                        : ListView.builder(
                          itemCount: controller.farmer.farmerFarms!.length,
                          itemBuilder: (context, index) {
                            final farm = controller.farmer.farmerFarms![index];
                            return Padding(
                              padding: REdgeInsets.only(bottom: 5.0),
                              child: InkWell(
                                onTap:
                                    () => pushTo(
                                      FarmDetailsPage(
                                        farmer: controller.farmer,
                                      ),

                                      context,
                                    ),
                                child: CardContainerWidget(
                                  decoration: BoxDecoration(
                                    color: Color(0xffF8F8F8),
                                    borderRadius: BorderRadius.circular(8.r),
                                    border: BoxBorder.all(
                                      color: Color(0xffC8C8C8),
                                      width: 0.5,
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(AppIcon.map),
                                      8.horizontalSpace,
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          'Farm ${index + 1}'.toText(),
                                          '${farm.address}'.toText(),
                                          '${farm.sizeInHa} Hectares'.toText(),
                                        ],
                                      ),
                                      const Spacer(),
                                      SvgPicture.asset(AppIcon.rightArrow),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
