import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:waiver_driver/app_colors/app_colors.dart';
import 'package:waiver_driver/assets/icons.dart';

import '../app_bar/app_bar.dart';
import '../app_routes/app_routes.dart';
import '../empty_page/empty_page.dart';
import '../faq_topics/faq_topic_model.dart';
import 'faq_listing_controller.dart';

class FaqListingScreen extends StatelessWidget {
  const FaqListingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(title: "FAQs"),
        body: FaqListingController.to.faqList.isEmpty
            ? EmptyPage(
                text: "No Faq found for this session",
              )
            : ListView(
                padding: EdgeInsets.symmetric(
                  horizontal: 15.sp,
                  vertical: 25.sp,
                ),
                children: FaqListingController.to.faqList
                    .map((topic) => FaqListingItem(faq: topic))
                    .toList()));
  }
}

class FaqListingItem extends StatelessWidget {
  Faq faq;
  FaqListingItem({required this.faq});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(AppRoutes.faqDetails, arguments: faq),
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
              faq.question ?? "",
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
            ),
            SvgPicture.asset(AppIcons.arrowRight)
          ],
        ),
      ),
    );
  }
}
