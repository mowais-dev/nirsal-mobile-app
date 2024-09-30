import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 26.w,
      height: 26.w,
      child: Material(
        color: kSearchColor,
        borderRadius: BorderRadius.circular(13.w),
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(13.w),
          child: SvgPicture.asset(
            'assets/icons/ic-search.svg',
            width: 10.w,
            height: 10.w,
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
    );
  }
}