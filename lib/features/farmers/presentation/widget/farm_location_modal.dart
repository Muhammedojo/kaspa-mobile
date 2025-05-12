import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/component/empty_list_widget.dart';
import '../../../../core/data/model/farm_coordinate.dart';
import '../../../../core/resources/vectors.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/theme/colors.dart';
import 'location_widget.dart';

class FarmLocationModal extends StatelessWidget {
  final List<Coordinates> currentFarmLocationCoordinates;
  final Function(double, double, int)? onGetCoordinates;
  final Function(int) onDelete;
  final Function() onAddPoint;
  final Function() onSavePoints;
  final double hectares;

  const FarmLocationModal({
    super.key,
    required this.currentFarmLocationCoordinates,
    required this.onDelete,
    required this.hectares,
    required this.onGetCoordinates,
    required this.onAddPoint,
    required this.onSavePoints,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 680),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8.r),
            topRight: Radius.circular(8.r),
          ),
          color: Colors.white,
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
                padding: REdgeInsets.symmetric(vertical: 10.0, horizontal: 16),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      AppIcon.location,
                      height: 20.sp,
                      width: 20.sp,
                    ),
                    4.horizontalSpace,
                    Expanded(
                      child: 'Add Farm Location'.toText(
                        fontSize: 12,
                        color: AppColors.colorPrimary,
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
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(height: 5.h),
                  SvgPicture.asset(
                    'assets/images/rectangle.svg',
                    fit: BoxFit.scaleDown,
                  ),
                  16.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: onAddPoint,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: AppColors.colorPrimary,
                          ),
                          child: Padding(
                            padding: REdgeInsets.symmetric(
                              vertical: 10.0,
                              horizontal: 9,
                            ),
                            child: Row(
                              children: [
                                'add_point'.toText(
                                  fontSize: 14,
                                  color: AppColors.bgGreen,
                                  fontWeight: FontWeight.w700,
                                ),
                                7.horizontalSpace,
                                Icon(Icons.add, color: AppColors.bgGreen),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  50.verticalSpace,
                  currentFarmLocationCoordinates.isNotEmpty
                      ? Expanded(
                        child: ListView.builder(
                          key: Key(
                            currentFarmLocationCoordinates.length.toString(),
                          ),
                          shrinkWrap: true,
                          itemCount: currentFarmLocationCoordinates.length,
                          itemBuilder: (context, index) {
                            var coordinates =
                                currentFarmLocationCoordinates[index];
                            return LocationWidget(
                              multiple: false,
                              latitude: coordinates.latitude.toString(),
                              longitude: coordinates.longitude.toString(),
                              itemPosition: index,
                              onDelete: (position) => onDelete(position),
                              onGetCoordinates:
                                  (latitude, longitude, position) =>
                                      onGetCoordinates!(
                                        latitude,
                                        longitude,
                                        position,
                                      ),
                            );
                          },
                        ),
                      )
                      : ErrorWidgets(message: 'no_point_added'),
                  60.verticalSpace,
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.bgGreen,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Padding(
                      padding: REdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 20,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              '$hectares Hectare${hectares > 1 ? 's' : ''}'
                                  .toText(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    translate: false,
                                  ),
                              const Spacer(),
                              '${currentFarmLocationCoordinates.length}'.toText(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                translate: false,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              'Estimated Size'.toText(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                translate: false,
                              ),

                              const Spacer(),

                              'Points Added'.toText(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                translate: false,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 13.h),
                  InkWell(
                    onTap: onSavePoints,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.r),
                        color: AppColors.colorPrimary,
                      ),
                      child: Center(
                        child: Padding(
                          padding: REdgeInsets.symmetric(vertical: 15.0),
                          child: 'Save Coordinate'.toText(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColors.bgGreen,
                            translate: false,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
