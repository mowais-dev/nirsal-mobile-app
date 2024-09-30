import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nirsal/screens/app/biometric/biometric.dart';
import 'package:nirsal/screens/app/farmtab/farm_tab.dart';
import 'package:nirsal/widgets/body_container.dart';
import 'package:nirsal/widgets/farmer_avatar.dart';
import 'package:nirsal/widgets/primary_button.dart';

import '../../../constants.dart';
import '../../../widgets/search_button.dart';
import '../farmer_profile/farmer_profile.dart';
import '../programm/programme_tab.dart';

class EditFarmerScreen extends StatefulWidget {
  const EditFarmerScreen({super.key});

  @override
  State<EditFarmerScreen> createState() => _EditFarmerScreenState();
}

class _EditFarmerScreenState extends State<EditFarmerScreen> {

  int activeTab = 0;
  int activeSubTab = 1;

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
        title: Container(
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
            'Edit Farmer',
            style: TextStyle(
              color: kWhiteColor,
              fontWeight: FontWeight.bold,
              fontSize: 15.sp,
            ),
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: BodyContainer(
        enableScroll: true,
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
                top: 90.w,
                left: 20.w,
                right: 20.w,
              ),
              child: Column(
                children: [
                  const FarmerAvatar(),
                  
                  SizedBox(
                    height: 32.w,
                  ),
        
                  Container(
                    decoration: BoxDecoration(
                      color: kGreenShade1,
                      borderRadius: BorderRadius.circular(6.w),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 8.w,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            'Application\nDate',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: kTextColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
        
                        Expanded(
                          flex: 2,
                          child: Text(
                            'Application\nStatus',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: kTextColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
        
                        Expanded(
                          flex: 2,
                          child: Text(
                            'Application\nNumber',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: kTextColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
        
                  SizedBox(
                    height: 19.w,
                  ),
        
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 8.w,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            '27-Aug-2024',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: kBlackColor.withOpacity(0.5),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
        
                        Expanded(
                          flex: 2,
                          child: Text(
                            'PENDING',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: kBlueColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
        
                        Expanded(
                          flex: 2,
                          child: Text(
                            '092NK1K',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: kBlackColor.withOpacity(0.5),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
        
                  SizedBox(
                    height: 8.w,
                  ),
        
                  Container(
                    decoration: BoxDecoration(
                      color: kGreenShade1,
                      borderRadius: BorderRadius.circular(6.w),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 8.w,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            decoration: BoxDecoration(
                              color: activeTab == 1 ? kWhiteColor.withOpacity(0.7) : null,
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            margin: const EdgeInsets.only(right: 20.0),
                            padding: const EdgeInsets.only(left: 10.0),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  activeTab = 1;
                                });
                              },
                              child: Text(
                                'Farmer\nProfile',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: kTextColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
        
                        Expanded(
                          flex: 2,
                          child: Container(
                            decoration: BoxDecoration(
                              color: activeTab == 2 ? kWhiteColor.withOpacity(0.7) : null,
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            margin: const EdgeInsets.only(right: 20.0),
                            padding: const EdgeInsets.only(left: 10.0),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  activeTab = 2;
                                });
                              },
                              child: Text(
                                'Input\nDistribution',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: kTextColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
        
                        Expanded(
                          flex: 2,
                          child: Container(
                            decoration: BoxDecoration(
                              color: activeTab == 3 ? kWhiteColor.withOpacity(0.7) : null,
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            margin: const EdgeInsets.only(right: 20.0),
                            padding: const EdgeInsets.only(left: 10.0),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  activeTab = 3;
                                });
                              },
                              child: Text(
                                'Produce\nAggregation',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: kTextColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
        
                  SizedBox(
                    height: 8.w,
                  ),
        
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          TextButton(
                            onPressed: () {
                              setState(() {
                                activeSubTab = 1;
                              });
                            },
                            style: const ButtonStyle(
                              padding: WidgetStatePropertyAll(EdgeInsets.zero),
                              minimumSize: WidgetStatePropertyAll(Size(0, 0)),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: Text(
                              'Program',
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: kGreenShade1,
                              ),
                            )
                          ),
                      
                          if (activeSubTab == 1) ...[
                            Container(
                              width: 70.w,
                              height: 2,
                              color: kGreenShade1,
                            ),
                          ],
                        ],
                      ),
        
                      Column(
                        children: [
                          TextButton(
                            onPressed: () {
                              setState(() {
                                activeSubTab = 2;
                              });
                            },
                            style: const ButtonStyle(
                              padding: WidgetStatePropertyAll(EdgeInsets.zero),
                              minimumSize: WidgetStatePropertyAll(Size(0, 0)),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: Text(
                              'Profile',
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: kGreenShade1,
                              ),
                            )
                          ),
                      
                          if (activeSubTab == 2) ...[
                            Container(
                              width: 70.w,
                              height: 2,
                              color: kGreenShade1,
                            ),
                          ],
                        ],
                      ),
        
                      Column(
                        children: [
                          TextButton(
                            onPressed: () {
                              setState(() {
                                activeSubTab = 3;
                              });
                            },
                            style: const ButtonStyle(
                              padding: WidgetStatePropertyAll(EdgeInsets.zero),
                              minimumSize: WidgetStatePropertyAll(Size(0, 0)),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: Text(
                              'Biometrics',
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: kGreenShade1,
                              ),
                            )
                          ),
                      
                          if (activeSubTab == 3) ...[
                            Container(
                              width: 70.w,
                              height: 2,
                              color: kGreenShade1,
                            ),
                          ],
                        ],
                      ),
        
                      Column(
                        children: [
                          TextButton(
                            onPressed: () {
                              setState(() {
                                activeSubTab = 4;
                              });
                            },
                            style: const ButtonStyle(
                              padding: WidgetStatePropertyAll(EdgeInsets.zero),
                              minimumSize: WidgetStatePropertyAll(Size(0, 0)),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: Text(
                              'Farm',
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: kGreenShade1,
                              ),
                            )
                          ),
                      
                          if (activeSubTab == 4) ...[
                            Container(
                              width: 70.w,
                              height: 2,
                              color: kGreenShade1,
                            ),
                          ],
                        ],
                      ),
                    ],
                  ),
        
                  SizedBox(
                    height: 15.w,
                  ),
        
                  Container(
                    decoration: BoxDecoration(
                      color: kLightGrayShade3,
                      borderRadius: BorderRadius.circular(8.w),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 16.0,
                    ),
                    child: Column(
                      children: [
                        if (activeSubTab == 1) ...[
                          const ProgramTab(),
                        ],

                        if (activeSubTab == 2) ...[
                          const FarmerProfileTab(),
                        ],

                        if (activeSubTab == 3) ...[
                          const BiometricTab(),
                        ],

                        if (activeSubTab == 4) ...[
                          const FarmTab(),
                        ],
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 20.w,
                  ),

                  if (activeSubTab == 4) ...[
                    Row(
                      children: [
                        Expanded(
                          child: PrimaryButton(
                            onTap: () {},
                            text: 'Update',
                            color: kYellowColor,
                            borderRadius: 17.w,
                            textColor: kBlackColor,
                          ),
                        ),

                        SizedBox(
                          width: 50.w,
                        ),

                        Expanded(
                          child: PrimaryButton(
                            onTap: () {},
                            text: 'validate',
                            color: kBlueColor,
                            borderRadius: 17.w,
                            textColor: kWhiteColor,
                          ),
                        ),
                      ],
                    )
                  ],

                  SizedBox(
                    height: 20.w,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}