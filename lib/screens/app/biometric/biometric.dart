import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants.dart';

class BiometricTab extends StatefulWidget {
  const BiometricTab({super.key});

  @override
  State<BiometricTab> createState() => _BiometricTabState();
}

class _BiometricTabState extends State<BiometricTab> {
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
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Passport Photograph',
                style: TextStyle(
                  fontSize: 13.sp,
                  color: kBlackColor,
                ),
              ),
                      
              SizedBox(
                height: 14.w,
              ),

              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.asset(
                    'assets/images/farmerpic.png',
                    width: 127.w,
                  ),
                ),
              ),

              SizedBox(
                height: 15.w,
              ),

              Center(
                child: TextButton(
                  onPressed: () {
                  },
                  style: const ButtonStyle(
                    padding: WidgetStatePropertyAll(EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 5.0,
                    )),
                    minimumSize: WidgetStatePropertyAll(Size(0, 0)),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    backgroundColor: WidgetStatePropertyAll(kLightGrayShade3),
                  ),
                  child: Text(
                    'Retake',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: kBlackColor,
                    ),
                  )
                ),
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
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Left Hand',
                style: TextStyle(
                  fontSize: 13.sp,
                  color: kBlackColor,
                ),
              ),

              SizedBox(
                height: 10.w,
              ),

              SizedBox(
                height: 160.w,
                child: ListView.separated(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: 15.w,
                    );
                  },
                  itemBuilder: (context, index) {
                    return const FingerPrintItem();
                  },
                ),
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
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Right Hand',
                style: TextStyle(
                  fontSize: 13.sp,
                  color: kBlackColor,
                ),
              ),

              SizedBox(
                height: 10.w,
              ),

              SizedBox(
                height: 160.w,
                child: ListView.separated(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: 15.w,
                    );
                  },
                  itemBuilder: (context, index) {
                    return const FingerPrintItem();
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class FingerPrintItem extends StatelessWidget {
  const FingerPrintItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/finger.png',
          width: 49.w,
        ),
    
        SizedBox(
          height: 9.w,
        ),
    
        Text(
          'IMG\n2023919282818',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 9.sp,
            color: kBlackColor,
            fontStyle: FontStyle.italic,
          ),
        ),
    
        SizedBox(
          height: 40.w,
        ),
    
        TextButton(
          onPressed: () {
          },
          style: const ButtonStyle(
            padding: WidgetStatePropertyAll(EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 5.0,
            )),
            minimumSize: WidgetStatePropertyAll(Size(0, 0)),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            backgroundColor: WidgetStatePropertyAll(kLightGrayShade3),
          ),
          child: Text(
            'Retake',
            style: TextStyle(
              fontSize: 13.sp,
              color: kBlackColor,
            ),
          )
        )
      ],
    );
  }
}