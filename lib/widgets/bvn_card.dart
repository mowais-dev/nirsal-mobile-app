import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nirsal/routes.dart';
import 'package:nirsal/widgets/small_button.dart';

import '../constants.dart';

class BVNCard extends StatefulWidget {
  const BVNCard({
    super.key,
  });

  @override
  State<BVNCard> createState() => _BVNCardState();
}

class _BVNCardState extends State<BVNCard> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.w),
        border: Border.all(
          color: kPrimaryColor,
        ),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 2.0,
        horizontal: 14.0,
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
                '00192933732',
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 14.sp,
                  fontStyle: FontStyle.italic,
                ),
              ),

              SizedBox(
                width: 22.w,
              ),

              Text(
                'Ugochukwu Eze (M)',
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 14.sp,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w600,
                ),
              ),
    
              const Spacer(),
    
              IconButton(
                onPressed: () {
                  setState(() {
                    expanded = !expanded;
                  });
                },
                icon: SvgPicture.asset(
                  expanded ? 'assets/icons/ic-arrow-up.svg' : 'assets/icons/ic-arrow-down-big.svg',
                  colorFilter: const ColorFilter.mode(kPrimaryColor, BlendMode.srcIn),
                ),
              ),
            ],
          ),

          if (expanded) ...[
            SizedBox(
              height: 13.w,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SmallButton(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.farmerEditRoute);
                  },
                  text: 'View',
                ),

                SizedBox(
                  width: 17.w,
                ),

                SmallButton(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.farmerEditRoute);
                  },
                  text: 'Modify',
                  color: kDarkGreenColor1,
                ),
              ],
            ),

            SizedBox(
              height: 9.w,
            ),
          ]
        ],
      ),
    );
  }
}