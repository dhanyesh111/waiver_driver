import 'package:get/get.dart';

import 'notification_model.dart';

class NotificationControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NotificationController());
  }
}

class NotificationController extends GetxController {
  static NotificationController get to => Get.find();
  List<NotificationModel> notification = <NotificationModel>[
    NotificationModel(
        header: "Discount 35% Off",
        text: "Special promo only for today!",
        type: "offer"),
    NotificationModel(
        header: "Cash Back 20% Off",
        text: "Special promo only for today!",
        type: "schedule"),
    NotificationModel(
        header: "Payment Successful!",
        text: "Special promo only for today!",
        type: "payment"),
    NotificationModel(
        header: "Payment Successful!",
        text: "Special promo only for today!",
        type: "payment"),
    NotificationModel(
        header: "Discount 75% Off",
        text: "Special promo only for today!",
        type: "offer")
  ];
}
