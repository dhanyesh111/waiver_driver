import 'package:get/get.dart';

class DriverProfileControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DriverProfileController());
  }
}

class DriverProfileController extends GetxController {
  static DriverProfileController get to => Get.find();
}
