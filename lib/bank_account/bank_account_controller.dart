import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:waiver_driver/api_services/api_services.dart';
import 'package:waiver_driver/chauffeur_proof/chauffeur_proof_controller.dart';

import '../enums/enums.dart';
import 'bank_account_model.dart';

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
  GlobalKey<FormState> bankAccountDetailsFormKey = GlobalKey();
  submit() async {
    if (bankAccountDetailsFormKey.currentState?.validate() ?? false) {
      Map<String, String> body = {
        "bank_name": "HDFC",
        "holder_name": controllerAccountHolderName.text.trim() ?? "",
        "account_number": controllerAccountHolderName.text.trim(),
        "ifsc": controllerBankIFSCNumber.text.trim(),
      };

      AddBankAccountResponseModel response =
          await ApiServices.addBankAccount(body: body);
      if (response.status == 200) {
        ChauffeurProofController.to.bankAccount.approvalStatus.value =
            ChauffeurProofApprovalStatus.waitingForApproval;
        Get.back();
      }
    }
  }
}
