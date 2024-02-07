import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProfileControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController());
  }
}

class ProfileController extends GetxController {
  @override
  void onInit() {
    controllerFullName.text = "Muhammed";
    super.onInit();
  }

  static ProfileController get to => Get.find();
  TextEditingController controllerFullName = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerAlternativeNumber = TextEditingController();
  TextEditingController controllerWhatsAppNumber = TextEditingController();
  TextEditingController controllerDateOfBirth = TextEditingController();
  TextEditingController controllerAddress = TextEditingController();
  TextEditingController controllerLicenseValidityDate = TextEditingController();
  List<String> genderList = ["Male", "Female", "Other"];
  List<String> statesList = ["State1", "State2", "State3"];
  List<String> districtsList = ["State1", "State2", "State3"];
  List<String> yearsOfDrivingExperience = ["1-5", "5-10", "10-15"];
  List<String> workingLocations = ["location1", "location2", "location3"];
  List<String> vehicleTypes = ["vehicleType1", "vehicleType2", "vehicleType3"];
  List<String> transmissionTypes = [
    "transmissionTypes1",
    "transmissionTypes2",
    "transmissionTypes3"
  ];
  String? selectedGender;
  String? selectedState;
  String? selectedDistrict;
  String? selectedYearsOfDrivingExperience;
  String? selectedWorkingLocations;
  String? selectedVehicleType;
  String? selectedTransmissionType;

  GlobalKey<FormState> changeEmailFormKey = GlobalKey();
  GlobalKey<FormState> changeAlternativeNumber = GlobalKey();
  GlobalKey<FormState> changeWhatsAppNumber = GlobalKey();
  GlobalKey<FormState> changeLicenseValidityDateNumber = GlobalKey();

  saveChangeEmail() {
    if (changeEmailFormKey.currentState?.validate() ?? false) {
      Get.back();
    }
  }

  saveChangeAlternativeNumber() {
    if (changeAlternativeNumber.currentState?.validate() ?? false) {
      Get.back();
    }
  }

  saveChangeWhatsAppNumber() {
    if (changeWhatsAppNumber.currentState?.validate() ?? false) {
      Get.back();
    }
  }

  saveChangeLicenseValidityDateNumber() {
    if (changeLicenseValidityDateNumber.currentState?.validate() ?? false) {
      Get.back();
    }
  }
}
