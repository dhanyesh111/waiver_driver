import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../app_routes/app_routes.dart';
import '../snackbar/snackbar.dart';

class SignInControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SignInController());
  }
}

class SignInController extends GetxController {
  @override
  void onInit() {
    userType = Get.arguments;

    super.onInit();
  }

  RxBool isGoogleLoginLoading = false.obs;

  loginWithGoogle() async {
    try {
      isGoogleLoginLoading.value = true;
      GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser != null) {
        Get.toNamed(AppRoutes.login, arguments: googleUser);
      } else {
        Get.showSnackbar(const GetSnackBar(
            duration: Duration(seconds: 5),
            backgroundColor: Colors.transparent,
            padding: EdgeInsets.zero,
            messageText: AppSnackBar(
                text: "OOPS there was some issue with google login"
                    " please try again or select Continue With Phone Number ")));
      }
    } catch (error) {
      {
        print(error);
        Get.showSnackbar(const GetSnackBar(
            duration: Duration(seconds: 5),
            backgroundColor: Colors.transparent,
            padding: EdgeInsets.zero,
            messageText: AppSnackBar(text: "OOPS Some thing went wrong")));
      }
    } finally {
      isGoogleLoginLoading.value = false;
    }
  }

  static SignInController get to => Get.find();
  String userType = "";
}
