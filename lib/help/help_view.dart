import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:waiver_driver/app_bar/app_bar.dart';
import 'package:waiver_driver/help/help_controller.dart';
import 'package:waiver_driver/help/help_model.dart';

import '../app_colors/app_colors.dart';
import '../app_routes/app_routes.dart';
import '../assets/icons.dart';
import '../circle_with_gradient/circle_with_gradient.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(title: "Help", actions: [
          GestureDetector(
              onTap: () => Get.toNamed(AppRoutes.help),
              child: Container(
                  margin: EdgeInsets.all(10.sp),
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: AppColors.grey155, width: 1.5.sp),
                      shape: BoxShape.circle),
                  padding: EdgeInsets.all(5.sp),
                  child: Image.asset(
                    AppIcons.customerSupport,
                  )))
        ]),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 25.sp),
          children: [
            HelpListingItem(
              helpItem: HelpController.to.myAccount,
            ),
            SizedBox(height: 15.sp),
            HelpListingItem(
              helpItem: HelpController.to.fares,
            ),
            SizedBox(height: 15.sp),
            HelpListingItem(
              helpItem: HelpController.to.waiverRewards,
            ),
            SizedBox(height: 15.sp),
            HelpListingItem(
              helpItem: HelpController.to.safety,
            ),
            SizedBox(height: 15.sp),
          ],
        ));
  }
}

class HelpListingItem extends StatelessWidget {
  HelpItemModel helpItem;

  HelpListingItem({required this.helpItem});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(AppRoutes.faq, arguments: helpItem.text),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 6.sp),
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.grey155, width: 1.5.sp),
            borderRadius: BorderRadius.circular(8.sp)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleWithIcon(
                    height: 43.sp,
                    color: AppColors.grey249,
                    child: Image.asset(
                      helpItem.icon,
                      color: AppColors.black,
                      height: 25.sp,
                    )),
                SizedBox(
                  width: 12.sp,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      helpItem.header,
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 2.sp,
                    ),
                    Text(
                      helpItem.text,
                      style:
                          TextStyle(fontSize: 12.sp, color: AppColors.grey93),
                    ),
                  ],
                )
              ],
            ),
            Container(
                padding: EdgeInsets.only(right: 8.sp),
                child: SvgPicture.asset(AppIcons.arrowRight))
          ],
        ),
      ),
    );
  }
}
