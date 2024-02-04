import 'package:get/get.dart';

class ProfilePhotoControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfilePhotoController());
  }
}

class ProfilePhotoController extends GetxController {
  static ProfilePhotoController get to => Get.find();
}
