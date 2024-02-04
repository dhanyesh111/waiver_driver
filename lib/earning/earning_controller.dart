import 'package:get/get.dart';

class EarningControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EarningController());
  }
}

class EarningController extends GetxController {
  static EarningController get to => Get.find();
}
