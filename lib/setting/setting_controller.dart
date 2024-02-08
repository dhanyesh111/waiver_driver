import 'package:get/get.dart';
import 'package:waiver_driver/assets/icons.dart';
import 'package:waiver_driver/setting/setting_model.dart';

class SettingControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingController());
  }
}

class SettingController extends GetxController {
  static SettingController get to => Get.find();

  SettingItemModel preferences = SettingItemModel(
      header: "Preferences",
      text: "Manage preferences",
      icon: AppIcons.preferences);
  SettingItemModel darkMode = SettingItemModel(
      header: "Dark Mode", text: "Switch dark mode", icon: AppIcons.darkMode);
  SettingItemModel logout = SettingItemModel(
      header: "Logout", text: "Logout your account", icon: AppIcons.logout);
  SettingItemModel deleteAccount = SettingItemModel(
      header: "Delete Account",
      text: "Delete all your data",
      icon: AppIcons.delete);

  changeDarkMode() {}
  logoutUser() {}
  deleteUser() {}
}
