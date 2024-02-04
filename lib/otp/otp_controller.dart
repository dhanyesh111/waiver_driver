import 'package:get/get.dart';
import 'package:waiver_driver/app_routes/app_routes.dart';
import 'package:waiver_driver/otp/otp_model.dart';

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
      ArgumentModelForOtp argument = Get.arguments;
      mobileNumber = argument.mobileNumber;
      mobileCode = argument.mobileCode;
    } catch (error) {
      Get.back();
    }
  }

  static OtpController get to => Get.find();
  String mobileNumber = "";
  String mobileCode = "";
  String code = "";
  RxBool showIsOtpValid = false.obs;
  validateOtp() {
    showIsOtpValid.value = code.length != 6;
    print(showIsOtpValid.value);
  }

  confirm() {
    validateOtp();
    if (!showIsOtpValid.value) {
      Get.toNamed(AppRoutes.registration);
    }
  }
}
