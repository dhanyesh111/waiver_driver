import 'package:get/get.dart';

class FaqControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FaqController());
  }
}

class FaqController extends GetxController {
  static FaqController get to => Get.find();
}
