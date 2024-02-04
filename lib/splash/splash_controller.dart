import 'package:get/get.dart';
import 'package:waiver_driver/app_routes/app_routes.dart';

class SplashControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}

class SplashController extends GetxController {
  void onInit() async {
    await Future.delayed(Duration(seconds: 3), () {
      Get.offAllNamed(AppRoutes.welcome);
    });
  }

  static SplashController get to => Get.find();
}
