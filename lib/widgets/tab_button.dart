import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nirsal/constants.dart';

class TabButton extends StatelessWidget {
  const TabButton({
    super.key,
    required this.active,
    required this.onTap,
    required this.icon,
    required this.title,
  });

  final GestureTapCallback onTap;
  final String icon;
  final String title;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 4.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 47.w,
              height: 44.w,
              child: Material(
                color: active ? kLightGreenShade : Colors.transparent,
                borderRadius: BorderRadius.circular(9.0),
                child: SvgPicture.asset(
                  icon,
                  width: 23.w,
                  fit: BoxFit.scaleDown,
                  colorFilter: ColorFilter.mode(active ? kPrimaryColor : kWhiteColor.withOpacity(0.5), BlendMode.srcIn),
                ),
              ),
            ),
                              
            Text(
              title,
              style: TextStyle(
                color: kWhiteColor,
                fontSize: 12.sp,
                fontWeight: active ? FontWeight.bold : null,
              ),
            )
          ],
        ),
      ),
    );
  }
}