import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:waiver_driver/app_routes/app_routes.dart';
import 'package:waiver_driver/enums/enums.dart';

class RegistrationControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegistrationController());
  }
}

class RegistrationController extends GetxController {
  static RegistrationController get to => Get.find();
  GlobalKey<FormState> registrationFormKey = GlobalKey();
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
  Rx<DropDownState> districtDropState = DropDownState.loaded.obs;
  RxBool isAgreedToTermsAndConditions = false.obs;
  RxBool isAgreedToPrivacyPolicy = false.obs;
  RxBool showTermsAndConditionsError = false.obs;
  RxBool showPrivacyPolicyError = false.obs;
  register() {
    Get.toNamed(AppRoutes.chauffeurProof, arguments: controllerFullName.text);
    if (registrationFormKey.currentState?.validate() ?? false) {
      if (!isAgreedToTermsAndConditions.value) {
        showTermsAndConditionsError.value = true;
      }
      if (!isAgreedToPrivacyPolicy.value) {
        showPrivacyPolicyError.value = true;
      }
      // if (isAgreedToPrivacyPolicy.value && isAgreedToTermsAndConditions.value) {
      // Get.toNamed(AppRoutes.chauffeurProof, arguments: controllerFullName.text);
      // }
    }
  }
}
