import 'package:get/get.dart';

class ReasonForCancelControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReasonForCancelController());
  }
}

class ReasonForCancelController extends GetxController {
  static ReasonForCancelController get to => Get.find();
}
