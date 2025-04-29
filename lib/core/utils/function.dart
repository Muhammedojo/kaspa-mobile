import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kaspa/core/utils/extensions.dart';

import '../component/welcome_dialog_widget.dart';


class Utils {
  static customAppBar(
    BuildContext context,
    String title,
  {GestureTapCallback? onPressed}
  ) {
    return AppBar(
      centerTitle: false,
      title: title.toText(fontSize: 20, fontWeight: FontWeight.w700),
      backgroundColor: Colors.transparent,
      leading: InkWell(
          onTap: onPressed ?? () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back,
            size: 25.sp,
          )),
    );
  }

   static showToastError(BuildContext context, String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) => WelcomeDialog(
            title: "error".tr(),
            message: message,
            image: "assets/images/error.png",
            onTap: () => closeDialog(context)));
  }

  static showConfirmationDialog(
    BuildContext context, {
    required VoidCallback onYesPressed,
    String yesButtonText = 'Yes',
        String? title = 'Confirm Action',
        String? message = 'Are you sure you want to perform this action?'
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

  // static showToast(BuildContext context, String? message) {
  //   showDialog(
  //       context: context,
  //       builder: (BuildContext context) => AppDialog(
  //           title: "success".tr(),
  //           message: message,
  //           image: "assets/images/done.png",
  //           onTap: () => closeDialog(context)));
  // }

  static hideProgress() {
    // return EasyLoading.dismiss();
  }

  static void closeDialog(BuildContext context) {
    Navigator.of(context, rootNavigator: true).pop('dialog');
  }

  String getInitials(String name) {
    List<String> nameParts = name.split(' ');

    String initials = '';
    for (var part in nameParts) {
      if (part.isNotEmpty) {
        initials += part[0].toUpperCase();
      }
    }

    return initials;
  }

  // static showToastError(BuildContext context, String message) {
  //   showDialog(
  //       context: context,
  //       builder: (BuildContext context) => WelcomeDialog(
  //           title: "error".tr(),
  //           message: message,
  //           image: "assets/images/error.png",
  //           onTap: () => closeDialog(context)));
  // }

  // static showBottomToast(BuildContext context,
  //     {Function()? onTap,
  //     String? titleLabel,
  //     String? subTitleLabel,
  //     bool? isConfirmationDialog,
  //     bool? isRejectionDialog,
  //     String? buttonLabel,
  //     String? customImagePath,
  //     bool? isDismissible}) {
  //   showModalBottomSheet(
  //       isScrollControlled: true,
  //       context: context,
  //       isDismissible: isDismissible ?? false,
  //       backgroundColor: Colors.transparent,
  //       builder: (context) {
  //         return SnackBarWidget(
  //           onTap: onTap,
  //           titleLabel: titleLabel,
  //           subTitleLabel: subTitleLabel,
  //           isConfirmationDialog: isConfirmationDialog,
  //           isRejectionDialog: isRejectionDialog,
  //           buttonLabel: buttonLabel,
  //           customImagePath: customImagePath,
  //         );
  //       });
  // }

  static mediaBottomSheet(
      context, Function onCameraSelected, Function onGallerySelected) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            color: Colors.white,
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: Icon(Icons.camera_alt),
                    title: 'camera'
                        .toText(fontSize: 14, fontWeight: FontWeight.w500),
                    onTap: () {
                      Navigator.pop(context); //close bottomsheetdialog
                      onCameraSelected();
                    }),
                ListTile(
                  leading: Icon(Icons.image),
                  title: 'gallery'
                      .toText(fontSize: 14, fontWeight: FontWeight.w500),
                  onTap: () {
                    Navigator.pop(context);
                    onGallerySelected();
                  },
                ),
              ],
            ),
          );
        });
  }
}
