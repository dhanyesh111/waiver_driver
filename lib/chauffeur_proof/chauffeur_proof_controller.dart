import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waiver_driver/app_routes/app_routes.dart';
import 'package:waiver_driver/enums/enums.dart';

import '../snackbar/snackbar.dart';
import 'chauffeur_proof_model.dart';

class ChauffeurProofControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChauffeurProofController());
  }
}

class ChauffeurProofController extends GetxController {
  void onInit() {
    super.onInit();
    chauffeurName = Get.arguments ?? "";
  }

  static ChauffeurProofController get to => Get.find();
  String chauffeurName = "";

  RxBool isAgreedToTermsAndConditions = false.obs;
  RxBool showTermsAndConditionsError = false.obs;
  ChauffeurProofItemModel profilePhoto = ChauffeurProofItemModel(
      text: "Profile Photo",
      approvalStatus: ChauffeurProofApprovalStatus.waitingForApproval);
  ChauffeurProofItemModel aadharCard = ChauffeurProofItemModel(
      text: "Aadhar Card",
      approvalStatus: ChauffeurProofApprovalStatus.approved);
  ChauffeurProofItemModel drivingLicense = ChauffeurProofItemModel(
      text: "Driving License",
      approvalStatus: ChauffeurProofApprovalStatus.notUpload);
  ChauffeurProofItemModel policeClearanceCertificate = ChauffeurProofItemModel(
    text: "Police Clearance Certificate",
    approvalStatus: ChauffeurProofApprovalStatus.notUpload,
  );
  ChauffeurProofItemModel bankAccount = ChauffeurProofItemModel(
      text: "Bank Account",
      approvalStatus: ChauffeurProofApprovalStatus.notUpload);

  continueTo() {
    if (!isAgreedToTermsAndConditions.value) {
      showTermsAndConditionsError.value = true;
    } else {
      Get.toNamed(AppRoutes.home);
      Get.showSnackbar(const GetSnackBar(
          duration: Duration(seconds: 5),
          backgroundColor: Colors.transparent,
          padding: EdgeInsets.zero,
          messageText: AppSnackBar(
              text:
                  "All documents  must be uploaded and approved before you can proceed, Please wait")));
    }
  }
}
