import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waiver_driver/api_services/api_services.dart';
import 'package:waiver_driver/app_routes/app_routes.dart';
import 'package:waiver_driver/assets/images.dart';

import '../snackbar/snackbar.dart';
import 'login_model.dart';

class LoginControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}

class LoginController extends GetxController {
  static LoginController get to => Get.find();

  @override
  void onInit() {
    selectedCountry = countryList[0];
    super.onInit();
  }

  RxBool isButtonLoading = false.obs;

  TextEditingController controllerPhoneNumber = TextEditingController();
  GlobalKey<FormState> formKeyForLoginPage = GlobalKey();

  CountryModel? selectedCountry;
  List<CountryModel> countryList = <CountryModel>[
    CountryModel(image: AppImages.indiaFlag, name: "India", mobileCode: '+91')
  ];

  sendPhoneOtp() async {
    if (formKeyForLoginPage.currentState?.validate() ?? false) {
      try {
        isButtonLoading.value = true;
        Map<String, String> body = {
          "phone": controllerPhoneNumber.text.trim(),
          "code": selectedCountry?.mobileCode ?? "",
        };
        SendPhoneOtpResponseModel response =
            await ApiServices.sendPhoneOtp(body: body);
        if (response.status == 200) {
          Get.toNamed(AppRoutes.otp,
              arguments: ArgumentModelForOtpPage(
                  mobileCode: selectedCountry?.mobileCode ?? "",
                  mobilePhoneNumber: controllerPhoneNumber.text.trim(),
                  user: Get.arguments));
        }
        Get.showSnackbar(GetSnackBar(
            duration: const Duration(seconds: 5),
            backgroundColor: Colors.transparent,
            padding: EdgeInsets.zero,
            messageText: AppSnackBar(text: response.message ?? "")));
      } catch (error) {
        Get.showSnackbar(const GetSnackBar(
            duration: Duration(seconds: 5),
            backgroundColor: Colors.transparent,
            padding: EdgeInsets.zero,
            messageText: AppSnackBar(text: "OOPS Something went Wrong")));
      } finally {
        isButtonLoading.value = false;
      }
    }
  }
}
