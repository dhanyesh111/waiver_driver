import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waiver_driver/api_services/api_services.dart';
import 'package:waiver_driver/app_routes/app_routes.dart';
import 'package:waiver_driver/constants/get_storage_constants.dart';
import 'package:waiver_driver/enums/enums.dart';

import '../main.dart';
import '../snackbar/snackbar.dart';
import 'chauffeur_proof_model.dart';

class ChauffeurProofControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChauffeurProofController());
  }
}

class ChauffeurProofController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    try {
      isLoading.value = true;
      Future.wait([getDocument(), getProfileImage(), getBankAccount()]);
      isError.value = false;
    } catch (error) {
      isError.value = true;
    } finally {
      isLoading.value = false;
    }
  }

  RxBool isError = false.obs;
  RxBool isLoading = false.obs;

  static ChauffeurProofController get to => Get.find();
  String chauffeurName = box.read(BoxConstants.userName);

  RxBool isAgreedToTermsAndConditions = false.obs;
  RxBool showTermsAndConditionsError = false.obs;
  GetProfilePhotoResponseModel? profilePhotoResponse;
  Future<void> getProfileImage() async {
    profilePhotoResponse = await ApiServices.getProfileImage();
    profilePhoto.approvalStatus.value =
        profilePhotoResponse?.data?.profileImage?.isNotEmpty ?? false
            ? ChauffeurProofApprovalStatus.waitingForApproval
            : ChauffeurProofApprovalStatus.notUpload;
  }

  GetBankAccountResponseModel? bankAccountResponse;
  Future<void> getBankAccount() async {
    bankAccountResponse = await ApiServices.getBankAccount();
    bankAccount.approvalStatus.value =
        bankAccountResponse?.data?.isVerified ?? false
            ? ChauffeurProofApprovalStatus.approved
            : bankAccountResponse?.data?.accountNumber?.isNotEmpty ?? false
                ? ChauffeurProofApprovalStatus.waitingForApproval
                : ChauffeurProofApprovalStatus.notUpload;
  }

  ProofDocument? aadhar;
  ProofDocument? license;
  ProofDocument? clearanceCertificate;
  Future<void> getDocument() async {
    GetDocumentsResponseModel response = await ApiServices.getDocument();

    aadhar = response.data?.firstWhereOrNull(
        (element) => element.documentType == DocumentType.aadhar);
    aadharCard.approvalStatus.value =
        checkApprovalStatus(proofDocument: aadhar);

    license = response.data?.firstWhereOrNull(
        (element) => element.documentType == DocumentType.license);
    drivingLicense.approvalStatus.value =
        checkApprovalStatus(proofDocument: license);

    clearanceCertificate = response.data?.firstWhereOrNull((element) =>
        element.documentType == DocumentType.policeClearanceCertificate);
    policeClearanceCertificate.approvalStatus.value =
        checkApprovalStatus(proofDocument: clearanceCertificate);
  }

  ChauffeurProofApprovalStatus checkApprovalStatus(
          {required ProofDocument? proofDocument}) =>
      proofDocument?.isVerified ?? false
          ? ChauffeurProofApprovalStatus.approved
          : proofDocument?.files?.isNotEmpty ?? false
              ? ChauffeurProofApprovalStatus.waitingForApproval
              : ChauffeurProofApprovalStatus.notUpload;

  AddProofItemModel profilePhoto = AddProofItemModel(
      text: "Profile Photo",
      approvalStatus: ChauffeurProofApprovalStatus.notUpload.obs);
  AddProofItemModel aadharCard = AddProofItemModel(
      text: "Aadhar Card",
      approvalStatus: ChauffeurProofApprovalStatus.notUpload.obs);
  AddProofItemModel drivingLicense = AddProofItemModel(
      text: "Driving License",
      approvalStatus: ChauffeurProofApprovalStatus.notUpload.obs);
  AddProofItemModel policeClearanceCertificate = AddProofItemModel(
    text: "Police Clearance Certificate",
    approvalStatus: ChauffeurProofApprovalStatus.notUpload.obs,
  );
  AddProofItemModel bankAccount = AddProofItemModel(
      text: "Bank Account",
      approvalStatus: ChauffeurProofApprovalStatus.notUpload.obs);

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
