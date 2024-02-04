import 'package:get/get.dart';

class WelcomeControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WelcomeController());
  }
}

class WelcomeController extends GetxController {
  static WelcomeController get to => Get.find();
}
