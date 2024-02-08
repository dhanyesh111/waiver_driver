import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ViewBankAccountControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ViewBankAccountController());
  }
}

class ViewBankAccountController extends GetxController {
  static ViewBankAccountController get to => Get.find();
  List<String> banks = ["bank1", "bank2", "bank3"];
  String? selectedBank;
  TextEditingController controllerAccountHolderName = TextEditingController();
  TextEditingController controllerBankAccountNumber = TextEditingController();
  TextEditingController controllerBankIFSCNumber = TextEditingController();
  GlobalKey<FormState> addBankAccountDetails = GlobalKey();
  add() {
    if (addBankAccountDetails.currentState?.validate() ?? false) {
      Get.back();
    }
  }
}
