import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:waiver_driver/api_services/api_services.dart';
import 'package:waiver_driver/app_routes/app_routes.dart';
import 'package:waiver_driver/login/login_model.dart';

import '../constants/get_storage_constants.dart';
import '../main.dart';
import '../snackbar/snackbar.dart';
import 'otp_model.dart';

class OtpControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OtpController());
  }
}

class OtpController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    try {
      ArgumentModelForOtpPage argument = Get.arguments;
      mobileNumber = argument.mobilePhoneNumber;
      mobileCode = argument.mobileCode;
      mobileCode = argument.mobileCode;
      user = argument.user;
    } catch (error) {
      Get.back();
    }
  }

  GoogleSignInAccount? user;
  static OtpController get to => Get.find();
  String userTypeCode = box.read(BoxConstants.userTypeCode);
  String mobileNumber = "";
  String mobileCode = "";
  String code = "";
  RxBool showIsOtpValid = false.obs;
  RxBool isButtonLoading = false.obs;

  validateOtp() async {
    try {
      isButtonLoading.value = true;
      if (!showIsOtpValid.value) {
        showIsOtpValid.value = code.length != 6;
        Map<String, String> body = {
          "phone": mobileNumber,
          "otp": code,
          "code": mobileCode,
          "user_type": userTypeCode
        };
        VerifyOtpResponseModel response =
            await ApiServices.phoneAuth(body: body);
        if (response.status == 200) {
          if (userTypeCode != (response.data?.userType ?? "")) {
            userTypeCode = response.data?.userType ?? "";
          }
          box.write(BoxConstants.token, response.data?.accessToken);
          if (userTypeCode == UserTypeCode.fleet) {
            Get.offAllNamed(AppRoutes.fleetHomePage);
          } else {
            if (response.data?.isVerifed ?? false) {
              box.write(BoxConstants.userID, response.data?.id ?? "");
              Get.toNamed(AppRoutes.chauffeurProof);
              Get.offAllNamed(AppRoutes.home);
            } else if (response.data?.arePhotosUploaded ?? false) {
              Get.offAllNamed(AppRoutes.waitingForAuthorization);
            } else if (response.data?.isRegistered ?? false) {
              box.write(BoxConstants.userName, response.data?.fullname ?? "");
              box.write(BoxConstants.userID, response.data?.id ?? "");
              Get.toNamed(AppRoutes.chauffeurProof);
            } else {
              Get.toNamed(AppRoutes.registration, arguments: user);
            }
          }
        } else {
          Get.showSnackbar(GetSnackBar(
              duration: Duration(seconds: 5),
              backgroundColor: Colors.transparent,
              padding: EdgeInsets.zero,
              messageText: AppSnackBar(text: response?.message ?? "")));
        }
      }
    } catch (error) {
      Get.showSnackbar(const GetSnackBar(
          duration: Duration(seconds: 5),
          backgroundColor: Colors.transparent,
          padding: EdgeInsets.zero,
          messageText: AppSnackBar(text: "OOPS Something went wrong")));
    } finally {
      isButtonLoading.value = false;
    }
  }
}
