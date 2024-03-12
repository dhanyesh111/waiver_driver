import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../chauffeur_proof/chauffeur_proof_model.dart';
import '../enums/enums.dart';
import '../snackbar/snackbar.dart';

class AddVehicleProofControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddVehicleProofController());
  }
}

class AddVehicleProofController extends GetxController {
  static AddVehicleProofController get to => Get.find();
  AddProofItemModel registrationCertificate = AddProofItemModel(
      text: "Registration Certificate( RC)",
      approvalStatus: ChauffeurProofApprovalStatus.notUpload.obs);
  AddProofItemModel vehicleInsurance = AddProofItemModel(
      text: "Vehicle Insurance",
      approvalStatus: ChauffeurProofApprovalStatus.notUpload.obs);
  AddProofItemModel vehiclePermit = AddProofItemModel(
      text: "Vehicle Permit",
      approvalStatus: ChauffeurProofApprovalStatus.notUpload.obs);
  RxBool showTermsAndConditionsError = false.obs;
  RxBool isAgreedToTermsAndConditions = false.obs;

  submit() {
    if (!isAgreedToTermsAndConditions.value) {
      showTermsAndConditionsError.value = true;
    } else {
      Get.back();
      Get.showSnackbar(const GetSnackBar(
          duration: Duration(seconds: 5),
          backgroundColor: Colors.transparent,
          padding: EdgeInsets.zero,
          messageText: AppSnackBar(
              text:
                  "All documents  are uploaded and are waiting for approval")));
    }
  }
}
