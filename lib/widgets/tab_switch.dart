import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants.dart';

class TabSwitch extends StatelessWidget {
  const TabSwitch({
    super.key,
    required this.active,
    required this.onTap,
    required this.text,
    required this.inactiveColor,
    required this.activeColor,
    required this.activeTextColor,
    this.inactiveTextColor = kWhiteColor,
  });

  final GestureTapCallback onTap;
  final String text;
  final bool active;
  final Color inactiveColor;
  final Color activeColor;
  final Color activeTextColor;
  final Color inactiveTextColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: active ? activeColor : inactiveColor,
      borderRadius: BorderRadius.circular(9.0),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(9.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text,
            style: TextStyle(
              color: active ? activeTextColor : inactiveTextColor,
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
            ),
          ),
        ),
      ),
    );
  }
}