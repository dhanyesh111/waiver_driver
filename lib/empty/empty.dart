import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:waiver_driver/app_colors/app_colors.dart';

class EmptyPage extends StatelessWidget {
  final double? height;
  final double? width;
  const EmptyPage({super.key, this.height, this.width});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? Get.height,
      width: width ?? Get.width,
      child: Center(
          child: Text(
        "No Data available",
        style: TextStyle(fontSize: 25.sp, color: AppColors.grey93),
      )),
    );
  }
}
