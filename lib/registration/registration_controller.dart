import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waiver_driver/api_services/api_services.dart';
import 'package:waiver_driver/app_extensions/app_extensions.dart';
import 'package:waiver_driver/app_routes/app_routes.dart';
import 'package:waiver_driver/constants/get_storage_constants.dart';
import 'package:waiver_driver/enums/enums.dart';
import 'package:waiver_driver/main.dart';
import 'package:waiver_driver/registration/registration_model.dart';

import '../snackbar/snackbar.dart';

class RegistrationControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegistrationController());
  }
}

class RegistrationController extends GetxController {
  static RegistrationController get to => Get.find();
  @override
  void onInit() async {
    super.onInit();
    try {
      isLoading.value = true;

      await Future.wait(userTypeCode != UserType.fleet
          ? [
              getAllStates(),
              getWorkExperience(),
              getWorkLocation(),
              getTransmissionTypes(),
              getVehicleTypes(),
            ]
          : [
              getAllStates(),
            ]);
      isLoading.value = false;
      isError.value = false;
    } catch (error) {
      isError.value = true;
    } finally {
      isLoading.value = false;
    }
  }

  RxBool isLoading = false.obs;
  RxBool isError = false.obs;

  String userTypeCode = box.read(BoxConstants.userTypeCode) ?? "";

  GlobalKey<FormState> registrationFormKey = GlobalKey();
  TextEditingController controllerFullName = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerAlternativeNumber = TextEditingController();
  TextEditingController controllerWhatsAppNumber = TextEditingController();
  TextEditingController controllerDateOfBirth = TextEditingController();
  TextEditingController controllerAddress = TextEditingController();
  TextEditingController controllerLicenseValidityDate = TextEditingController();
  List<GenderModel> genderList = [
    GenderModel(label: "Male", code: "M"),
    GenderModel(label: "Female", code: "F"),
    GenderModel(label: "Other", code: "O")
  ];
  List<StatesModel> statesList = [];
  List<DistrictModel> districtsList = [];
  List<WorkExperience> yearsOfDrivingExperience = [];
  List<WorkLocation> workingLocations = [];
  List<VehicleType> vehicleTypes = [];
  List<Transmission> transmissionTypes = [];
  GenderModel? selectedGender;
  StatesModel? selectedState;
  DistrictModel? selectedDistrict;
  WorkExperience? selectedYearsOfDrivingExperience;
  WorkLocation? selectedWorkingLocation;
  VehicleType? selectedVehicleType;
  Transmission? selectedTransmissionType;

  RxBool isAgreedToTermsAndConditions = false.obs;
  RxBool isAgreedToPrivacyPolicy = false.obs;
  RxBool showTermsAndConditionsError = false.obs;
  RxBool showPrivacyPolicyError = false.obs;

  Future<void> getAllStates() async {
    GetAllStatesResponseModel response = await ApiServices.getAllStates();
    statesList = response.data ?? [];
  }

  Future<void> getWorkLocation() async {
    GetAllWorkLocationsResponseModel response =
        await ApiServices.getWorkLocation();
    workingLocations = response.data ?? [];
  }

  Future<void> getVehicleTypes() async {
    GetVehicleTypeResponseModel response = await ApiServices.getVehicleTypes();
    vehicleTypes = response.data ?? [];
  }

  Future<void> getTransmissionTypes() async {
    GetTransmissionTypeResponseModel response =
        await ApiServices.getTransmissionTypes();
    transmissionTypes = response.data ?? [];
  }

  Future<void> getWorkExperience() async {
    GetAllWorkExperienceResponseModel response =
        await ApiServices.getWorkExperience();
    yearsOfDrivingExperience = response.data ?? [];
  }

  Rx<DropDownState> districtDropDownState = DropDownState.hidden.obs;
  Future<void> getAllDistricts() async {
    try {
      districtDropDownState.value = DropDownState.loading;
      selectedDistrict = null;
      GetAllDistrictsResponseModel response = await ApiServices.getAllDistricts(
          queryParameter: {"state": (selectedState!.id).toString()});
      districtsList = response.data ?? [];
      if (districtsList.isEmpty) {
        districtDropDownState.value = DropDownState.hidden;
        Get.showSnackbar(GetSnackBar(
            duration: const Duration(seconds: 5),
            backgroundColor: Colors.transparent,
            padding: EdgeInsets.zero,
            messageText: AppSnackBar(
                text:
                    "There are no Serviceable Districts in ${selectedState!.name ?? ""}")));
      } else {
        districtDropDownState.value = DropDownState.loaded;
      }
    } catch (error) {
      print(error);
      Get.showSnackbar(const GetSnackBar(
          duration: Duration(seconds: 5),
          backgroundColor: Colors.transparent,
          padding: EdgeInsets.zero,
          messageText: AppSnackBar(text: "OOPS Something went wrong")));
      districtDropDownState.value = DropDownState.hidden;
    }
  }

  register() async {
    if (registrationFormKey.currentState?.validate() ?? false) {
      if (!isAgreedToTermsAndConditions.value) {
        showTermsAndConditionsError.value = true;
      }
      if (!isAgreedToPrivacyPolicy.value) {
        showPrivacyPolicyError.value = true;
      }
      if (isAgreedToPrivacyPolicy.value && isAgreedToTermsAndConditions.value) {
        Map<String, String> body = {
          "fullname": controllerFullName.text.trim(),
          "email": controllerEmail.text.trim(),
          "gender": selectedGender!.code,
          "dob": controllerDateOfBirth.text.changeDateFormat(),
          "alternative_phone": controllerAlternativeNumber.text.trim(),
          "whatsapp_phone": controllerWhatsAppNumber.text.trim(),
          "state": selectedState!.id.toString(),
          "district": selectedDistrict!.id.toString(),
          "address": controllerAddress.text.trim(),
        };

        body.addAllIf(userTypeCode != UserTypeCode.fleet, {
          "driving_experience": selectedYearsOfDrivingExperience!.id.toString(),
          "work_location": selectedWorkingLocation!.id.toString(),
          "vehicle_type": selectedVehicleType!.id.toString(),
          "transmission_type": selectedTransmissionType!.id.toString(),
          "license_validity":
              controllerLicenseValidityDate.text.changeDateFormat(),
        });

        CreateDriverProfileResponseModel response =
            await ApiServices.createProfile(body: body);
        if (response.status == 200) {
          box.write(BoxConstants.userName, response.data?.fullname ?? "");
          box.write(BoxConstants.userImage, response.data?.profileImage ?? "");
          Get.offAllNamed(AppRoutes.chauffeurProof);
        }
      }

      // Get.toNamed(AppRoutes.chauffeurProof, arguments: controllerFullName.text);
      // }
    }
  }
}
