import 'package:get/get.dart';

class PoliceClearanceCertificateControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PoliceClearanceCertificateController());
  }
}

class PoliceClearanceCertificateController extends GetxController {
  static PoliceClearanceCertificateController get to => Get.find();
}
