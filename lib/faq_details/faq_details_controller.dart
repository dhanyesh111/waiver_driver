import 'package:get/get.dart';

class FaqDetailsControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FaqDetailsController());
  }
}

class FaqDetailsController extends GetxController {
  static FaqDetailsController get to => Get.find();
  String question = "How to Log with Email";
  String answer = """
Lorem ipsum dolor sit amet consectetur. Elementum pellentesque ultricies nisi egestas. Erat est accumsan arcu vestibulum morbi viverra vitae egestas id. Turpis faucibus non amet blandit sapien eu augue tortor. 

Cursus lorem risus tellus consectetur eu lacus. Vel non et fames volutpat leo aliquam egestas egestas tortor. Aliquam donec platea in blandit non ornare purus in. Tempor imperdiet tellus nunc vitae at maecenas. Scelerisque dictum ac egestas dolor porttitor sed. 

Cursus condimentum feugiat ultrices amet donec. Et accumsan enim semper massa. Sit lacus condimentum mauris eu in commodo ut non. Lectus donec congue libero velit ut pharetra senectus.
Augue ac nunc placerat suscipit ultricies metus. Vel elementum facilisi diam sollicitudin ultrices aenean cursus nec. Tristique sed quisque aliquam a sit. Amet vestibulum sed aliquet cras velit sit. Sit suspendisse est mollis magna faucibus ut maecenas nisl.

 Eget facilisi pellentesque nulla egestas sem. Non et at id feugiat eleifend dui.
Quam orci mauris in ante vulputate et.

  """;
}
