import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:waiver_driver/app_colors/app_colors.dart';
import 'package:waiver_driver/assets/icons.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.all(40.sp),
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [AppColors.blue, AppColors.blue12],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 70.sp,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AppIcons.appLogo),
              SvgPicture.asset(AppIcons.waiverText),
            ],
          ),
          Image.asset(
            AppIcons.fromDriverify,
            height: 70.sp,
          )
          //TODO
          //replace with svg
        ],
      ),
    ));
  }
}
