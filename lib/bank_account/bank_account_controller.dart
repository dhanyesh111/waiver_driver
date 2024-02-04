import 'package:get/get.dart';

class BankAccountControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BankAccountController());
  }
}

class BankAccountController extends GetxController {
  static BankAccountController get to => Get.find();
}
