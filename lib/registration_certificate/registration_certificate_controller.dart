import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../app_colors/app_colors.dart';

class RegistrationCertificateControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegistrationCertificateController());
  }
}

class RegistrationCertificateController extends GetxController {
  static RegistrationCertificateController get to => Get.find();
  RxString registrationCertificateFrontSide = "".obs;
  RxString registrationCertificateSideBackSide = "".obs;
  RxBool showErrorMessageRegistrationCertificate = false.obs;
  RxString errorMessageRegistrationCertificate = "".obs;
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
        registrationCertificateFrontSide.value = cropperImage?.path ?? "";
      } else {
        registrationCertificateSideBackSide.value = cropperImage?.path ?? "";
      }
      errorMessageRegistrationCertificate.value = "";
      showErrorMessageRegistrationCertificate.value = false;
    }
    Get.back();
  }

  uploadDocument() {
    if (registrationCertificateFrontSide.value.isEmpty) {
      errorMessageRegistrationCertificate.value =
          "Please upload front side of your aadhar card";
      showErrorMessageRegistrationCertificate.value = true;
    } else if (registrationCertificateSideBackSide.value.isEmpty) {
      errorMessageRegistrationCertificate.value =
          "Please upload back side of your aadhar card";
      showErrorMessageRegistrationCertificate.value = true;
    } else {
      Get.back();
    }
  }
}
