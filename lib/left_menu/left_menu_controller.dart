import 'package:get/get.dart';
import 'package:waiver_driver/app_routes/app_routes.dart';
import 'package:waiver_driver/assets/icons.dart';

import 'left_menu_model.dart';

class LeftMenuController extends GetxController {
  static LeftMenuController get to => Get.find();

  LeftMenuItemModel myEarning =
      LeftMenuItemModel(icon: AppIcons.wallet, text: 'My Earning');
  LeftMenuItemModel bankDetails =
      LeftMenuItemModel(icon: AppIcons.bankDetails, text: 'Bank Details');
  LeftMenuItemModel rating =
      LeftMenuItemModel(icon: AppIcons.star, text: 'Rating');
  LeftMenuItemModel myRides =
      LeftMenuItemModel(icon: AppIcons.clock, text: 'My Rides');
  LeftMenuItemModel referAndEarn =
      LeftMenuItemModel(icon: AppIcons.referAndEarn, text: 'Refer And Earn');
  LeftMenuItemModel notification =
      LeftMenuItemModel(icon: AppIcons.notification, text: 'Notification');
  LeftMenuItemModel setting =
      LeftMenuItemModel(icon: AppIcons.setting, text: 'Setting');
  LeftMenuItemModel help = LeftMenuItemModel(icon: AppIcons.help, text: 'Help');
  LeftMenuItemModel logOut =
      LeftMenuItemModel(icon: AppIcons.logout, text: 'Logout');
  logout() {
    Get.offAllNamed(AppRoutes.welcome);
  }
}
