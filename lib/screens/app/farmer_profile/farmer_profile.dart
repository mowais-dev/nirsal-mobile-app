import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

class FarmerProfileTab extends StatelessWidget {
  const FarmerProfileTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
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
                    'First Name',
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: kBlackColor,
                    ),
                  ),
            
                  Text(
                    'Adamu',
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
                    'Middle Name',
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: kBlackColor,
                    ),
                  ),
            
                  Text(
                    'Adamu',
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
                    'Last Name',
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: kBlackColor,
                    ),
                  ),
            
                  Text(
                    'Adamu',
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: kBlackColor.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
            
        SizedBox(
          height: 15.w,
        ),
            
        Container(
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(8.w),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 14.0,
          ),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Date of Birth',
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: kBlackColor,
                    ),
                  ),
            
                  Text(
                    '19 August 1986',
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: kBlackColor.withOpacity(0.5),
                    ),
                  ),
            
                  Text(
                    'Marital Status',
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: kBlackColor,
                    ),
                  ),
            
                  Text(
                    'Married',
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: kBlackColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            
              const Spacer(),
            
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Gender',
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: kBlackColor,
                    ),
                  ),
            
                  Text(
                    'Female',
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: kBlackColor.withOpacity(0.5),
                    ),
                  ),
            
                  Text(
                    'Languages',
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: kBlackColor,
                    ),
                  ),
            
                  Text(
                    'Eng, Igb, Yor',
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: kBlackColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            
              SizedBox(
                width: 18.w,
              ),
            
              SvgPicture.asset(
                'assets/icons/ic-arrow-forward.svg',
                colorFilter: const ColorFilter.mode(kPrimaryColor, BlendMode.srcIn),
              ),
            ],
          ),
        ),
            
        SizedBox(
          height: 15.w,
        ),
            
        Container(
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(8.w),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 14.0,
          ),
          child: Row(
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Phone Number',
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: kBlackColor,
                      ),
                    ),
                
                    Text(
                      '40B, Adematu Cole Street,',
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: kBlackColor.withOpacity(0.5),
                      ),
                    ),
                
                    Text(
                      'Email',
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: kBlackColor,
                      ),
                    ),
                
                    Text(
                      'jefferson.iwobi@nirsal.com',
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: kBlackColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            
              const Spacer(),
            
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'NIN',
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: kBlackColor,
                      ),
                    ),
                
                    Text(
                      '290******27',
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: kBlackColor.withOpacity(0.5),
                      ),
                    ),
                
                    Text(
                      'BVN',
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: kBlackColor,
                      ),
                    ),
                
                    Text(
                      '898******33',
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: kBlackColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            
              SizedBox(
                width: 18.w,
              ),
            
              SvgPicture.asset(
                'assets/icons/ic-arrow-forward.svg',
                colorFilter: const ColorFilter.mode(kPrimaryColor, BlendMode.srcIn),
              ),
            ],
          ),
        ),
            
        SizedBox(
          height: 15.w,
        ),
            
        Container(
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(8.w),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 14.0,
          ),
          child: Row(
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Residential Address',
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: kBlackColor,
                      ),
                    ),
                
                    Text(
                      '40B, Adematu Cole Street,',
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: kBlackColor.withOpacity(0.5),
                      ),
                    ),
                
                    Text(
                      'LGA',
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: kBlackColor,
                      ),
                    ),
                
                    Text(
                      'Agege',
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: kBlackColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            
              const Spacer(),
            
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Town',
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: kBlackColor,
                      ),
                    ),
                
                    Text(
                      'Orile-Agege',
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: kBlackColor.withOpacity(0.5),
                      ),
                    ),
                
                    Text(
                      'State',
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: kBlackColor,
                      ),
                    ),
                
                    Text(
                      'Lagos',
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: kBlackColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            
              SizedBox(
                width: 18.w,
              ),
            
              SvgPicture.asset(
                'assets/icons/ic-arrow-forward.svg',
                colorFilter: const ColorFilter.mode(kPrimaryColor, BlendMode.srcIn),
              ),
            ],
          ),
        ),
    
        SizedBox(
          height: 15.w,
        ),
            
        Container(
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(8.w),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 14.0,
          ),
          child: Row(
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Permanent Address',
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: kBlackColor,
                      ),
                    ),
                
                    Text(
                      '40B, Adematu Cole Street,',
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: kBlackColor.withOpacity(0.5),
                      ),
                    ),
                
                    Text(
                      'LGA',
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: kBlackColor,
                      ),
                    ),
                
                    Text(
                      'Agege',
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: kBlackColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            
              const Spacer(),
            
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Town',
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: kBlackColor,
                      ),
                    ),
                
                    Text(
                      'Orile-Agege',
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: kBlackColor.withOpacity(0.5),
                      ),
                    ),
                
                    Text(
                      'State',
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: kBlackColor,
                      ),
                    ),
                
                    Text(
                      'Lagos',
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: kBlackColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            
              SizedBox(
                width: 18.w,
              ),
            
              SvgPicture.asset(
                'assets/icons/ic-arrow-forward.svg',
                colorFilter: const ColorFilter.mode(kPrimaryColor, BlendMode.srcIn),
              ),
            ],
          ),
        ),
    
        SizedBox(
          height: 15.w,
        ),
            
        Container(
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(8.w),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 14.0,
          ),
          child: Row(
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Cooperative Name',
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: kBlackColor,
                      ),
                    ),
                
                    Text(
                      'Rotary Club 042',
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: kBlackColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            
              const Spacer(),
            
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Membership',
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: kBlackColor,
                      ),
                    ),
                
                    Text(
                      'Chairman',
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: kBlackColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            
              SizedBox(
                width: 18.w,
              ),
            
              SvgPicture.asset(
                'assets/icons/ic-arrow-forward.svg',
                colorFilter: const ColorFilter.mode(kPrimaryColor, BlendMode.srcIn),
              ),
            ],
          ),
        ),
    
        SizedBox(
          height: 15.w,
        ),
            
        Container(
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(8.w),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 14.0,
          ),
          child: Row(
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Govt. Registered Group',
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: kBlackColor,
                      ),
                    ),
    
                    Text(
                      '---',
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: kBlackColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
    
                    Text(
                      'Registration Number',
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: kBlackColor,
                      ),
                    ),
                
                    Text(
                      '---',
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: kBlackColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            
              const Spacer(),
            
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Membership',
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: kBlackColor,
                      ),
                    ),
                
                    Text(
                      '---',
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: kBlackColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            
              SizedBox(
                width: 18.w,
              ),
            
              SvgPicture.asset(
                'assets/icons/ic-arrow-forward.svg',
                colorFilter: const ColorFilter.mode(kPrimaryColor, BlendMode.srcIn),
              ),
            ],
          ),
        ),
    
        SizedBox(
          height: 15.w,
        ),
            
        Container(
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(8.w),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 14.0,
          ),
          child: Row(
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Account Name',
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: kBlackColor,
                      ),
                    ),
    
                    Text(
                      'A********* A****',
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: kBlackColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
    
                    Text(
                      'Bank Name',
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: kBlackColor,
                      ),
                    ),
                
                    Text(
                      '*********',
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: kBlackColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            
              const Spacer(),
            
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Account Number',
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: kBlackColor,
                      ),
                    ),
                
                    Text(
                      '023***901',
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: kBlackColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            
              SizedBox(
                width: 18.w,
              ),
            
              SvgPicture.asset(
                'assets/icons/ic-arrow-forward.svg',
                colorFilter: const ColorFilter.mode(kPrimaryColor, BlendMode.srcIn),
              ),
            ],
          ),
        ),
      ],
    );
  }
}