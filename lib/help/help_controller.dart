import 'package:get/get.dart';
import 'package:waiver_driver/assets/icons.dart';
import 'package:waiver_driver/help/help_model.dart';

class HelpControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HelpController());
  }
}

class HelpController extends GetxController {
  static HelpController get to => Get.find();

  HelpItemModel myAccount = HelpItemModel(
      header: "My Account",
      text: "Accounts, Referrals and more",
      icon: AppIcons.user);
  HelpItemModel fares = HelpItemModel(
      header: "Fares, Charges",
      text: "Fares, Charges and more",
      icon: AppIcons.wallet);
  HelpItemModel waiverRewards = HelpItemModel(
      header: "Waiver Rewards",
      text: "Waiver rewards related issue",
      icon: AppIcons.referAndEarn);
  HelpItemModel safety = HelpItemModel(
      header: "Safety",
      text: "Safety queries and concerns",
      icon: AppIcons.safety);
}
