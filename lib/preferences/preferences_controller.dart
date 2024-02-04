import 'package:get/get.dart';

class PreferencesControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PreferencesController());
  }
}

class PreferencesController extends GetxController {
  static PreferencesController get to => Get.find();
}
