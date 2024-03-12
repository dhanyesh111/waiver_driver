import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:get/get.dart';
import 'package:waiver_driver/app_routes/app_routes.dart';
import 'package:waiver_driver/constants/get_storage_constants.dart';

import '../main.dart';

class SplashControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}

class SplashController extends GetxController {
  void onInit() async {
    if (!await AwesomeNotifications().isNotificationAllowed()) {
      AwesomeNotifications().requestPermissionToSendNotifications();
    }
    AwesomeNotifications().setChannel(NotificationChannel(
      channelKey: "basic_notification_channel",
      channelName: "Waiver Driver notification channel",
      channelDescription: "Notification channel for Waiver Driver man app",
      importance: NotificationImportance.Max,
      channelShowBadge: true,
      onlyAlertOnce: true,
      playSound: true,
      criticalAlerts: true,
    ));

    await Future.delayed(Duration(seconds: 3), () {
      String? token = box.read(BoxConstants.token);
      (token ?? "").isEmpty
          ? Get.offAllNamed(AppRoutes.driverTypeSelection)
          : Get.offAllNamed(AppRoutes.home);
      ;
    });
  }

  static SplashController get to => Get.find();
}
