import 'package:get/get.dart';

class ChauffeurProofControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChauffeurProofController());
  }
}

class ChauffeurProofController extends GetxController {
  static ChauffeurProofController get to => Get.find();
}
