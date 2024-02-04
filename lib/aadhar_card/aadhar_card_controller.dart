import 'package:get/get.dart';

class AadharCardControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AadharCardController());
  }
}

class AadharCardController extends GetxController {
  static AadharCardController get to => Get.find();
}
