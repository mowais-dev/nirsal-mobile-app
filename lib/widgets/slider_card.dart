import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants.dart';

class SliderCard extends StatelessWidget {
  const SliderCard({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.time,
    required this.color,
  });

  final String image;
  final String title;
  final String description;
  final String time;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(11.w),
      ),
      padding: EdgeInsets.all(13.w),
      child: Row(
        children: [
          Image.asset(
            image,
            width: 58.w,
            height: 58.w,
          ),
    
          SizedBox(
            width: 9.w,
          ),
    
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      '$title - ',
                      style: TextStyle(
                        fontSize: 17.sp,
                        color: kBlackColor,
                      ),
                    ),
            
                    Text(
                      'Index Report',
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: kBlackColor,
                      ),
                    ),
                  ],
                ),
            
                Flexible(
                  child: Text(
                    description,
                    style: TextStyle(
                      fontSize: 8.sp,
                      color: kBlackColor,
                    ),
                  ),
                ),
    
                SizedBox(
                  height: 10.w,
                ),
    
                Text(
                  'Last Updated',
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: kBlackColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
    
                Text(
                  time,
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: kBlackColor,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}