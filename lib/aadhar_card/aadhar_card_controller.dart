import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../api_services/api_services.dart';
import '../app_colors/app_colors.dart';
import '../chauffeur_proof/chauffeur_proof_controller.dart';
import '../enums/enums.dart';
import 'aadhar_card_model.dart';

class AadharCardControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AadharCardController());
  }
}

class AadharCardController extends GetxController {
  static AadharCardController get to => Get.find();
  RxString aadharCardFrontSide = "".obs;
  RxString aadharCardSideBackSide = "".obs;
  RxBool showErrorMessageAadharCard = false.obs;
  RxString errorMessageAadharCard = "".obs;
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
        aadharCardFrontSide.value = cropperImage?.path ?? "";
      } else {
        aadharCardSideBackSide.value = cropperImage?.path ?? "";
      }
      errorMessageAadharCard.value = "";
      showErrorMessageAadharCard.value = false;
    }
    Get.back();
  }

  uploadDocument() async {
    if (aadharCardFrontSide.value.isEmpty) {
      errorMessageAadharCard.value =
          "Please upload front side of your aadhar card";
      showErrorMessageAadharCard.value = true;
    } else if (aadharCardSideBackSide.value.isEmpty) {
      errorMessageAadharCard.value =
          "Please upload back side of your aadhar card";
      showErrorMessageAadharCard.value = true;
    } else {
      List<http.MultipartFile> files = [
        await http.MultipartFile.fromPath(
            "files[0]", aadharCardSideBackSide.value),
        await http.MultipartFile.fromPath(
            "files[1]", aadharCardSideBackSide.value),
      ];
      Map<String, String> fields = {"document_type": "ADR"};
      UploadAadharResponseModel response =
          await ApiServices.uploadDocument(files: files, fields: fields);
      if (response.status == 200) {
        ChauffeurProofController.to.aadharCard.approvalStatus.value =
            ChauffeurProofApprovalStatus.waitingForApproval;
        Get.back();
      }
    }
  }
}
