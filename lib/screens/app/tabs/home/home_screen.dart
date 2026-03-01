import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide CarouselController;
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nirsal/constants.dart';
import 'package:nirsal/widgets/body_container.dart';

import '../../../../widgets/assigned_card.dart';
import '../../../../widgets/notification_center.dart';
import '../../../../widgets/request_card.dart';
import '../../../../widgets/sort_button.dart';
import '../../../../widgets/tab_switch.dart';
import '../../../../widgets/user_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CarouselSliderController _carouselController =
      CarouselSliderController();

  int activeTab = 0;
  int assignedActiveTab = 0;
  int currentSlider = 0;

  List items = [1, 2, 3];

  @override
  Widget build(BuildContext context) {
    return BodyContainer(
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: SvgPicture.asset(
              'assets/images/shape.svg',
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
                const UserData(),
                SizedBox(
                  height: 16.w,
                ),
                const NotificationCenter(),
                SizedBox(
                  height: 15.w,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: kGreenShade1,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 4.0,
                    horizontal: 8.0,
                  ),
                  child: Row(
                    children: [
                      TabSwitch(
                        onTap: () {
                          setState(() {
                            activeTab = 0;
                          });
                        },
                        text: 'Finished',
                        active: activeTab == 0,
                        inactiveColor: kGreenShade1,
                        activeTextColor: kPrimaryColor,
                        activeColor: kLightGreenShade3,
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      TabSwitch(
                        onTap: () {
                          setState(() {
                            activeTab = 1;
                          });
                        },
                        text: 'Pending',
                        active: activeTab == 1,
                        inactiveColor: kGreenShade1,
                        activeTextColor: kPrimaryColor,
                        activeColor: kLightGreenShade3,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 19.w,
                ),
                SizedBox(
                  height: 195.h,
                  child: CarouselSlider(
                    options: CarouselOptions(
                      viewportFraction: 1,
                      autoPlay: false,
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentSlider = index;
                        });
                      },
                      height: 195.h,
                    ),
                    carouselController: _carouselController,
                    items: items
                        .map((item) => Container(
                              padding: const EdgeInsets.all(10.0),
                              child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  RequestCard(),
                                  RequestCard(),
                                  RequestCard(),
                                ],
                              ),
                            ))
                        .toList(),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      items.length, (index) => buildDotNav(index: index)),
                ),
                SizedBox(
                  height: 20.w,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: kYellowColor,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 4.0,
                    horizontal: 8.0,
                  ),
                  child: Row(
                    children: [
                      TabSwitch(
                        onTap: () {
                          setState(() {
                            assignedActiveTab = 0;
                          });
                        },
                        text: 'Assigned',
                        active: assignedActiveTab == 0,
                        inactiveColor: kYellowColor,
                        activeTextColor: kTextColor,
                        activeColor: kLightGrayShade3,
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      TabSwitch(
                        onTap: () {
                          setState(() {
                            assignedActiveTab = 1;
                          });
                        },
                        text: 'Deferred',
                        active: assignedActiveTab == 1,
                        inactiveColor: kYellowColor,
                        activeTextColor: kTextColor,
                        activeColor: kLightGrayShade3,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 23.w,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SortButton(
                      onTap: () {},
                      text: 'Name',
                    ),
                  ],
                ),
                SizedBox(
                  height: 14.w,
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: ListView.separated(
                      itemCount: 5,
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 10.w,
                        );
                      },
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        return const AssignedCard();
                      },
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  AnimatedContainer buildDotNav({required int index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      margin: const EdgeInsets.only(right: 4),
      height: 8.w,
      width: 8.w,
      decoration: BoxDecoration(
          color:
              currentSlider == index ? kBlackColor : kBlackColor.withAlpha(70),
          borderRadius: BorderRadius.circular(4)),
    );
  }
}
