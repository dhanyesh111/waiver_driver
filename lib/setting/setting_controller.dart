import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waiver_driver/api_services/api_services.dart';
import 'package:waiver_driver/app_routes/app_routes.dart';
import 'package:waiver_driver/assets/icons.dart';
import 'package:waiver_driver/loading_animation/loading_animation.dart';
import 'package:waiver_driver/main.dart';
import 'package:waiver_driver/setting/setting_model.dart';

import '../snackbar/snackbar.dart';

class SettingControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingController());
  }
}

class SettingController extends GetxController {
  static SettingController get to => Get.find();

  SettingItemModel preferencesItem = SettingItemModel(
      header: "Preferences",
      text: "Manage preferences",
      icon: AppIcons.preferences);
  SettingItemModel darkModeItem = SettingItemModel(
      header: "Dark Mode", text: "Switch dark mode", icon: AppIcons.darkMode);
  SettingItemModel logoutItem = SettingItemModel(
      header: "Logout", text: "Logout your account", icon: AppIcons.logout);
  SettingItemModel deleteAccountItem = SettingItemModel(
      header: "Delete Account",
      text: "Delete all your data",
      icon: AppIcons.delete);

  changeDarkMode() {}
  logoutUser() {
    Get.showOverlay(
        loadingWidget: LoadingBarsAnimation(),
        asyncFunction: () async => logout());
  }

  logout() async {
    try {
      var response = await ApiServices.logout(body: {});
      if (response.status == 200) {
        Get.offAndToNamed(AppRoutes.driverTypeSelection);
        await box.erase();
      } else {
        Get.showSnackbar(GetSnackBar(
            duration: const Duration(seconds: 5),
            backgroundColor: Colors.transparent,
            padding: EdgeInsets.zero,
            messageText: AppSnackBar(text: response.message ?? "")));
      }
    } catch (error) {
      Get.showSnackbar(const GetSnackBar(
          duration: Duration(seconds: 5),
          backgroundColor: Colors.transparent,
          padding: EdgeInsets.zero,
          messageText: AppSnackBar(text: "OOPS Something went wrong")));
    }
  }

  deleteAccount() async {
    try {
      var response = await ApiServices.deleteAccount(body: {});
      if (response.status == 200) {
        Get.offAndToNamed(AppRoutes.driverTypeSelection);
        await box.erase();
      } else {
        Get.showSnackbar(GetSnackBar(
            duration: const Duration(seconds: 5),
            backgroundColor: Colors.transparent,
            padding: EdgeInsets.zero,
            messageText: AppSnackBar(text: response.message ?? "")));
      }
    } catch (error) {
      Get.showSnackbar(const GetSnackBar(
          duration: Duration(seconds: 5),
          backgroundColor: Colors.transparent,
          padding: EdgeInsets.zero,
          messageText: AppSnackBar(text: "OOPS Something went wrong")));
    }
  }

  deleteUser() {
    Get.showOverlay(
        loadingWidget: LoadingBarsAnimation(),
        asyncFunction: () async => deleteAccount());
  }
}
