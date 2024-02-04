import 'package:get/get.dart';

class AddVehicleControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddVehicleController());
  }
}

class AddVehicleController extends GetxController {
  static AddVehicleController get to => Get.find();
}
