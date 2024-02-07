import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:waiver_driver/app_colors/app_colors.dart';

class ProfilePhotoControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfilePhotoController());
  }
}

class ProfilePhotoController extends GetxController {
  static ProfilePhotoController get to => Get.find();
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
        aspectRatioPresets: [CropAspectRatioPreset.square],
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
