import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../aadhar_card/aadhar_card_model.dart';
import '../api_services/api_services.dart';
import '../app_colors/app_colors.dart';
import '../chauffeur_proof/chauffeur_proof_controller.dart';
import '../enums/enums.dart';

class PoliceClearanceCertificateControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PoliceClearanceCertificateController());
  }
}

class PoliceClearanceCertificateController extends GetxController {
  static PoliceClearanceCertificateController get to => Get.find();
  RxString policeClearanceCertificate = "".obs;
  RxBool showErrorMessagePoliceClearanceCertificate = false.obs;
  uploadPhoto({
    required ImageSource source,
  }) async {
    XFile? imageFile = await ImagePicker().pickImage(source: source);
    if (imageFile != null) {
      CroppedFile? cropperImage = await ImageCropper().cropImage(
        sourcePath: imageFile.path,
        cropStyle: CropStyle.rectangle,
        aspectRatio: CropAspectRatio(ratioX: 9, ratioY: 16),
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
      policeClearanceCertificate.value = cropperImage?.path ?? "";
      showErrorMessagePoliceClearanceCertificate.value = false;
    }
    Get.back();
  }

  uploadDocument() async {
    if (policeClearanceCertificate.value.isEmpty) {
      showErrorMessagePoliceClearanceCertificate.value = true;
    } else {
      List<http.MultipartFile> files = [
        await http.MultipartFile.fromPath(
            "files[0]", policeClearanceCertificate.value),
      ];
      Map<String, String> fields = {"document_type": "CLS"};
      UploadAadharResponseModel response =
          await ApiServices.uploadDocument(files: files, fields: fields);

      if (response.status == 200) {
        ChauffeurProofController.to.policeClearanceCertificate.approvalStatus
            .value = ChauffeurProofApprovalStatus.waitingForApproval;
        Get.back();
      }
    }
  }
}
