import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:waiver_driver/app_buttons/app_buttons.dart';
import 'package:waiver_driver/app_routes/app_routes.dart';
import 'package:waiver_driver/assets/icons.dart';
import 'package:waiver_driver/sign_in/sign_in_controller.dart';

import '../app_colors/app_colors.dart';
import '../assets/images.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

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
          WelcomeContainer(),
        ],
      ),
    ));
  }
}

class WelcomeContainer extends StatelessWidget {
  const WelcomeContainer({super.key});

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Welcome",
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
          Hero(
            tag: SignInController.to.userType,
            child: Material(
              child: BlueButton(
                text: "Continue with Phone Number",
                onTap: () => Get.toNamed(AppRoutes.login),
              ),
            ),
          ),
          SizedBox(
            height: 16.sp,
          ),
          GetX<SignInController>(builder: (controller) {
            return WhiteButton(
              icon: SvgPicture.asset(AppIcons.google),
              text: "Continue with Google",
              isLoading: controller.isGoogleLoginLoading.value,
              onTap: () => controller.loginWithGoogle(),
            );
          }),
        ],
      ),
    );
  }
}
