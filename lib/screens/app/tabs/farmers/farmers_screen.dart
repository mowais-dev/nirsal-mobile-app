import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide CarouselController;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nirsal/widgets/body_container.dart';
import 'package:nirsal/widgets/bvn_card.dart';
import 'package:nirsal/widgets/icon_sort_button.dart';

import '../../../../constants.dart';
import '../../../../widgets/collapsible_title_bar.dart';
import '../../../../widgets/request_card.dart';
import '../../../../widgets/search_button.dart';

class FarmerScreen extends StatefulWidget {
  const FarmerScreen({super.key});

  @override
  State<FarmerScreen> createState() => _FarmerScreenState();
}

class _FarmerScreenState extends State<FarmerScreen> {
  final CarouselSliderController _carouselController =
      CarouselSliderController();

  int currentSlider = 0;

  List items = [1, 2, 3];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: BodyContainer(
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
                top: 85.w,
                left: 20.w,
                right: 20.w,
              ),
              child: Column(
                children: [
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
                  SizedBox(
                    height: 5.w,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        items.length, (index) => buildDotNav(index: index)),
                  ),
                  SizedBox(
                    height: 65.w,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconSortButton(
                        onTap: () {},
                        text: 'By Category',
                        icon: 'assets/icons/ic-category.svg',
                        active: true,
                      ),
                      IconSortButton(
                        onTap: () {},
                        text: 'By Name',
                        icon: 'assets/icons/ic-category.svg',
                        active: false,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 27.w,
                  ),
                  CollapsibleTitleBar(
                    onTap: () {},
                    text: 'Bank Verification Number (BVN)',
                  ),
                  SizedBox(
                    height: 24.w,
                  ),
                  Expanded(
                    child: ListView.separated(
                      itemCount: 5,
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 10.w,
                        );
                      },
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        return const BVNCard();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
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
