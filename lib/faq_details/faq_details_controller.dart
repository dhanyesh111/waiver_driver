import 'package:get/get.dart';

class FaqDetailsControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FaqDetailsController());
  }
}

class FaqDetailsController extends GetxController {
  static FaqDetailsController get to => Get.find();
}
