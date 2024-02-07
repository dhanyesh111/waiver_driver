import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waiver_driver/app_colors/app_colors.dart';

import 'app_pages/app_pages.dart';
import 'app_routes/app_routes.dart';
import 'languages/languages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Geolocator.openLocationSettings();
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
            theme: ThemeData(
                scaffoldBackgroundColor: AppColors.white,
                fontFamily: GoogleFonts.albertSans().fontFamily,
                textTheme: GoogleFonts.albertSansTextTheme(
                  Theme.of(context).textTheme,
                )),
            fallbackLocale: Locale(LanguageConstants.english),
            // localizationsDelegates: [
            //   GlobalMaterialLocalizations.delegate,
            //   GlobalWidgetsLocalizations.delegate,
            //   GlobalCupertinoLocalizations.delegate,
            // ],
            textDirection: TextDirection.ltr,
            translations: Languages(),
            locale: Get.deviceLocale,
            initialRoute: AppRoutes.home,
            getPages: AppPages.appPages,
          );
        });
  }
}

final box = GetStorage();
