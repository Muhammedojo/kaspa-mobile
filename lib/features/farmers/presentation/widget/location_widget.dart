import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/utils/styles.dart';

class LocationWidget extends StatefulWidget {
  final String? latitude;
  final String? longitude;
  final int? itemPosition;
  final Function(double, double, int)? onGetCoordinates;
  final Function(int) onDelete;
  final bool multiple;

  const LocationWidget({
    super.key,
    required this.itemPosition,
    required this.latitude,
    required this.longitude,
    this.multiple = false,
    required this.onDelete,
    required this.onGetCoordinates,
  });

  @override
  State<LocationWidget> createState() => _LocationWidgetState(multiple);
}

class _LocationWidgetState extends State<LocationWidget> {
  late TextEditingController latController;
  late TextEditingController longController;
  final bool multiple;
  late final String coordinates;

  _LocationWidgetState(this.multiple);

  @override
  void initState() {
    super.initState();
    latController = TextEditingController(text: widget.latitude);
    longController = TextEditingController(text: widget.longitude);
  }

  @override
  void dispose() {
    latController.dispose();
    longController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              multiple
                  ? const SizedBox()
                  : InkWell(
                    onTap: () {
                      widget.onDelete(widget.itemPosition!);
                    },
                    child: Container(
                      margin: REdgeInsets.only(top: 20),
                      child: SvgPicture.asset(
                        'assets/images/cancel_coordinate.svg',
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
              multiple ? const SizedBox() : SizedBox(width: 20.w),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    'latitude'.toText(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                   5.verticalSpace,
                    SizedBox(
                      height: 50.h,
                      child: TextFormField(
                        style: Styles.normal_000000(14),
                        controller: latController,
                        decoration: InputDecoration(
                          enabled: false,
                          contentPadding: REdgeInsets.symmetric(
                            horizontal: 5,
                            vertical: 10,
                          ),
                          hintText: latController.text,
                          border: const OutlineInputBorder(),
                          focusedBorder: const OutlineInputBorder(),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: Color(0xffD1D5DB),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                          'longitude'.toText(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                   5.verticalSpace,
                    SizedBox(
                      height: 50.h,
                      child: TextFormField(
                        style: Styles.normal_000000(14),
                        controller: longController,
                        decoration: InputDecoration(
                          enabled: false,
                          contentPadding: REdgeInsets.symmetric(
                            horizontal: 5,
                            vertical: 10,
                          ),
                          hintText: longController.text,
                          border: const OutlineInputBorder(),
                          focusedBorder: const OutlineInputBorder(),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: Color(0xffD1D5DB),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 20.w),
              InkWell(
                onTap: () async {
                  // Position position =
                  //     await LocationManager().getCurrentPosition();
                  // setState(() {
                  //   latController.text = "${position.latitude}";
                  //   longController.text = "${position.longitude}";
                  // });
                  // widget.onGetCoordinates!(
                  //   position.latitude,
                  //   position.longitude,
                  //   widget.itemPosition!,
                  // );
                },
                child: Container(
                  margin: REdgeInsets.only(top: 20),
                  child: SvgPicture.asset(
                    multiple
                        ? 'assets/images/capture.svg'
                        : 'assets/images/location_marker.svg',
                    height: 44.w,
                    width: 44.w,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
            ],
          ),
         10.verticalSpace,
          multiple
              ? const SizedBox()
              : Divider()
        ],
      ),
    );
  }
}
