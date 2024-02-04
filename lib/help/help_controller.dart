import 'package:get/get.dart';

class HelpControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HelpController());
  }
}

class HelpController extends GetxController {
  static HelpController get to => Get.find();
}
