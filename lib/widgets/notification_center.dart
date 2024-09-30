import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants.dart';

class NotificationCenter extends StatelessWidget {
  const NotificationCenter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.w),
        border: Border.all(
          color: kBlackShade.withOpacity(0.1),
          width: 2,
        ),
        color: kLightGreenColor,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'You have',
            style: TextStyle(
              fontSize: 10.sp,
              color: kBlackColor,
              fontWeight: FontWeight.w500,
            ),
          ),
    
          SizedBox(
            width: 5.w,
          ),
    
          Container(
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(5.0),
            ),
            padding: const EdgeInsets.all(5.0),
            child: Text(
              '28',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: kWhiteColor,
                fontSize: 12.sp,
              ),
            ),
          ),
    
          SizedBox(
            width: 5.w,
          ),
    
          Text(
            'Assigned Request and',
            style: TextStyle(
              fontSize: 10.sp,
              color: kBlackColor,
              fontWeight: FontWeight.w500,
            ),
          ),
    
          SizedBox(
            width: 5.w,
          ),
    
          Container(
            decoration: BoxDecoration(
              color: kRedColor,
              borderRadius: BorderRadius.circular(5.0),
            ),
            padding: const EdgeInsets.all(5.0),
            child: Text(
              '14',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: kWhiteColor,
                fontSize: 12.sp,
              ),
            ),
          ),
    
          SizedBox(
            width: 5.w,
          ),
    
          Text(
            'Incomplete Request.',
            style: TextStyle(
              fontSize: 10.sp,
              color: kBlackColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}