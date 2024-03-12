import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:waiver_driver/app_bar/app_bar.dart';
import 'package:waiver_driver/app_buttons/app_buttons.dart';
import 'package:waiver_driver/setting/setting_controller.dart';
import 'package:waiver_driver/setting/setting_model.dart';

import '../app_colors/app_colors.dart';
import '../app_routes/app_routes.dart';
import '../assets/icons.dart';
import '../circle_with_gradient/circle_with_gradient.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(title: "Setting", actions: [
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
          padding: EdgeInsets.symmetric(horizontal: 13.sp),
          children: [
            SizedBox(
              height: 20.sp,
            ),
            SettingListingItem(
              setting: SettingController.to.preferencesItem,
              onTap: () => Get.toNamed(AppRoutes.preferences),
            ),
            SizedBox(
              height: 15.sp,
            ),
            SettingListingItem(
              setting: SettingController.to.darkModeItem,
              onTap: () => Get.bottomSheet(const DarkModeBottomSheet()),
            ),
            SizedBox(
              height: 15.sp,
            ),
            SettingListingItem(
              setting: SettingController.to.logoutItem,
              onTap: () => Get.bottomSheet(LogoutBottomSheet()),
            ),
            SizedBox(
              height: 15.sp,
            ),
            SettingListingItem(
                setting: SettingController.to.deleteAccountItem,
                onTap: () => Get.bottomSheet(DeleteAccountBottomSheet())),
            SizedBox(
              height: 15.sp,
            ),
          ],
        ));
  }
}

class SettingListingItem extends StatelessWidget {
  SettingItemModel setting;
  void Function() onTap;
  SettingListingItem({required this.setting, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 6.sp),
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.grey155, width: 1.5.sp),
            borderRadius: BorderRadius.circular(8.sp)),
        child: Row(
          children: [
            CircleWithIcon(
                height: 43.sp,
                color: AppColors.grey249,
                child: Image.asset(
                  setting.icon,
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
                  setting.header,
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 2.sp,
                ),
                Text(
                  setting.text,
                  style: TextStyle(fontSize: 12.sp, color: AppColors.grey93),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class DarkModeBottomSheet extends StatelessWidget {
  const DarkModeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.sp),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8.sp),
            topRight: Radius.circular(8.sp),
          )),
      child: ListView(
        shrinkWrap: true,
        children: [
          Text(
            "Dark Mode ?",
            style: TextStyle(
                color: AppColors.black,
                fontWeight: FontWeight.w600,
                fontSize: 20.sp),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 5.sp,
          ),
          Text(
            "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy",
            style: TextStyle(color: AppColors.grey93, fontSize: 14.sp),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20.sp,
          ),
          BlueButton(
            text: "Dark Mode",
            onTap: () => SettingController.to.changeDarkMode(),
          ),
          SizedBox(
            height: 20.sp,
          ),
          WhiteButton(
            text: "Go Back",
            onTap: () => Get.back(),
          ),
        ],
      ),
    );
  }
}

class LogoutBottomSheet extends StatelessWidget {
  const LogoutBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.sp),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8.sp),
            topRight: Radius.circular(8.sp),
          )),
      child: ListView(
        shrinkWrap: true,
        children: [
          Text(
            "Log out ?",
            style: TextStyle(
                color: AppColors.black,
                fontWeight: FontWeight.w600,
                fontSize: 20.sp),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 5.sp,
          ),
          Text(
            "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy",
            style: TextStyle(color: AppColors.grey93, fontSize: 14.sp),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20.sp,
          ),
          RedButton(
            text: "Logout",
            onTap: () => SettingController.to.logoutUser(),
          ),
          SizedBox(
            height: 20.sp,
          ),
          WhiteButton(
            text: "Go Back",
            onTap: () => Get.back(),
          ),
        ],
      ),
    );
  }
}

class DeleteAccountBottomSheet extends StatelessWidget {
  const DeleteAccountBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.sp),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8.sp),
            topRight: Radius.circular(8.sp),
          )),
      child: ListView(
        shrinkWrap: true,
        children: [
          Text(
            "Delete Account ?",
            style: TextStyle(
                color: AppColors.black,
                fontWeight: FontWeight.w600,
                fontSize: 20.sp),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 5.sp,
          ),
          Text(
            "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy",
            style: TextStyle(color: AppColors.grey93, fontSize: 14.sp),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20.sp,
          ),
          RedButton(
            text: "Delete Account",
            onTap: () => SettingController.to.logoutUser(),
          ),
          SizedBox(
            height: 20.sp,
          ),
          WhiteButton(
            text: "Go Back",
            onTap: () => Get.back(),
          ),
        ],
      ),
    );
  }
}
