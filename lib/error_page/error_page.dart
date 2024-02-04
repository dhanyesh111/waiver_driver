import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:waiver_driver/app_buttons/app_buttons.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: 40.sp, right: 40.sp, top: 96.sp, bottom: 115.sp),
      height: Get.height,
      width: Get.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Image.asset(AppImages.error),
          GestureDetector(
              onTap: () {
                // Get.offAndToNamed(
                //     box.read(GetStorageConstants.userType) == UserType.sales
                //         ? AppRoutes.salesManHomePage
                //         : AppRoutes.approverHomePage);
              },
              child: const BlueButton(text: "BACK TO HOME"))
        ],
      ),
    );
  }
}
