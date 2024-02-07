import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class BankAccountControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BankAccountController());
  }
}

class BankAccountController extends GetxController {
  static BankAccountController get to => Get.find();
  List<String> banks = ["bank1", "bank2", "bank3"];
  String? selectedBank;
  TextEditingController controllerAccountHolderName = TextEditingController();
  TextEditingController controllerBankAccountNumber = TextEditingController();
  TextEditingController controllerBankIFSCNumber = TextEditingController();
  GlobalKey<FormState> bankAccountDetails = GlobalKey();
  submit() {
    if (bankAccountDetails.currentState?.validate() ?? false) {
      Get.back();
    }
  }
}
