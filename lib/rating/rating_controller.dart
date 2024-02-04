import 'package:get/get.dart';

class RatingControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RatingController());
  }
}

class RatingController extends GetxController {
  static RatingController get to => Get.find();
}
