import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kaspa/core/utils/extensions.dart';
import '../../../../core/component/card_container_widget.dart';
import '../../../../core/resources/vectors.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/function.dart';
import '../../../../core/utils/styles.dart';
import '../contract/farmer_farm_location.dart';
import '../widget/custom_tile.dart';

class FarmerFarmLocationView extends StatelessWidget
    implements FarmerFarmLocationViewContract {
  const FarmerFarmLocationView({super.key, required this.controller});

  final FarmerFarmLocationControllerContract controller;

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
                        ? Center(
                          child: "This farmer has no farms.".toText(
                            translate: false,
                          ),
                        )
                        : ListView.builder(
                          itemCount: controller.farmer.farmerFarms!.length,
                          itemBuilder: (context, index) {
                            final farm = controller.farmer.farmerFarms![index];
                            return CardContainerWidget(
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
                                    crossAxisAlignment: CrossAxisAlignment.start,
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
                            );
                            // Padding(
                            //   padding: REdgeInsets.only(bottom: 16.0),
                            //   child: CustomTile(
                            //     title: 'Farm ${index + 1}',
                            //     body: Column(
                            //       crossAxisAlignment: CrossAxisAlignment.start,
                            //       children: [
                            //         _buildFarmDetailRow(
                            //           "Address",
                            //           farm.address,
                            //         ),
                            //         12.verticalSpace,
                            //         _buildFarmDetailRow("Size", farm.sizeInHa),
                            //         12.verticalSpace,
                            //         _buildFarmDetailRow("Unit", farm.address),
                            //       ],
                            //     ),
                            //   ),
                            // );
                          },
                        ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFarmDetailRow(String label, String? value) {
    return Row(
      children: [
        "$label: ".toText(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          translate: false,
        ),
        Expanded(
          child: (value ?? 'N/A').toText(
            translate: false,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
