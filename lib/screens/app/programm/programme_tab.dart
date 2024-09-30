import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants.dart';

class ProgramTab extends StatelessWidget {
  const ProgramTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(8.w),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 14.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Type',
                style: TextStyle(
                  fontSize: 13.sp,
                  color: kBlackColor,
                ),
              ),
        
              Text(
                'ARMSERVE',
                style: TextStyle(
                  fontSize: 13.sp,
                  color: kBlackColor.withOpacity(0.5),
                ),
              ),
    
              Text(
                'Season',
                style: TextStyle(
                  fontSize: 13.sp,
                  color: kBlackColor,
                ),
              ),
        
              Text(
                'Wet',
                style: TextStyle(
                  fontSize: 13.sp,
                  color: kBlackColor.withOpacity(0.5),
                ),
              ),
            ],
          ),
        
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Project',
                style: TextStyle(
                  fontSize: 13.sp,
                  color: kBlackColor,
                ),
              ),
        
              Text(
                'Protocropping',
                style: TextStyle(
                  fontSize: 13.sp,
                  color: kBlackColor.withOpacity(0.5),
                ),
              ),
    
              Text(
                'Year',
                style: TextStyle(
                  fontSize: 13.sp,
                  color: kBlackColor,
                ),
              ),
        
              Text(
                '2024',
                style: TextStyle(
                  fontSize: 13.sp,
                  color: kBlackColor.withOpacity(0.5),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}