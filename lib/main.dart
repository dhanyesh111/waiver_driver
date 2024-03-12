import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:waiver_driver/app_theme/app_theme.dart';

import 'app_pages/app_pages.dart';
import 'app_routes/app_routes.dart';
import 'firebase_options.dart';
import 'languages/languages.dart';
import 'notification_service/notification_service.dart';

// Future<void> showNotification({required RemoteMessage notification}) async {
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   await NotificationService.onInit();
//   AwesomeNotifications().createNotification(
//     content: NotificationContent(
//         id: Random().nextInt(100000000),
//         channelKey: "basic_notification_channel",
//         title: notification.notification?.title ?? "",
//         body: notification.notification?.body ?? "",
//         autoDismissible: true),
//   );
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Geolocator.requestPermission();
  // await Geolocator.openLocationSettings();

  await GetStorage.init();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  FirebaseMessaging.onMessage.listen((message) {
    print("Something else");
    NotificationService.showNotification(notification: message);
  });

  FirebaseMessaging.onMessageOpenedApp.listen((message) {
    print("Something else");
    NotificationService.showNotification(notification: message);
  });

  // FirebaseMessaging.onBackgroundMessage(
  //     (message) => showNotification(notification: message));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) {
          return GetMaterialApp(
            title: 'Waiver Driver',

            darkTheme: darkTheme,
            theme: lightTheme,
            themeMode: ThemeMode.light,
            // theme: ThemeData(
            //     scaffoldBackgroundColor: AppColors.white,
            //     fontFamily: GoogleFonts.albertSans().fontFamily,
            //     textTheme: GoogleFonts.albertSansTextTheme(
            //       Theme.of(context).textTheme,
            //     )),
            fallbackLocale: Locale(LanguageConstants.english),
            // localizationsDelegates: [
            //   GlobalMaterialLocalizations.delegate,
            //   GlobalWidgetsLocalizations.delegate,
            //   GlobalCupertinoLocalizations.delegate,
            // ],
            textDirection: TextDirection.ltr,
            translations: Languages(),
            locale: Get.deviceLocale,
            initialRoute: AppRoutes.splash,
            getPages: AppPages.appPages,
          );
        });
  }
}

final box = GetStorage();
