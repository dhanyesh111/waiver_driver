import 'package:get/get.dart';
import 'package:waiver_driver/app_routes/app_routes.dart';
import 'package:waiver_driver/assets/icons.dart';

import '../left_menu_driver/left_menu_driver_model.dart';

class LeftMenuControllerFleet extends GetxController {
  static LeftMenuControllerFleet get to => Get.find();

  LeftMenuItemModel myEarning =
      LeftMenuItemModel(icon: AppIcons.wallet, text: 'My Profile');
  LeftMenuItemModel notification =
      LeftMenuItemModel(icon: AppIcons.bankDetails, text: 'notification');
  LeftMenuItemModel setting =
      LeftMenuItemModel(icon: AppIcons.setting, text: 'Setting');
  LeftMenuItemModel help = LeftMenuItemModel(icon: AppIcons.help, text: 'Help');
  LeftMenuItemModel logOut =
      LeftMenuItemModel(icon: AppIcons.logout, text: 'Logout');
  logout() {
    Get.offAllNamed(AppRoutes.welcome);
  }
}
