import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nirsal/routes.dart';

import '../constants.dart';

class AssignedCard extends StatelessWidget {
  const AssignedCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.farmers);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.w),
          border: Border.all(
            color: kPrimaryColor,
          ),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 2.0,
          horizontal: 20.0,
        ),
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(25.w / 2),
                  child: Image.asset(
                    'assets/images/avatar.png',
                    width: 25.w,
                    height: 25.w,
                    fit: BoxFit.cover,
                  ),
                ),
      
                SizedBox(
                  width: 20.w,
                ),
      
                Text(
                  'Ugochukwu Eze (M)',
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
      
                const Spacer(),
      
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    'assets/icons/ic-arrow-forward.svg',
                    colorFilter: const ColorFilter.mode(kPrimaryColor, BlendMode.srcIn),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}