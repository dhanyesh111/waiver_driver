import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../aadhar_card/aadhar_card_model.dart';
import '../api_services/api_services.dart';
import '../app_colors/app_colors.dart';
import '../chauffeur_proof/chauffeur_proof_controller.dart';
import '../enums/enums.dart';

class DrivingLicenceControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DrivingLicenceController());
  }
}

class DrivingLicenceController extends GetxController {
  static DrivingLicenceController get to => Get.find();
  RxString drivingLicenceFrontSide = "".obs;
  RxString drivingLicenceBackSide = "".obs;
  RxBool showErrorMessageDrivingLicence = false.obs;
  RxString errorMessageDrivingLicence = "".obs;
  uploadPhoto({required ImageSource source, required bool isFrontSide}) async {
    XFile? imageFile = await ImagePicker().pickImage(source: source);
    if (imageFile != null) {
      CroppedFile? cropperImage = await ImageCropper().cropImage(
        sourcePath: imageFile.path,
        cropStyle: CropStyle.rectangle,
        aspectRatioPresets: [CropAspectRatioPreset.ratio16x9],
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: '',
            hideBottomControls: true,
            lockAspectRatio: true,
            showCropGrid: false,
            toolbarColor: AppColors.black,
            toolbarWidgetColor: AppColors.white,
            initAspectRatio: CropAspectRatioPreset.original,
          ),
          IOSUiSettings(
            title: 'Cropper',
          ),
        ],
      );

      if (isFrontSide) {
        drivingLicenceFrontSide.value = cropperImage?.path ?? "";
      } else {
        drivingLicenceBackSide.value = cropperImage?.path ?? "";
      }
      errorMessageDrivingLicence.value = "";
      showErrorMessageDrivingLicence.value = false;
    }
    Get.back();
  }

  uploadDocument() async {
    if (drivingLicenceFrontSide.value.isEmpty) {
      errorMessageDrivingLicence.value =
          "Please upload front side of your aadhar card";
      showErrorMessageDrivingLicence.value = true;
    } else if (drivingLicenceBackSide.value.isEmpty) {
      errorMessageDrivingLicence.value =
          "Please upload back side of your aadhar card";
      showErrorMessageDrivingLicence.value = true;
    } else {
      List<http.MultipartFile> files = [
        await http.MultipartFile.fromPath(
            "files[0]", drivingLicenceFrontSide.value),
        await http.MultipartFile.fromPath(
            "files[1]", drivingLicenceBackSide.value),
      ];
      Map<String, String> fields = {"document_type": "LCS"};
      UploadAadharResponseModel response =
          await ApiServices.uploadDocument(files: files, fields: fields);

      if (response.status == 200) {
        ChauffeurProofController.to.drivingLicense.approvalStatus.value =
            ChauffeurProofApprovalStatus.waitingForApproval;
        Get.back();
      }
    }
  }
}
