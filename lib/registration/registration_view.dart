import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:waiver_driver/app_bar/app_bar.dart';
import 'package:waiver_driver/app_buttons/app_buttons.dart';
import 'package:waiver_driver/registration/registration_controller.dart';
import 'package:waiver_driver/validators/validators.dart';

import '../app_colors/app_colors.dart';
import '../enums/enums.dart';
import '../loading_animation/loading_animation.dart';
import '../test_fields/app_test_form_field_calender.dart';
import '../test_fields/app_text_form_fields.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(title: ""),
        body: Form(
          key: RegistrationController.to.registrationFormKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 15.sp),
            children: [
              SizedBox(
                height: 20.sp,
              ),
              Text(
                " Welcome new Waiver partner! Drive forward",
                style: TextStyle(
                    color: AppColors.black,
                    height: 1,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 12.sp,
              ),
              Text(
                "Please enter the partner details",
                style: TextStyle(
                    color: AppColors.grey93,
                    fontSize: 16.sp,
                    height: 1,
                    fontWeight: FontWeight.w200),
              ),
              SizedBox(
                height: 30.sp,
              ),
              AppTextFormField(
                controller: RegistrationController.to.controllerFullName,
                header: 'Full Name',
                placeHolder: "e.g. Muhammed",
                validator: (value) => Validators.isEmpty(
                  value: value,
                ),
              ),
              SizedBox(
                height: 12.sp,
              ),
              AppTextFormField(
                controller: RegistrationController.to.controllerEmail,
                header: 'Email Address',
                placeHolder: "e.g. muhammed@gmail.com",
                validator: (value) => Validators.isEMail(
                  value: value,
                ),
                textInputType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 12.sp,
              ),
              AppDropDownFormField(
                header: 'Gender',
                placeHolder: 'Select',
                itemList: RegistrationController.to.genderList,
                onChange: (String? gender) {
                  RegistrationController.to.selectedGender = gender;
                },
                value: RegistrationController.to.selectedGender,
                label: (String gender) => gender,
              ),
              SizedBox(
                height: 12.sp,
              ),
              AppDatePickerFormField(
                header: 'Date of Birth as per Documents',
                placeHolder: "Select",
                initialDate:
                    DateTime.now().subtract(const Duration(days: 365 * 20)),
                startDate:
                    DateTime.now().subtract(const Duration(days: 365 * 85)),
                lastDate:
                    DateTime.now().subtract(const Duration(days: 365 * 20)),
                validator: (value) => Validators.isEmpty(value: value),
                controller: RegistrationController.to.controllerDateOfBirth,
              ),
              SizedBox(
                height: 12.sp,
              ),
              AppTextFormField(
                controller:
                    RegistrationController.to.controllerAlternativeNumber,
                header: 'Alternative Number',
                maxLength: 10,
                placeHolder: " e.g. xxxxxxxxxx",
                validator: (value) => Validators.isMobile(
                  value: value,
                ),
                textInputType: TextInputType.phone,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
              SizedBox(
                height: 12.sp,
              ),
              AppTextFormField(
                controller: RegistrationController.to.controllerWhatsAppNumber,
                header: 'Whatsapp Number',
                maxLength: 10,
                placeHolder: " e.g. xxxxxxxxxx",
                validator: (value) => Validators.isMobile(
                  value: value,
                ),
                textInputType: TextInputType.phone,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
              SizedBox(
                height: 12.sp,
              ),
              AppDropDownFormField(
                header: 'State',
                placeHolder: 'Select',
                itemList: RegistrationController.to.statesList,
                onChange: (String? state) {
                  RegistrationController.to.selectedState = state;
                },
                value: RegistrationController.to.selectedState,
                label: (String state) => state,
              ),
              SizedBox(
                height: 12.sp,
              ),
              GetX<RegistrationController>(builder: (controller) {
                switch (controller.districtDropState.value) {
                  case DropDownState.hidden:
                    return const SizedBox();
                  case DropDownState.loading:
                    return LoadingAnimationDots(
                      height: 50.sp,
                    );
                  case DropDownState.loaded:
                    return Column(
                      children: [
                        AppDropDownFormField(
                          header: 'District',
                          placeHolder: 'Select',
                          itemList: RegistrationController.to.districtsList,
                          onChange: (String? district) {
                            RegistrationController.to.selectedDistrict =
                                district;
                          },
                          value: RegistrationController.to.selectedDistrict,
                          label: (String district) => district,
                        ),
                        SizedBox(
                          height: 12.sp,
                        ),
                      ],
                    );
                }
              }),
              SizedBox(
                height: 12.sp,
              ),
              AppTextFormField(
                controller: RegistrationController.to.controllerAddress,
                header: 'Address as per Documents',
                placeHolder: "e.g. Muhammed",
                validator: (value) => Validators.isEmpty(
                  value: value,
                ),
                maxLInes: 5,
                minLines: 1,
              ),
              SizedBox(
                height: 12.sp,
              ),
              AppDropDownFormField(
                header: 'Experience in driving (Years)',
                placeHolder: 'Select',
                itemList: RegistrationController.to.yearsOfDrivingExperience,
                onChange: (String? yearsOfDrivingExperience) {
                  RegistrationController.to.selectedYearsOfDrivingExperience =
                      yearsOfDrivingExperience;
                },
                value:
                    RegistrationController.to.selectedYearsOfDrivingExperience,
                label: (String yearsOfDrivingExperience) =>
                    yearsOfDrivingExperience,
              ),
              SizedBox(
                height: 12.sp,
              ),
              AppDropDownFormField(
                header: 'Where you wish to work with us',
                placeHolder: 'Select',
                itemList: RegistrationController.to.workingLocations,
                onChange: (String? workingLocation) {
                  RegistrationController.to.selectedWorkingLocations =
                      workingLocation;
                },
                value: RegistrationController.to.selectedWorkingLocations,
                label: (String workingLocation) => workingLocation,
              ),
              SizedBox(
                height: 12.sp,
              ),
              AppDropDownFormField(
                header: 'Vehicle type',
                placeHolder: 'Select',
                itemList: RegistrationController.to.vehicleTypes,
                onChange: (String? vehicleType) {
                  RegistrationController.to.selectedVehicleType = vehicleType;
                },
                value: RegistrationController.to.selectedVehicleType,
                label: (String vehicleType) => vehicleType,
              ),
              SizedBox(
                height: 12.sp,
              ),
              AppDropDownFormField(
                header: 'Familiar transmission type?',
                placeHolder: 'Select',
                itemList: RegistrationController.to.transmissionTypes,
                onChange: (String? transmissionType) {
                  RegistrationController.to.selectedTransmissionType =
                      transmissionType;
                },
                value: RegistrationController.to.selectedTransmissionType,
                label: (String transmissionType) => transmissionType,
              ),
              SizedBox(
                height: 12.sp,
              ),
              AppDatePickerFormField(
                header: 'License validity date?',
                placeHolder: "Select",
                startDate: DateTime.now(),
                lastDate: DateTime.now().add(const Duration(days: 365 * 25)),
                validator: (value) => Validators.isEmpty(value: value),
                controller:
                    RegistrationController.to.controllerLicenseValidityDate,
              ),
              SizedBox(
                height: 12.sp,
              ),
              const TermsAndConditions(),
              const PrivacyPolicy(),
              SizedBox(
                height: 25.sp,
              ),
              BlueButton(
                text: "Continue",
                onTap: () => RegistrationController.to.register(),
              ),
              SizedBox(
                height: 45.sp,
              ),
            ],
          ),
        ));
  }
}

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            GetX<RegistrationController>(builder: (controller) {
              return Checkbox(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  value: controller.isAgreedToTermsAndConditions.value,
                  onChanged: (isAgreed) {
                    controller.isAgreedToTermsAndConditions.value =
                        !controller.isAgreedToTermsAndConditions.value;
                    controller.showTermsAndConditionsError.value = false;
                  });
            }),
            SizedBox(
              width: 5.sp,
            ),
            Text(
              "Lorem ipsum dolor sit amet",
              style: TextStyle(fontSize: 16.sp, color: AppColors.grey93),
            )
          ],
        ),
        GetX<RegistrationController>(builder: (controller) {
          return controller.showTermsAndConditionsError.value
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Please agree to Terms and Conditions",
                      style: TextStyle(fontSize: 14.sp, color: AppColors.red),
                    ),
                  ],
                )
              : SizedBox();
        })
      ],
    );
  }
}

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            GetX<RegistrationController>(builder: (controller) {
              return Checkbox(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  value: controller.isAgreedToPrivacyPolicy.value,
                  onChanged: (isAgreed) {
                    controller.isAgreedToPrivacyPolicy.value =
                        !controller.isAgreedToPrivacyPolicy.value;
                    controller.showPrivacyPolicyError.value = false;
                  });
            }),
            SizedBox(
              width: 5.sp,
            ),
            Text(
              "Lorem ipsum dolor sit amet",
              style: TextStyle(fontSize: 16.sp, color: AppColors.grey93),
            )
          ],
        ),
        GetX<RegistrationController>(builder: (controller) {
          return controller.showPrivacyPolicyError.value
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Please agree to Privacy Policy",
                      style: TextStyle(fontSize: 14.sp, color: AppColors.red),
                    ),
                  ],
                )
              : SizedBox();
        })
      ],
    );
  }
}
