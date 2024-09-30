import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants.dart';

class AlertHelper {
  /// Show snack bar
  /// 
  /// **Parameter** [context] BuildContext.
  /// 
  /// **Parameter** [message] Message to display on snackbar.
  static void showSnack(BuildContext context, String message, String type) {
    final Color? color;

    if (type == 'success') {
      color = kDarkGreenColor;
    } else if (type == 'error') {
      color = kDangerColor;
    } else {
      color = kErrorColor;
    }

    final snackBar = SnackBar(
      content: Text(
        message,
        style: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.normal,
          color: kWhiteColor,
        ),
      ),
      showCloseIcon: false,
      backgroundColor: color,
      duration: const Duration(milliseconds: 3000),
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 20.h,
      ),
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          color: kWhiteColor,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}