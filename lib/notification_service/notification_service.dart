import 'dart:math';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationService {
  static Future<void> onInit() async {
    await AwesomeNotifications().initialize(
        null,
        [
          NotificationChannel(
            channelKey: "basic_notification_channel",
            channelName: "Waiver Driver notification channel",
            channelDescription:
                "Notification channel for Waiver Driver man app",
            importance: NotificationImportance.Max,
            channelShowBadge: true,
            onlyAlertOnce: true,
            playSound: true,
            criticalAlerts: true,
          )
        ],
        channelGroups: [
          NotificationChannelGroup(
              channelGroupKey: ("basic_notification_channels"),
              channelGroupName: "Waiver Driver notification channel"),
        ],
        debug: true);

    bool isAllowed = await AwesomeNotifications().isNotificationAllowed();
    if (isAllowed) {
      await AwesomeNotifications().requestPermissionToSendNotifications();
    }
    await AwesomeNotifications().setListeners(
        onActionReceivedMethod: onActionReceivedMethod,
        onDismissActionReceivedMethod: onDismissActionReceivedMethod,
        onNotificationCreatedMethod: onNotificationCreatedMethod,
        onNotificationDisplayedMethod: onNotificationDisplayedMethod);
  }

  static Future<void> onActionReceivedMethod(ReceivedAction action) async {}

  static Future<void> onDismissActionReceivedMethod(
      ReceivedNotification notification) async {}

  static Future<void> onNotificationCreatedMethod(
      ReceivedNotification notification) async {}

  static Future<void> onNotificationDisplayedMethod(
      ReceivedNotification notification) async {}

  static Future<void> showNotification(
      {required RemoteMessage notification}) async {
    AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: Random().nextInt(100000000),
          channelKey: "basic_notification_channel",
          title: notification.notification?.title ?? "",
          body: notification.notification?.body ?? "",
          autoDismissible: true),
    );
    // HomeController.to.turnOnTimer();
    // Get.bottomSheet(const IncomingOrderBottomSheet());
  }
}

//print(await FirebaseMessaging.instance.getToken());
//                   print("adkjgnfdsf");
//
//                   print("adkjgnfdsf");
//                   final widgetJson =
//                       jsonEncode({'type': 'overlay', 'message': "message"});
//                   print("adkjgnfdsf");
//                   overlayChannel
//                       .invokeMethod('showOverlay', {'widgetJson': widgetJson});
//                   print("adkjgnfdsf");

// final MethodChannel overlayChannel =
//         MethodChannel('com.example.app/overlay');
//     overlayChannel.setMethodCallHandler((call) async {
//       if (call.method == 'buttonClicked') {
//         final String buttonId = call.arguments['buttonId'];
//         if (buttonId == 'button1') {
//           // Execute function for button 1
//           print('Button 1 clicked');
//         } else if (buttonId == 'button2') {
//           // Execute function for button 2
//           print('Button 2 clicked');
//         }
//       }
//     });

// overlayChannel.invokeMethod('close');
//                   print("adkjgnfdsf");

//    overlayChannel.setMethodCallHandler((call) async {
//                     if (call.method == 'buttonClicked') {
//                       // Run your function here
//                       print('Function executed from native code');
//                     }
//                   });
//                   overlayChannel.invokeMethod('buttonClicked',
//                       {'message': 'This is a system overlay message'});
