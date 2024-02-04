import 'package:get/get.dart';

class VehicleDetailsControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VehicleDetailsController());
  }
}

class VehicleDetailsController extends GetxController {
  static VehicleDetailsController get to => Get.find();
}
