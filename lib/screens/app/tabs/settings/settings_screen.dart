import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nirsal/constants.dart';
import 'package:nirsal/providers/auth_provider.dart';
import 'package:nirsal/routes.dart';
import 'package:nirsal/widgets/body_container.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool offlineReading = false;

  @override
  Widget build(BuildContext context) {
    return BodyContainer(
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: SvgPicture.asset(
              'assets/images/shape-sm.svg',
              width: 1.sw,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 100.w,
              left: 20.w,
              right: 20.w,
            ),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(14.0),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 17.0,
                    vertical: 12.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Profile Name',
                            style: TextStyle(
                              color: kWhiteColor,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'Jefferson Iwobi',
                            style: TextStyle(
                              color: kWhiteColor,
                              fontSize: 12.sp,
                            ),
                          ),
                          SizedBox(
                            height: 8.w,
                          ),
                          Text(
                            'Telephone',
                            style: TextStyle(
                              color: kWhiteColor,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            '08099513733',
                            style: TextStyle(
                              color: kWhiteColor,
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Email',
                            style: TextStyle(
                              color: kWhiteColor,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'Jefferson.iwobi@nirsal.com',
                            style: TextStyle(
                              color: kWhiteColor,
                              fontSize: 12.sp,
                            ),
                          ),
                          SizedBox(
                            height: 8.w,
                          ),
                          Text(
                            '',
                            style: TextStyle(
                              color: kWhiteColor,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            '',
                            style: TextStyle(
                              color: kWhiteColor,
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                              'assets/icons/ic-arrow-forward.svg')),
                    ],
                  ),
                ),
                SizedBox(
                  height: 18.w,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(14.0),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 17.0,
                    vertical: 12.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Cache',
                            style: TextStyle(
                              color: kWhiteColor,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            '9.57MB',
                            style: TextStyle(
                              color: kWhiteColor,
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                              'assets/icons/ic-arrow-forward.svg')),
                    ],
                  ),
                ),
                SizedBox(
                  height: 18.w,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(14.0),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 17.0,
                    vertical: 12.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Offline Reading',
                        style: TextStyle(
                          color: kWhiteColor,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Switch(
                        value: offlineReading,
                        onChanged: (value) {
                          setState(() {
                            offlineReading = value;
                          });
                        },
                        activeColor: kWhiteColor,
                        activeTrackColor: kActivePrimaryColor,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 18.w,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kRedColor,
                      foregroundColor: kWhiteColor,
                      padding: EdgeInsets.symmetric(vertical: 14.w),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.w),
                      ),
                    ),
                    onPressed: () async {
                      await Provider.of<AuthProvider>(context, listen: false)
                          .logout();
                      if (!mounted) return;
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        Routes.welcomeRoute,
                        (route) => false,
                      );
                    },
                    child: const Text(
                      'Logout',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
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
