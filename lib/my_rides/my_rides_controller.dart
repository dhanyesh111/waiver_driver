import 'package:get/get.dart';

class MyRidesControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyRidesController());
  }
}

class MyRidesController extends GetxController {
  static MyRidesController get to => Get.find();
}
