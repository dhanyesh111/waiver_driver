import 'package:get/get.dart';

import '../enums/enums.dart';

class SignInControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignInController());
  }
}

class SignInController extends GetxController {
  @override
  void onInit() {
    userType = Get.arguments;
    super.onInit();
  }

  static SignInController get to => Get.find();
  UserType userType = UserType.chauffeur;
}
