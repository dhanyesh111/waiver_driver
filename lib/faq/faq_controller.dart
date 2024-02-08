import 'package:get/get.dart';

class FaqControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FaqController());
  }
}

class FaqController extends GetxController {
  static FaqController get to => Get.find();
  @override
  void onInit() {
    faqTitle = Get.arguments;
    super.onInit();
  }

  String faqTitle = "";
  List<String> faqTopics = [
    "Account Related",
    "Referral Related",
    "Account Related",
    "Account Related",
  ];
}
