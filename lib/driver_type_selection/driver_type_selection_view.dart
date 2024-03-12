import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:waiver_driver/app_buttons/app_buttons.dart';
import 'package:waiver_driver/app_colors/app_colors.dart';
import 'package:waiver_driver/app_routes/app_routes.dart';
import 'package:waiver_driver/assets/images.dart';

import '../constants/get_storage_constants.dart';
import '../main.dart';

class DriverTypeSelectionScreen extends StatelessWidget {
  const DriverTypeSelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  AppImages.loginBackground,
                ),
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter)),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TypeOfServices(),
          ],
        ),
      ),
    );
  }
}

class TypeOfServices extends StatelessWidget {
  const TypeOfServices({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.sp),
            topRight: Radius.circular(15.sp),
          )),
      padding: EdgeInsets.all(24.sp),
      child: Column(
        children: [
          SizedBox(
            height: 10.sp,
          ),
          Text(
            "What type of services do you offer",
            style: TextStyle(
                color: AppColors.black,
                height: 1,
                fontSize: 24.sp,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 14.sp,
          ),
          Text(
            "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy",
            style: TextStyle(
                color: AppColors.grey93,
                fontSize: 16.sp,
                height: 1,
                fontWeight: FontWeight.w200),
          ),
          SizedBox(
            height: 25.sp,
          ),
          const TypeOfServicesListing()
        ],
      ),
    );
  }
}

class TypeOfServicesListing extends StatelessWidget {
  const TypeOfServicesListing({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Hero(
          tag: UserType.chauffeur,
          child: Material(
            child: BlueButton(
                text: "Chauffeur",
                onTap: () async {
                  Get.toNamed(AppRoutes.signIn, arguments: UserType.chauffeur);
                  box.write(BoxConstants.userTypeCode, UserTypeCode.chauffeur);
                }),
          ),
        ),
        SizedBox(height: 14.sp),
        Hero(
          tag: UserType.fleet,
          child: Material(
            child: BlueButton(
                text: "Fleet",
                onTap: () {
                  Get.toNamed(AppRoutes.signIn, arguments: UserType.fleet);
                  box.write(BoxConstants.userTypeCode, UserTypeCode.fleet);
                }),
          ),
        ),
        SizedBox(height: 14.sp),
        Hero(
          tag: UserType.driver,
          child: Material(
            child: BlueButton(
                text: "Driver",
                onTap: () {
                  Get.toNamed(AppRoutes.signIn, arguments: UserType.driver);
                  box.write(BoxConstants.userTypeCode, UserTypeCode.driver);
                }),
          ),
        )
      ],
    );
  }
}
