import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';

class CollapsibleTitleBar extends StatelessWidget {
  const CollapsibleTitleBar({
    super.key,
    required this.onTap,
    required this.text,
  });

  final GestureTapCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: kPrimaryColor,
      borderRadius: BorderRadius.circular(12.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 2.0,
          horizontal: 17.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: 16.sp,
                color: kWhiteColor,
                fontWeight: FontWeight.bold,
              ),
            ),
    
            IconButton(
              onPressed: onTap,
              icon: SvgPicture.asset(
                'assets/icons/ic-arrow-down-big.svg',
                colorFilter: const ColorFilter.mode(kWhiteColor, BlendMode.srcIn),
              ),
            ),
          ],
        ),
      ),
    );
  }
}