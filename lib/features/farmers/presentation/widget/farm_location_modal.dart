import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/component/empty_list_widget.dart';
import '../../../../core/data/model/farm_coordinate.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/theme/colors.dart';
import 'location_widget.dart';

class FarmLocationModal extends StatelessWidget {
  final List<FarmCoordinates> currentFarmLocationCoordinates;
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
            topLeft: Radius.circular(24.r),
            topRight: Radius.circular(24.r),
          ),
          color: AppColors.ColorAccent,
        ),
        child: Padding(
          padding: REdgeInsets.symmetric(horizontal: 27.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(height: 5.h),
              SvgPicture.asset(
                'assets/images/rectangle.svg',
                fit: BoxFit.scaleDown,
              ),
              SizedBox(height: 43.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  'farm_coordinate'.toText(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
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
                              fontWeight: FontWeight.w700,
                            ),
                            7.horizontalSpace,
                            SvgPicture.asset(
                              'assets/images/add_point_icon.svg',
                              height: 28.w,
                              width: 28.w,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              SizedBox(height: 21.h),
              currentFarmLocationCoordinates.isNotEmpty
                  ? Expanded(
                    child: ListView.builder(
                      key: Key(
                        currentFarmLocationCoordinates.length.toString(),
                      ),
                      shrinkWrap: true,
                      itemCount: currentFarmLocationCoordinates.length,
                      itemBuilder: (context, index) {
                        var coordinates = currentFarmLocationCoordinates[index];
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
              Container(
                decoration: BoxDecoration(
                  color: Colors.greenAccent.withOpacity(0.09),
                  borderRadius: BorderRadius.circular(8),
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
                          '$hectares Hectare${hectares > 1 ? 's' : ''}'.toText(
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
                    color: AppColors.accentElement,
                  ),
                  child: Center(
                    child: Padding(
                      padding: REdgeInsets.symmetric(vertical: 15.0),
                      child: 'Save Coordinate'.toText(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
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
      ),
    );
  }
}
