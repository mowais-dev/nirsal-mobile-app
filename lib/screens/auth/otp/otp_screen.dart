import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nirsal/widgets/body_container.dart';
import 'package:nirsal/widgets/primary_button.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../constants.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: BodyContainer(
        enableScroll: true,
        padding: const EdgeInsets.symmetric(
          vertical: kDefaultPadding,
          horizontal: 50.0,
        ),
        child: Column(
          children: [
            Image.asset(
              'assets/images/nirsal.png',
              width: 73.w,
            ),

            SizedBox(
              height: 60.w,
            ),

            SvgPicture.asset(
              'assets/icons/ic-check-mail.svg',
            ),

            SizedBox(
              height: 32.w,
            ),

            Text(
              'Check your email',
              style: TextStyle(
                color: kBlackColor,
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
              ),
            ),

            SizedBox(
              height: 48.w,
            ),

            Text(
              'Please enter the code sent to',
              style: TextStyle(
                color: kBlackColor.withOpacity(0.5),
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
              ),
            ),

            SizedBox(
              height: 8.w,
            ),

            Text(
              'Jefferson.iwobi@nirsal.com',
              style: TextStyle(
                color: kBlackColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.italic,
              ),
            ),

            SizedBox(
              height: 32.w,
            ),

            Padding(
              padding: EdgeInsets.only(
                top: 26.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PinCodeTextField(
                    appContext: context,
                    length: 4,
                    animationType: AnimationType.fade,
                    validator: (v) {
                      if (v!.length < 5) {
                        return "Please enter valid otp";
                      } else {
                        return null;
                      }
                    },
                    useHapticFeedback: true,
                    errorTextSpace: 20.w,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(10),
                      fieldHeight: 46.h,
                      fieldWidth: 54.h,
                      activeFillColor: Colors.white,
                      inactiveFillColor: kWhiteColor,
                      selectedFillColor: kWhiteColor,
                      selectedColor: kPrimaryColor,
                      activeColor: kWhiteColor,
                      inactiveColor: kPrimaryColor,
                      errorBorderColor: kRedColor,
                      borderWidth: 2,
                      selectedBorderWidth: 2,
                      activeBorderWidth: 2,
                      errorBorderWidth: 2,
                      disabledBorderWidth: 2,
                      inactiveBorderWidth: 2,
                    ),
                    textStyle: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.normal,
                    ),
                    cursorColor: Colors.black,
                    animationDuration: const Duration(milliseconds: 300),
                    enableActiveFill: true,
                    // errorAnimationController: errorController,
                    // controller: textEditingController,
                    keyboardType: TextInputType.number,
                    onCompleted: (v) {
                      debugPrint("Completed");
                    },
                    onChanged: (value) {
                      debugPrint(value);
                    },
                    beforeTextPaste: (text) {
                      return true;
                    },
                    enablePinAutofill: true,
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 25.w,
            ),

            PrimaryButton(
              onTap: () {
                // Navigator.pop(context);
                // Navigator.pushNamed(context, Routes.otpRoute);
              },
              text: 'update',
              borderRadius: 17.w,
              color: kYellowColor,
              textColor: kBlackColor,
            ),

            SizedBox(
              height: 25.w,
            ),

            Center(
              child: Text.rich(
                TextSpan(
                  text: 'New code available in ',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: kBlackColor.withOpacity(0.5),
                  ),
                  children: <InlineSpan>[
                    TextSpan(
                      text: '40s',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: kPrimaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(
              height: 60.w,
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