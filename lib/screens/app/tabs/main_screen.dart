import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nirsal/constants.dart';
import 'package:nirsal/screens/app/tabs/dashboard/dashboard.dart';
import 'package:nirsal/screens/app/tabs/farmers/farmers_screen.dart';
import 'package:nirsal/screens/app/tabs/home/home_screen.dart';
import 'package:nirsal/screens/app/tabs/settings/settings_screen.dart';
import '../../../widgets/search_button.dart';
import '../../../widgets/tab_button.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int selectedTab = 0;

  List<Widget> screens = [
    const Dashboard(),
    const HomeScreen(),
    const FarmerScreen(),
    const SettingScreen(),
  ];

  String getTitle() {
    if (selectedTab == 1) {
      return 'Recent Updates';
    } else if (selectedTab == 3) {
      return 'Settings';
    }

    return '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        actions: const [
          Padding(
            padding: EdgeInsets.only(
              right: 30.0,
            ),
            child: SearchButton(),
          ),
        ],
        title: selectedTab != 0 ? Container(
          width: double.infinity,
          height: 43.w,
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(9),
            gradient: const LinearGradient(
              colors: [
                kPrimaryColor,
                kLightGreenShade
              ]
            )
          ),
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(
            left: 23.0,
          ),
          child: Text(
            getTitle(),
            style: TextStyle(
              color: kWhiteColor,
              fontWeight: FontWeight.bold,
              fontSize: 15.sp,
            ),
          ),
        ) : null,
      ),
      body: screens[selectedTab],
      extendBodyBehindAppBar: true,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(10.w),
        child: SizedBox(
          width: double.infinity,
          height: 80.w,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  height: 80.w,
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(22.w),
                    gradient: LinearGradient(
                      colors: [
                        kPrimaryColor.withOpacity(0.5),
                        kPrimaryColor.withOpacity(0.6),
                        kPrimaryColor,
                        kPrimaryColor,
                        kPrimaryColor.withOpacity(0.6),
                        kPrimaryColor.withOpacity(0.5),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: const [
                        0, 0.1, 0.3, 0.7, 0.9, 1
                      ]
                    )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 5.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TabButton(
                          icon: 'assets/icons/ic-home.svg',
                          title: 'Home',
                          active: selectedTab == 0,
                          onTap: () {
                            setState(() {
                              selectedTab = 0;
                            });
                          },
                        ),
                
                        TabButton(
                          icon: 'assets/icons/ic-users.svg',
                          title: 'Farmers',
                          active: selectedTab == 1,
                          onTap: () {
                            setState(() {
                              selectedTab = 1;
                            });
                          },
                        ),
                
                        // SizedBox(
                        //   width: 30.w,
                        // ),
                
                        TabButton(
                          icon: 'assets/icons/ic-bell.svg',
                          title: 'Alerts',
                          active: selectedTab == 2,
                          onTap: () {
                            setState(() {
                              selectedTab = 2;
                            });
                          },
                        ),
                
                        TabButton(
                          icon: 'assets/icons/ic-settings.svg',
                          title: 'Settings',
                          active: selectedTab == 3,
                          onTap: () {
                            setState(() {
                              selectedTab = 3;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Align(
              //   alignment: Alignment.topCenter,
              //   child: SizedBox(
              //     width: 80.w,
              //     height: 80.w,
              //     child: DiamondButton(
              //       size: 80.w,
              //       color: kPrimaryColor,
              //       onTap: () {
                      
              //       },
              //       borderColor: kWhiteColor,
              //       borderWidth: 10,
              //       child: Transform.rotate(
              //         angle: (-45 * math.pi / 180),
              //         child: SvgPicture.asset(
              //           'assets/icons/ic-camera.svg',
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}