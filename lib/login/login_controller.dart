import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:waiver_driver/app_routes/app_routes.dart';
import 'package:waiver_driver/assets/images.dart';

import '../otp/otp_model.dart';
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

  TextEditingController controllerPhoneNumber = TextEditingController();

  GlobalKey<FormState> formKeyForLoginPage = GlobalKey();

  CountryModel? selectedCountry;
  List<CountryModel> countryList = <CountryModel>[
    CountryModel(image: AppImages.indiaFlag, name: "India", mobileCode: '+91')
  ];

  next() {
    if (formKeyForLoginPage.currentState?.validate() ?? false) {
      Get.toNamed(AppRoutes.otp,
          arguments: ArgumentModelForOtp(
              mobileNumber: controllerPhoneNumber.text,
              mobileCode: selectedCountry?.mobileCode ?? ""));
    }
  }
}
