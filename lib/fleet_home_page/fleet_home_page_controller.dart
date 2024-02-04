import 'package:get/get.dart';

class FleetHomePageControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FleetHomePageController());
  }
}

class FleetHomePageController extends GetxController {
  static FleetHomePageController get to => Get.find();
}
