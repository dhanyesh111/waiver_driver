import 'package:get/get.dart';

class AddDriverControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddDriverController());
  }
}

class AddDriverController extends GetxController {
  static AddDriverController get to => Get.find();
}
