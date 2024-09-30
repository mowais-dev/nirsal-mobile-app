import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nirsal/helpers/util_helper.dart';
import 'package:nirsal/providers/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../constants.dart';

class UserData extends StatelessWidget {
  const UserData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authProvider, child) {
        return Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30.w),
              child: authProvider.authUser!.profilePhoto == null ? Image.asset(
                'assets/images/avatar.png',
                width: 60.w,
                height: 60.w,
                fit: BoxFit.cover,
              ) : CachedNetworkImage(
                  imageUrl: authProvider.authUser!.profilePhoto!,
                  httpHeaders: const {
                    'Connection': 'Keep-Alive',
                  },
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                      width: 60.w,
                      height: 60.w,
                      color: kWhiteColor,
                    ),
                  ),
                  errorWidget: (context, url, error) {
                    return const Icon(Icons.error);
                  },
                  width: 60.w,
                  height: 60.w,
                  fit: BoxFit.cover,
                ),
            ),
        
            SizedBox(
              width: 14.w,
            ),
        
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${Utils.getGreeting()}, ${authProvider.authUser!.fullName}',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: kBlackColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        
                Text(
                  authProvider.authUser!.email,
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: kBlackColor,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
        
                Text(
                  'Anambra East LGA',
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: kBlackColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )
          ],
        );
      }
    );
  }
}