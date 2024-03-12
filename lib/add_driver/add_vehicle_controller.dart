import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:waiver_driver/app_routes/app_routes.dart';

class AddVehicleControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddVehicleController());
  }
}

class AddVehicleController extends GetxController {
  static AddVehicleController get to => Get.find();
  List<String> vehicleType = <String>[
    "vehicleType1",
    "vehicleType2",
    "vehicleType3",
    "vehicleType4",
  ];
  String? selectedVehicleType;
  List<String> vehicleTransmissionType = <String>[
    "vehicleTransmissionType1",
    "vehicleTransmissionType2",
    "vehicleTransmissionType3",
    "vehicleTransmissionType4",
  ];
  String? selectedVehicleTransmissionType;

  TextEditingController controllerVehicleRegistrationNumber =
      TextEditingController();
  TextEditingController controllerVehicleBrand = TextEditingController();
  TextEditingController controllerVehicleName = TextEditingController();
  TextEditingController controllerVehiclePermitEndDate =
      TextEditingController();
  TextEditingController controllerVehicleInsuranceEndDate =
      TextEditingController();
  GlobalKey<FormState> formKeyForAddVehicle = GlobalKey();
  addVehicle() {
    if (formKeyForAddVehicle.currentState?.validate() ?? false) {
      Get.offAndToNamed(AppRoutes.addProofVehicle);
    }
  }
}
