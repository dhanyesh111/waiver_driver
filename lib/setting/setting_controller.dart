import 'package:get/get.dart';

class SettingControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingController());
  }
}

class SettingController extends GetxController {
  static SettingController get to => Get.find();
}
