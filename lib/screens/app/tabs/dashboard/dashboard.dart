import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nirsal/widgets/body_container.dart';

import '../../../../constants.dart';
import '../../../../widgets/notification_center.dart';
import '../../../../widgets/request_card.dart';
import '../../../../widgets/search_button.dart';
import '../../../../widgets/slider_card.dart';
import '../../../../widgets/tab_switch.dart';
import '../../../../widgets/user_data.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  final CarouselController _carouselController = CarouselController();

  int currentSlider = 0;
  int assignedActiveTab = 0;
  
  List items = [1,2];

  @override
  Widget build(BuildContext context) {
    return BodyContainer(
      // enableScroll: true,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: SvgPicture.asset(
              'assets/images/shape-md.svg',
              width: 1.sw,
              fit: BoxFit.cover,
            ),
          ),

          Padding(
            padding: EdgeInsets.only(
              top: 75.w,
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
                  height: 27.w,
                ),

                SizedBox(
                  height: 126.h,
                  child: CarouselSlider(
                    options: CarouselOptions(
                      viewportFraction: 0.8,
                      autoPlay: false,
                      disableCenter: true,
                      enableInfiniteScroll: false,
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentSlider = index;
                        });
                      },
                      height: 126.h,
                      padEnds: false,
                    ),
                    carouselController: _carouselController,
                    items: [
                      Container(
                        padding: const EdgeInsets.only(right: 40.0),
                        child: const SliderCard(
                          image: 'assets/images/farmers.png',
                          title: 'Farmers',
                          description: 'Analyzes individual farmers\' performance, productivity, and sustainability',
                          time: '10 minutes ago',
                          color: kLightPurpleColor,
                        ),
                      ),

                      Container(
                        padding: const EdgeInsets.only(right: 40.0),
                        child: const SliderCard(
                          image: 'assets/images/farmers2.png',
                          title: 'Farms',
                          description: 'Analyzes farmer\'s farmlands productivity, and sustainability',
                          time: '10 minutes ago',
                          color: kCardColor,
                        ),
                      )
                    ]
                  ),
                ),

                SizedBox(
                  height: 24.w,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    items.length,
                    (index) => buildDotNav(index: index),
                  ),
                ),

                SizedBox(
                  height: 25.w,
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
                        text: 'Produce  Aggregation',
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
                        text: 'Input Distribution',
                        active: assignedActiveTab == 1,
                        inactiveColor: kYellowColor,
                        activeTextColor: kTextColor,
                        activeColor: kLightGrayShade3,
                        inactiveTextColor: kPrimaryColor,
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 12.w,
                ),

                Row(
                  children: [
                    SizedBox(
                      width: 50.w,
                    ),

                    Column(
                      children: [
                        TextButton(
                          onPressed: () {},
                          style: const ButtonStyle(
                            padding: WidgetStatePropertyAll(EdgeInsets.zero),
                            minimumSize: WidgetStatePropertyAll(Size(0, 0)),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: Text(
                            'Sales / Loan',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: kBlackColor,
                            ),
                          )
                        ),
                    
                        Container(
                          width: 90.w,
                          height: 2,
                          color: kBlackColor,
                        )
                      ],
                    ),

                    SizedBox(
                      width: 37.w,
                    ),

                     Column(
                      children: [
                        TextButton(
                          onPressed: () {},
                          style: const ButtonStyle(
                            padding: WidgetStatePropertyAll(EdgeInsets.zero),
                            minimumSize: WidgetStatePropertyAll(Size(0, 0)),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: Text(
                            'Harvest',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: kBlackColor,
                            ),
                          )
                        ),
                    
                        // Container(
                        //   width: 90.w,
                        //   height: 2,
                        //   color: kBlackColor,
                        // )
                      ],
                    ),

                    const Spacer(),

                    const SearchButton(),
                  ],
                ),

                SizedBox(
                  height: 17.w,
                ),

                Expanded(
                  child: ListView.separated(
                    itemCount: 10,
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 10.w,
                      );
                    },
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          color: kGreenCardColor,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 8.0,
                        ),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(25.w / 2),
                              child: Image.asset(
                                'assets/images/avatar.png',
                                width: 25.w,
                                height: 25.w,
                                fit: BoxFit.cover,
                              ),
                            ),

                            SizedBox(
                              width: 20.w,
                            ),
                  
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Nduka Michael (892****3928)',
                                  style: TextStyle(
                                    color: kBlackColor,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),

                                Text.rich(
                                  TextSpan(
                                    text: 'paid ',
                                    style: TextStyle(
                                      color: kBlackColor,
                                      fontSize: 8.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    children: <InlineSpan>[
                                      TextSpan(
                                        text: ' N27,029.98k',
                                        style: TextStyle(
                                          color: kBlackColor,
                                          fontSize: 11.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),

                                      TextSpan(
                                        text: ' out of',
                                        style: TextStyle(
                                          color: kBlackColor,
                                          fontSize: 8.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),

                                      TextSpan(
                                        text: ' N27,029.98k',
                                        style: TextStyle(
                                          color: kBlackColor,
                                          fontSize: 11.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      )
                                    ]
                                  )
                                ),
                              ],
                            ),

                            const Spacer(),

                            Text(
                              '12m ago',
                              style: TextStyle(
                                color: kBlackColor,
                                fontSize: 8.sp,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.italic,
                              ),
                            ),

                            SizedBox(
                              width: 10.w,
                            ),

                            SvgPicture.asset(
                              'assets/icons/ic-arrow-forward.svg',
                              colorFilter: const ColorFilter.mode(kBlackColor, BlendMode.srcIn),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
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
        color: currentSlider == index ? kBlackColor : kBlackColor.withAlpha(70),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}