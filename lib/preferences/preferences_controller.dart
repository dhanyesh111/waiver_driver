import 'package:get/get.dart';

class PreferencesControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PreferencesController());
  }
}

class PreferencesController extends GetxController {
  static PreferencesController get to => Get.find();

  RxBool allowEmailForPromotionAndOffers = false.obs;
  changeAllowEmailForPromotionAndOffers() {
    allowEmailForPromotionAndOffers.value =
        !allowEmailForPromotionAndOffers.value;
    print(allowEmailForPromotionAndOffers.value);
  }

  RxBool allowEmailForInvoice = false.obs;
  changeAllowEmailForInvoice() {
    allowEmailForInvoice.value = !allowEmailForInvoice.value;
  }

  RxBool allowSMSForPromotionAndOffers = false.obs;
  changeAllowSMSForPromotionAndOffers() {
    allowSMSForPromotionAndOffers.value = !allowSMSForPromotionAndOffers.value;
  }

  RxBool allowSMSForInvoice = false.obs;
  changeAllowSMSForInvoice() {
    allowSMSForInvoice.value = !allowSMSForInvoice.value;
  }

  RxBool allowUpdateToBeSentOnWhatsapp = false.obs;
  changeAllowUpdateToBeSentOnWhatsapp() {
    allowUpdateToBeSentOnWhatsapp.value = !allowUpdateToBeSentOnWhatsapp.value;
  }

  RxBool allowPushNotification = false.obs;
  changeAllowPushNotification() {
    allowPushNotification.value = !allowPushNotification.value;
  }

  RxBool allowPictureInPictureAccess = false.obs;
  changeAllowPictureInPictureAccess() {
    allowPictureInPictureAccess.value = !allowPictureInPictureAccess.value;
  }
}
