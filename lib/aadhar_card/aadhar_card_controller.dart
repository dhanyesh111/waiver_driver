import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../app_colors/app_colors.dart';

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

  uploadDocument() {
    if (aadharCardFrontSide.value.isEmpty) {
      errorMessageAadharCard.value =
          "Please upload front side of your aadhar card";
      showErrorMessageAadharCard.value = true;
    } else if (aadharCardSideBackSide.value.isEmpty) {
      errorMessageAadharCard.value =
          "Please upload back side of your aadhar card";
      showErrorMessageAadharCard.value = true;
    } else {
      Get.back();
    }
  }
}
