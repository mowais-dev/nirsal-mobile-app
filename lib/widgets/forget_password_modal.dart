import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nirsal/constants.dart';

import '../routes.dart';
import 'primary_button.dart';

class ForgetPasswordModal extends StatefulWidget {
  const ForgetPasswordModal({super.key});

  @override
  State<ForgetPasswordModal> createState() => _ForgetPasswordModalState();
}

class _ForgetPasswordModalState extends State<ForgetPasswordModal> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 707.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.w),
          topRight: Radius.circular(25.w),
        ),
        border: Border.all(
          color: kPrimaryColor,
        ),
        color: kWhiteColor,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 45.w,
          vertical: 24.w,
        ),
        child: Column(
          children: [

            SizedBox(
              height: 70.w,
            ),

            SvgPicture.asset(
              'assets/icons/ic-email.svg',
            ),

            SizedBox(
              height: 32.w,
            ),

            Text(
              'Please enter your email address',
              style: TextStyle(
                color: kBlackColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(
              height: 32.w,
            ),

            TextFormField(
              decoration: InputDecoration(
                enabledBorder: kInputEnabledBorder,
                focusedBorder: kInputFocusedBorder,
                errorBorder: kInputErrorBorder,
                hintText: 'Type here',
                hintStyle: TextStyle(
                  color: kLightPrimaryColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp,
                )
              ),
            ),

            SizedBox(
              height: 38.w,
            ),

            PrimaryButton(
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, Routes.otpRoute);
              },
              text: 'submit',
              borderRadius: 17.w,
              color: kYellowColor,
              textColor: kBlackColor,
            ),

            SizedBox(
              height: 85.w,
            ),

            Image.asset(
              'assets/images/armserv-bw.png',
              width: 85.w,
            ),

            SizedBox(
              height: 30.w,
            ),

            Image.asset(
              'assets/images/poweredby.png',
              width: 64.w,
            ),
          ],
        ),
      ),
    );
  }
}