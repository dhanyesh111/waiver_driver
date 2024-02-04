import 'package:get/get.dart';

class DriverTypeSelectionControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DriverTypeSelectionController());
  }
}

class DriverTypeSelectionController extends GetxController {
  static DriverTypeSelectionController get to => Get.find();
}
