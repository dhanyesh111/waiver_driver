import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:waiver_driver/app_colors/app_colors.dart';
import 'package:waiver_driver/assets/icons.dart';
import 'package:waiver_driver/empty_page/empty_page.dart';
import 'package:waiver_driver/error_page/error_page.dart';
import 'package:waiver_driver/loading_animation/loading_animation.dart';

import '../app_bar/app_bar.dart';
import '../app_routes/app_routes.dart';
import 'faq_topic_controller.dart';
import 'faq_topic_model.dart';

class FaqTopicsScreen extends StatelessWidget {
  const FaqTopicsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(title: "FAQs"),
        body: GetX<FaqController>(builder: (controller) {
          return controller.isLoading.value
              ? LoadingBarsAnimation()
              : controller.isError.value
                  ? ErrorPage()
                  : controller.faqTopics.isEmpty
                      ? EmptyPage(
                          text: "No Faq found for this session",
                        )
                      : ListView(
                          padding: EdgeInsets.symmetric(
                            horizontal: 15.sp,
                            vertical: 25.sp,
                          ),
                          children: FaqController.to.faqTopics
                              .map((topic) => FaqTopicListingItem(faq: topic))
                              .toList());
        }));
  }
}

class FaqTopicListingItem extends StatelessWidget {
  FaqModel faq;
  FaqTopicListingItem({required this.faq});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(AppRoutes.faqListing, arguments: faq.faqs),
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
              faq.title ?? "",
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
            ),
            SvgPicture.asset(AppIcons.arrowRight)
          ],
        ),
      ),
    );
  }
}
