import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';

class SortButton extends StatelessWidget {
  const SortButton({
    super.key,
    required this.onTap,
    required this.text,
  });

  final GestureTapCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: kPrimaryColor,
        )
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(7),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 5.0,
            horizontal: 25.0,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                text,
                style: TextStyle(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp,
                ),
              ),
    
              SizedBox(
                width: 9.w,
              ),
    
              SvgPicture.asset(
                'assets/icons/ic-arrow-down.svg',
                colorFilter: const ColorFilter.mode(kPrimaryColor, BlendMode.srcIn),
              ),
            ],
          ),
        ),
      ),
    );
  }
}