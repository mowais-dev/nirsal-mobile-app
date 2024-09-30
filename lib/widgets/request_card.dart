import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants.dart';

class RequestCard extends StatelessWidget {
  const RequestCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 117.w,
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(9.0),
            boxShadow: [
              BoxShadow(
                color: kBlackColor.withAlpha(58),
                offset: const Offset(0, 0),
                blurRadius: 10,
              )
            ]
          ),
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(38.w / 2),
                child: Image.asset(
                  'assets/images/avatar.png',
                  width: 38.w,
                  height: 38.w,
                  fit: BoxFit.cover,
                ),
              ),
        
              Divider(
                color: kGrayColor.withAlpha(66),
                height: 10,
              ),
        
              Text(
                'NIN: 00938277263',
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 8.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
        
              Divider(
                color: kGrayColor.withAlpha(66),
                thickness: 0.5,
                indent: 30.w,
                endIndent: 30.w,
                height: 10,
              ),
        
              Text(
                'BVN: 29198227711',
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 8.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
        
              Divider(
                color: kGrayColor.withAlpha(66),
                indent: 23.w,
                endIndent: 23.w,
                height: 10,
              ),
        
              Text(
                '30-06-2024',
                style: TextStyle(
                  color: kBlackColor,
                  fontSize: 8.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
        
              Divider(
                color: kGrayColor.withAlpha(66),
                height: 10,
              ),
        
              Container(
                decoration: BoxDecoration(
                  color: kRedColor,
                  borderRadius: BorderRadius.circular(3.0),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 3.0,
                  horizontal: 14.0,
                ),
                child: Text(
                  'INCOMPLETE',
                  style: TextStyle(
                    color: kWhiteColor,
                    fontSize: 7.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              )
            ],
          ),
        ),

        SizedBox(
          height: 8.w,
        ),

        Text(
          'Namadi Samboru',
          style: TextStyle(
            color: kPrimaryColor,
            fontSize: 8.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

