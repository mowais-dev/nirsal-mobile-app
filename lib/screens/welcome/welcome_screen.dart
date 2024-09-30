import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nirsal/constants.dart';
import 'package:nirsal/routes.dart';
import 'package:nirsal/widgets/body_container.dart';
import 'package:nirsal/widgets/primary_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyContainer(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 30.w,
            ),

            Image.asset(
              'assets/images/nirsal.png',
              width: 73.w,
            ),

            SizedBox(
              height: 80.w,
            ),

            Image.asset(
              'assets/images/armserv.png',
              width: 143.w,
            ),

            SizedBox(
              height: 23.w,
            ),

            Image.asset(
              'assets/images/welcome.png',
              width: 284.w,
            ),

            SizedBox(
              height: 51.w,
            ),

            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 83.w,
              ),
              child: PrimaryButton(
                onTap: () {
                  Navigator.pushNamed(context, Routes.loginRoute);
                },
                text: 'Get Started',
                color: kYellowColor,
                textColor: kBlackColor,
              ),
            ),

            const Spacer(),

            Image.asset(
              'assets/images/poweredby.png',
              width: 64.w,
            ),

            SizedBox(
              height: 10.w,
            ),
          ],
        ),
      ),
    );
  }
}