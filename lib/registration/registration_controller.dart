import 'package:get/get.dart';

class RegistrationControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegistrationController());
  }
}

class RegistrationController extends GetxController {
  static RegistrationController get to => Get.find();
}
