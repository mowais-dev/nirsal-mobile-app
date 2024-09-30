import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nirsal/widgets/capture_farm_modal.dart';

import '../../../constants.dart';

class FarmTab extends StatefulWidget {
  const FarmTab({super.key});

  @override
  State<FarmTab> createState() => _FarmTabState();
}

class _FarmTabState extends State<FarmTab> {
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
                    'Ownership',
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: kBlackColor,
                    ),
                  ),
            
                  Text(
                    'Community',
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
                    'Type',
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: kBlackColor,
                    ),
                  ),
            
                  Text(
                    'Lease',
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
                colorFilter: const ColorFilter.mode(kBlackColor, BlendMode.srcIn),
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
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) {
                  return const CaptureFarmModal();
                }
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Size',
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: kBlackColor,
                      ),
                    ),
              
                    Text(
                      '3.718',
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
                      'Unit',
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: kBlackColor,
                      ),
                    ),
              
                    Text(
                      'Hectares',
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
                  colorFilter: const ColorFilter.mode(kBlackColor, BlendMode.srcIn),
                ),
              ],
            ),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Address',
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: kBlackColor,
                    ),
                  ),
            
                  Text(
                    '13, Community Road, ',
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: kBlackColor,
                      fontWeight: FontWeight.bold,
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
                    'Oji-River',
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
                    'Town',
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: kBlackColor,
                    ),
                  ),
            
                  Text(
                    'Achi',
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: kBlackColor,
                      fontWeight: FontWeight.bold,
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
                    'Enugu',
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
                colorFilter: const ColorFilter.mode(kBlackColor, BlendMode.srcIn),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Latitude',
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: kBlackColor,
                    ),
                  ),
            
                  Text(
                    '3.3618178',
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
                    'Longitude',
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: kBlackColor,
                    ),
                  ),
            
                  Text(
                    '6.5553812',
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
                colorFilter: const ColorFilter.mode(kBlackColor, BlendMode.srcIn),
              ),
            ],
          ),
        ),
      ],
    );
  }
}