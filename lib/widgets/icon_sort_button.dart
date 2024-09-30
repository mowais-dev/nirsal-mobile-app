import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';

class IconSortButton extends StatelessWidget {
  const IconSortButton({
    super.key,
    required this.onTap,
    required this.text,
    required this.icon,
    required this.active,
  });

  final GestureTapCallback onTap;
  final String text;
  final String icon;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170.w,
      decoration: BoxDecoration(
        color: active ? kLightGreenShade2 : Colors.transparent,
        borderRadius: BorderRadius.circular(7),
        border: Border.all(
          color: active ? kLightGreenShade2 : kPrimaryColor,
        )
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(7),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 17.0,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                icon,
                colorFilter: ColorFilter.mode(active ? kDarkGreenColor : kPrimaryColor, BlendMode.srcIn),
              ),

              SizedBox(
                width: 8.w,
              ),

              Text(
                text,
                style: TextStyle(
                  color: active ? kDarkGreenColor : kPrimaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp,
                ),
              ),
    
              const Spacer(),
    
              SvgPicture.asset(
                'assets/icons/ic-arrow-down.svg',
                colorFilter: ColorFilter.mode(active ? kDarkGreenColor : kPrimaryColor, BlendMode.srcIn),
              ),
            ],
          ),
        ),
      ),
    );
  }
}