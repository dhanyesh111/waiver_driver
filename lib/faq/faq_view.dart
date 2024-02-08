import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:waiver_driver/app_colors/app_colors.dart';
import 'package:waiver_driver/assets/icons.dart';
import 'package:waiver_driver/faq/faq_controller.dart';

import '../app_bar/app_bar.dart';
import '../app_routes/app_routes.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(title: "FAQs", actions: [
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
            padding: EdgeInsets.symmetric(
              horizontal: 15.sp,
              vertical: 25.sp,
            ),
            children: FaqController.to.faqTopics
                .map((topic) => FaqListingItem(topic: topic))
                .toList()));
  }
}

class FaqListingItem extends StatelessWidget {
  String topic;
  FaqListingItem({required this.topic});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(AppRoutes.faqDetails),
      child: Container(
        padding: EdgeInsets.all(14.sp),
        margin: EdgeInsets.only(bottom: 15.sp),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.grey155, width: 1.5.sp),
          borderRadius: BorderRadius.circular(8.sp),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              topic,
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
            ),
            SvgPicture.asset(AppIcons.arrowRight)
          ],
        ),
      ),
    );
  }
}
