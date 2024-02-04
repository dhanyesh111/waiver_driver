import 'package:get/get.dart';

class DrivingLicenceControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DrivingLicenceController());
  }
}

class DrivingLicenceController extends GetxController {
  static DrivingLicenceController get to => Get.find();
}
