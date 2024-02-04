import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../app_buttons/app_buttons.dart';
import '../app_colors/app_colors.dart';

AppBar appBar({required String title, bool? showMenuButton}) {
  return AppBar(
    backgroundColor: Colors.white,
    leading: (showMenuButton ?? false)
        ? Builder(
            builder: (context) => GestureDetector(
                  onTap: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                  child: Container(
                    padding: EdgeInsets.only(right: 15.sp, top: 15.sp),
                    child: Image.asset(
                      // AppIcons.menu,
                      "",
                      height: 25.sp,
                    ),
                  ),
                ))
        : Container(
            margin: EdgeInsets.all(10.sp),
            child: BackArrow(
              onTap: () => Get.back(),
            ),
          ),
    title: Text(
      title,
      style: TextStyle(color: AppColors.black, fontSize: 26.sp),
    ),
  );
}
