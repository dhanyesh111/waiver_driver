import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:waiver_driver/app_buttons/app_buttons.dart';
import 'package:waiver_driver/app_colors/app_colors.dart';
import 'package:waiver_driver/app_routes/app_routes.dart';
import 'package:waiver_driver/assets/icons.dart';
import 'package:waiver_driver/left_menu/left_menu_controller.dart';

import 'left_menu_model.dart';

class LeftMenu extends StatelessWidget {
  const LeftMenu({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LeftMenuController());
    return Container(
      width: Get.width * .7,
      height: Get.height,
      padding: EdgeInsets.symmetric(horizontal: 25.sp),
      decoration: BoxDecoration(color: AppColors.white),
      child: ListView(
        shrinkWrap: true,
        children: [
          SizedBox(
            height: 20.sp,
          ),
          Row(
            children: [
              Builder(builder: (context) {
                return BackArrow(onTap: () => Get.back());
              }),
            ],
          ),
          SizedBox(
            height: 25.sp,
          ),
          Text(
            "Menu",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30.sp),
          ),
          SizedBox(
            height: 25.sp,
          ),
          const LeftMenuProfileItem(),
          SizedBox(
            height: 14.sp,
          ),
          LeftMenuItem(
            item: LeftMenuController.to.myEarning,
            onTap: () => Get.offAndToNamed(AppRoutes.earning),
          ),
          SizedBox(
            height: 30.sp,
          ),
          LeftMenuItem(
            item: LeftMenuController.to.bankDetails,
            onTap: () => Get.offAndToNamed(AppRoutes.bankAccount),
          ),
          SizedBox(
            height: 30.sp,
          ),
          LeftMenuItem(
            item: LeftMenuController.to.rating,
            onTap: () => Get.offAndToNamed(AppRoutes.rating),
          ),
          SizedBox(
            height: 30.sp,
          ),
          LeftMenuItem(
            item: LeftMenuController.to.myRides,
            onTap: () => Get.offAndToNamed(AppRoutes.myRides),
          ),
          SizedBox(
            height: 30.sp,
          ),
          LeftMenuItem(
            item: LeftMenuController.to.referAndEarn,
            onTap: () => Get.offAndToNamed(AppRoutes.referAndEarn),
          ),
          SizedBox(
            height: 30.sp,
          ),
          LeftMenuItem(
            item: LeftMenuController.to.notification,
            onTap: () => Get.offAndToNamed(AppRoutes.notification),
          ),
          SizedBox(
            height: 30.sp,
          ),
          LeftMenuItem(
            item: LeftMenuController.to.setting,
            onTap: () => Get.offAndToNamed(AppRoutes.setting),
          ),
          SizedBox(
            height: 30.sp,
          ),
          LeftMenuItem(
            item: LeftMenuController.to.help,
            onTap: () => Get.offAndToNamed(AppRoutes.help),
          ),
          SizedBox(
            height: 30.sp,
          ),
          LeftMenuItem(
            item: LeftMenuController.to.logOut,
            onTap: () => LeftMenuController.to.logout(),
          )
        ],
      ),
    );
  }
}

class LeftMenuProfileItem extends StatelessWidget {
  const LeftMenuProfileItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.offAndToNamed(AppRoutes.profile),
      child: Container(
        color: AppColors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Image.asset(
                      AppIcons.user,
                      height: 20.sp,
                    ),
                    SizedBox(
                      width: 10.sp,
                    ),
                    Text(
                      "My Profile",
                      style: TextStyle(
                        fontSize: 16.sp,
                        height: 1,
                      ),
                    ),
                  ],
                ),
                SvgPicture.asset(
                  AppIcons.arrowRight,
                  height: 18.sp,
                )
              ],
            ),
            SizedBox(
              height: 5.sp,
            ),
            Container(
              padding: EdgeInsets.only(left: 30.sp),
              child: Text(
                "#1234567",
                style: TextStyle(
                    fontSize: 12.sp, color: AppColors.grey93.withOpacity(0.5)),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class LeftMenuItem extends StatelessWidget {
  LeftMenuItemModel item;
  void Function()? onTap;
  LeftMenuItem({required this.item, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: AppColors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Image.asset(
                  item.icon,
                  color: AppColors.black,
                  height: 20.sp,
                ),
                SizedBox(
                  width: 10.sp,
                ),
                Text(
                  item.text,
                  style: TextStyle(
                    fontSize: 16.sp,
                    height: 1,
                  ),
                ),
              ],
            ),
            SvgPicture.asset(
              AppIcons.arrowRight,
              height: 18.sp,
            )
          ],
        ),
      ),
    );
  }
}
