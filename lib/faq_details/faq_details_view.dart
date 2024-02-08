import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:waiver_driver/app_colors/app_colors.dart';
import 'package:waiver_driver/faq_details/faq_details_controller.dart';

import '../app_bar/app_bar.dart';
import '../app_routes/app_routes.dart';
import '../assets/icons.dart';

class FaqDetailsScreen extends StatelessWidget {
  const FaqDetailsScreen({Key? key}) : super(key: key);

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
          padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 25.sp),
          children: [
            Text(
              FaqDetailsController.to.question,
              style: TextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp),
            ),
            SizedBox(
              height: 16.sp,
            ),
            Text(
              FaqDetailsController.to.answer,
              style: TextStyle(color: AppColors.grey93, fontSize: 12.sp),
            ),
          ],
        ));
  }
}
