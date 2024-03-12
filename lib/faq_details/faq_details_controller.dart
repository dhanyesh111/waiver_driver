import 'package:get/get.dart';
import 'package:waiver_driver/faq_topics/faq_topic_model.dart';

class FaqDetailsControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FaqDetailsController());
  }
}

class FaqDetailsController extends GetxController {
  static FaqDetailsController get to => Get.find();
  @override
  void onInit() {
    Faq faq = Get.arguments;
    question = faq.question ?? "";
    answer = faq.answer ?? "";
  }

  String question = "How to Log with Email";
  String answer = "";
}
