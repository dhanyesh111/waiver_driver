import 'package:get/get.dart';

class FaqListingControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FaqListingController());
  }
}

class FaqListingController extends GetxController {
  static FaqListingController get to => Get.find();
}
