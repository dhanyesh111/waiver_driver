import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:waiver_driver/app_bar/app_bar.dart';
import 'package:waiver_driver/app_network_image/app_network_image.dart';
import 'package:waiver_driver/error_page/error_page.dart';
import 'package:waiver_driver/help/help_controller.dart';
import 'package:waiver_driver/help/help_model.dart';
import 'package:waiver_driver/loading_animation/loading_animation.dart';

import '../app_colors/app_colors.dart';
import '../app_routes/app_routes.dart';
import '../assets/icons.dart';
import '../circle_with_gradient/circle_with_gradient.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(title: "Help"),
        body: GetX<HelpController>(builder: (controller) {
          return controller.isLoading.value
              ? LoadingBarsAnimation()
              : controller.isError.value
                  ? ErrorPage()
                  : ListView(
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.sp, vertical: 25.sp),
                      children: controller.helpCategories
                          .map((helpCategory) =>
                              HelpListingItem(helpCategory: helpCategory))
                          .toList(),
                    );
        }));
  }
}

class HelpListingItem extends StatelessWidget {
  HelpCategory helpCategory;

  HelpListingItem({required this.helpCategory});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(AppRoutes.faq, arguments: helpCategory.id),
      child: Container(
        margin: EdgeInsets.only(bottom: 20.sp),
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
                    child: AppNetworkImage(
                      imageUrl: helpCategory.icon ?? "",
                      height: 25.sp,
                      width: 25.sp,
                    )),
                SizedBox(
                  width: 12.sp,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      helpCategory.title ?? "",
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 2.sp,
                    ),
                    Text(
                      helpCategory.content ?? "",
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
