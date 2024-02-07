import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../app_colors/app_colors.dart';

class PoliceClearanceCertificateControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PoliceClearanceCertificateController());
  }
}

class PoliceClearanceCertificateController extends GetxController {
  static PoliceClearanceCertificateController get to => Get.find();
  RxString profilePhoto = "".obs;
  RxBool showErrorMessageProfilePhoto = false.obs;
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
      profilePhoto.value = cropperImage?.path ?? "";
      showErrorMessageProfilePhoto.value = false;
    }
    Get.back();
  }

  uploadDocument() {
    if (profilePhoto.value.isEmpty) {
      showErrorMessageProfilePhoto.value = true;
    } else {
      Get.back();
    }
  }
}
