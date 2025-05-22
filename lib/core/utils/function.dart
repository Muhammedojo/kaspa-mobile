import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loader_overlay/loader_overlay.dart';
import '../../core/resources/images.dart';
import '../../core/utils/extensions.dart';
import '../component/error_dialog.dart';
import '../component/sucess_dialog.dart';
import '../component/warning_dialog.dart';
import '../data/model/farm_coordinate.dart';
import '../resources/vectors.dart';

class Utils {
  static customBar(BuildContext context, {GestureTapCallback? onPressed}) {
    return AppBar(
      centerTitle: false,

      backgroundColor: Colors.transparent,
      leading: Image.asset(AppImage.horizontalLogo),
    );
  }

  static AppBar customAppBar(
    BuildContext context,
    String title,
    bool? showMore,
    Function()? onTapAction, {
    GestureTapCallback? onPressed,
    List<Widget>? actions,
  }) {
    List<Widget> effectiveActions = [];

    if (actions != null && actions.isNotEmpty) {
      effectiveActions.addAll(actions);
    } else if (showMore == true) {
      effectiveActions.add(
        InkWell(
          onTap: onTapAction,
          child: SvgPicture.asset(
            AppIcon.more,
            fit: BoxFit.scaleDown,
            height: 32.sp,
            width: 32.sp,
          ),
        ),
      );
    }
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: title.toText(fontSize: 14, fontWeight: FontWeight.w700),
      leading: InkWell(
        onTap: onPressed ?? () => Navigator.pop(context),
        child: SvgPicture.asset(
          AppIcon.pop,
          fit: BoxFit.scaleDown,
          height: 32.sp,
          width: 32.sp,
        ),
      ),
      actions: effectiveActions.isEmpty ? null : effectiveActions,
    );
  }

  static void showToastSuccess(
    BuildContext context,
    String message,
    String title,
    VoidCallback onTap,
  ) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder:
          (BuildContext context) =>
              SuccessDialogWidget(message: message, title: title, onTap: onTap),
    );
  }

  static bool isDuplicateCoordinate(
    List<Coordinates> existingCoordinates,
    Coordinates newCoordinate,
  ) {
    return existingCoordinates.any(
      (coord) =>
          coord.latitude == newCoordinate.latitude &&
          coord.longitude == newCoordinate.longitude,
    );
  }

  static showToastWarning(
    BuildContext context,
    String message,
    String title,
    Function() onTap,
  ) {
    showDialog(
      context: context,
      builder:
          (BuildContext context) =>
              WarningDialogWidget(message: message, title: title, onTap: onTap),
    );
  }

  static showToastError(
    BuildContext context,
    String message,
    String title,
    Function() onTap,
  ) {
    showDialog(
      context: context,
      builder:
          (BuildContext context) =>
              ErrorDialogWidget(message: message, title: title, onTap: onTap),
    );
  }

  static hideLoading(BuildContext context) {
    return context.loaderOverlay.hide();
  }

  static showLoading(BuildContext context) {
    return context.loaderOverlay.show();
  }

  static showConfirmationDialog(
    BuildContext context, {
    required VoidCallback onYesPressed,
    String yesButtonText = 'Yes',
    String? title = 'Confirm Action',
    String? message = 'Are you sure you want to perform this action?',
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title!),
          content: Text(message!),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                onYesPressed();
              },
              child: Text('Yes'),
            ),
            TextButton(
              onPressed: () => closeDialog(context),
              child: Text('No'),
            ),
          ],
        );
      },
    );
  }

  static hideProgress() {
    // return EasyLoading.dismiss();
  }

  static void closeDialog(BuildContext context) {
    Navigator.of(context, rootNavigator: true).pop('dialog');
  }

  String getInitials(String? name) {
    if (name == null || name.trim().isEmpty) {
      return '';
    }
    List<String> nameParts = name.split(' ');

    String initials = '';
    for (var part in nameParts) {
      if (part.isNotEmpty) {
        initials += part[0].toUpperCase();
      }
    }

    return initials;
  }

  static mediaBottomSheet(
    context,
    Function onCameraSelected,
    Function onGallerySelected,
  ) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Container(
          color: Colors.white,
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: 'camera'.toText(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                onTap: () {
                  Navigator.pop(context);
                  onCameraSelected();
                },
              ),
              ListTile(
                leading: Icon(Icons.image),
                title: 'gallery'.toText(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                onTap: () {
                  Navigator.pop(context);
                  onGallerySelected();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
