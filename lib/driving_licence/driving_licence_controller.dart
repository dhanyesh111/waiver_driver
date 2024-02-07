import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../app_colors/app_colors.dart';

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

  uploadDocument() {
    if (drivingLicenceFrontSide.value.isEmpty) {
      errorMessageDrivingLicence.value =
          "Please upload front side of your aadhar card";
      showErrorMessageDrivingLicence.value = true;
    } else if (drivingLicenceBackSide.value.isEmpty) {
      errorMessageDrivingLicence.value =
          "Please upload back side of your aadhar card";
      showErrorMessageDrivingLicence.value = true;
    } else {
      Get.back();
    }
  }
}
