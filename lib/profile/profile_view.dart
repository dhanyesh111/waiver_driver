import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:waiver_driver/app_bar/app_bar.dart';
import 'package:waiver_driver/app_buttons/app_buttons.dart';
import 'package:waiver_driver/app_routes/app_routes.dart';
import 'package:waiver_driver/circle_with_gradient/circle_with_gradient.dart';
import 'package:waiver_driver/profile/profile_controller.dart';
import 'package:waiver_driver/test_fields/app_text_form_fields.dart';

import '../app_colors/app_colors.dart';
import '../assets/icons.dart';
import '../test_fields/app_test_form_field_calender.dart';
import '../validators/validators.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(title: "Profile", actions: [
          GestureDetector(
              onTap: () => Get.toNamed(AppRoutes.help),
              child: Container(
                  margin: EdgeInsets.all(10.sp),
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: AppColors.grey155, width: 1.5.sp),
                      shape: BoxShape.circle),
                  padding: EdgeInsets.all(5.sp),
                  child: Image.asset(
                    AppIcons.customerSupport,
                  )))
        ]),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 15.sp),
          children: [
            SizedBox(
              height: 24.sp,
            ),
            ProfilePhoto(),
            SizedBox(
              height: 24.sp,
            ),
            AppTextFormField(
                readOnly: true,
                controller: ProfileController.to.controllerFullName,
                header: "Full Name"),
            SizedBox(
              height: 12.sp,
            ),
            AppTextFormField(
              controller: ProfileController.to.controllerEmail,
              header: 'Email Address',
              placeHolder: "e.g. muhammed@gmail.com",
              validator: (value) => Validators.isEMail(
                value: value,
              ),
              textInputType: TextInputType.emailAddress,
              readOnly: true,
              icon: BlueButton(
                text: "Edit",
                fontSize: 12.sp,
                onTap: () => Get.bottomSheet(ChangeEmailBottomSheet()),
              ),
            ),
            SizedBox(
              height: 12.sp,
            ),
            AppDropDownFormField(
              header: 'Gender',
              readOnly: true,
              placeHolder: 'Select',
              itemList: ProfileController.to.genderList,
              onChange: (String? gender) {
                ProfileController.to.selectedGender = gender;
              },
              value: ProfileController.to.selectedGender,
              label: (String gender) => gender,
            ),
            SizedBox(
              height: 12.sp,
            ),
            AppDatePickerFormField(
              readOnly: true,
              header: 'Date of Birth as per Documents',
              placeHolder: "Select",
              initialDate:
                  DateTime.now().subtract(const Duration(days: 365 * 20)),
              startDate:
                  DateTime.now().subtract(const Duration(days: 365 * 85)),
              lastDate: DateTime.now().subtract(const Duration(days: 365 * 20)),
              validator: (value) => Validators.isEmpty(value: value),
              controller: ProfileController.to.controllerDateOfBirth,
            ),
            SizedBox(
              height: 12.sp,
            ),
            AppTextFormField(
              controller: ProfileController.to.controllerAlternativeNumber,
              header: 'Alternative Number',
              maxLength: 10,
              placeHolder: " e.g. xxxxxxxxxx",
              validator: (value) => Validators.isMobile(
                value: value,
              ),
              readOnly: true,
              textInputType: TextInputType.phone,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              icon: BlueButton(
                text: "Edit",
                fontSize: 12.sp,
                onTap: () =>
                    Get.bottomSheet(ChangeAlternativeNumberBottomSheet()),
              ),
            ),
            SizedBox(
              height: 12.sp,
            ),
            AppTextFormField(
              controller: ProfileController.to.controllerWhatsAppNumber,
              header: 'Whatsapp Number',
              maxLength: 10,
              placeHolder: " e.g. xxxxxxxxxx",
              validator: (value) => Validators.isMobile(
                value: value,
              ),
              textInputType: TextInputType.phone,
              readOnly: true,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              icon: BlueButton(
                text: "Edit",
                fontSize: 12.sp,
                onTap: () => Get.bottomSheet(ChangeWhatAppNumberBottomSheet()),
              ),
            ),
            SizedBox(
              height: 12.sp,
            ),
            AppDropDownFormField(
              header: 'State',
              placeHolder: 'Select',
              readOnly: true,
              itemList: ProfileController.to.statesList,
              onChange: (String? state) {
                ProfileController.to.selectedState = state;
              },
              value: ProfileController.to.selectedState,
              label: (String state) => state,
            ),
            SizedBox(
              height: 12.sp,
            ),
            AppDropDownFormField(
              header: 'District',
              readOnly: true,
              placeHolder: 'Select',
              itemList: ProfileController.to.districtsList,
              onChange: (String? district) {
                ProfileController.to.selectedDistrict = district;
              },
              value: ProfileController.to.selectedDistrict,
              label: (String district) => district,
            ),
            SizedBox(
              height: 12.sp,
            ),
            AppTextFormField(
              controller: ProfileController.to.controllerAddress,
              header: 'Address as per Documents',
              placeHolder: "e.g. Muhammed",
              validator: (value) => Validators.isEmpty(
                value: value,
              ),
              maxLInes: 5,
              minLines: 1,
              readOnly: true,
            ),
            SizedBox(
              height: 12.sp,
            ),
            AppDropDownFormField(
              readOnly: true,
              header: 'Experience in driving (Years)',
              placeHolder: 'Select',
              itemList: ProfileController.to.yearsOfDrivingExperience,
              onChange: (String? yearsOfDrivingExperience) {
                ProfileController.to.selectedYearsOfDrivingExperience =
                    yearsOfDrivingExperience;
              },
              value: ProfileController.to.selectedYearsOfDrivingExperience,
              label: (String yearsOfDrivingExperience) =>
                  yearsOfDrivingExperience,
            ),
            SizedBox(
              height: 12.sp,
            ),
            AppDropDownFormField(
              readOnly: true,
              header: 'Where you wish to work with us',
              placeHolder: 'Select',
              itemList: ProfileController.to.workingLocations,
              onChange: (String? workingLocation) {
                ProfileController.to.selectedWorkingLocations = workingLocation;
              },
              value: ProfileController.to.selectedWorkingLocations,
              label: (String workingLocation) => workingLocation,
            ),
            SizedBox(
              height: 12.sp,
            ),
            AppDropDownFormField(
              readOnly: true,
              header: 'Vehicle type',
              placeHolder: 'Select',
              itemList: ProfileController.to.vehicleTypes,
              onChange: (String? vehicleType) {
                ProfileController.to.selectedVehicleType = vehicleType;
              },
              value: ProfileController.to.selectedVehicleType,
              label: (String vehicleType) => vehicleType,
            ),
            SizedBox(
              height: 12.sp,
            ),
            AppDropDownFormField(
              readOnly: true,
              header: 'Familiar transmission type?',
              placeHolder: 'Select',
              itemList: ProfileController.to.transmissionTypes,
              onChange: (String? transmissionType) {
                ProfileController.to.selectedTransmissionType =
                    transmissionType;
              },
              value: ProfileController.to.selectedTransmissionType,
              label: (String transmissionType) => transmissionType,
            ),
            SizedBox(
              height: 12.sp,
            ),
            AppDatePickerFormField(
              readOnly: true,
              readOnlyCallBack: () =>
                  Get.bottomSheet(ChangeLicenseValidityDateBottomSheet()),
              header: 'License validity date?',
              placeHolder: "Select",
              startDate: DateTime.now(),
              lastDate: DateTime.now().add(const Duration(days: 365 * 25)),
              validator: (value) => Validators.isEmpty(value: value),
              controller: ProfileController.to.controllerLicenseValidityDate,
              icon: BlueButton(
                text: "Edit",
                fontSize: 12.sp,
                onTap: () =>
                    Get.bottomSheet(ChangeLicenseValidityDateBottomSheet()),
              ),
            ),
            SizedBox(
              height: 30.sp,
            ),
            BlueButton(
              text: "Back",
              onTap: () => Get.back(),
            ),
            SizedBox(
              height: 30.sp,
            ),
          ],
        ));
  }
}

class ChangeEmailBottomSheet extends StatelessWidget {
  const ChangeEmailBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.sp),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8.sp),
            topRight: Radius.circular(8.sp),
          )),
      child: ListView(
        shrinkWrap: true,
        children: [
          Text(
            "Email Address",
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 15.sp,
          ),
          Form(
            key: ProfileController.to.changeEmailFormKey,
            child: AppTextFormField(
              controller: ProfileController.to.controllerEmail,
              header: 'Email Address',
              placeHolder: "e.g. muhammed@gmail.com",
              validator: (value) => Validators.isEMail(
                value: value,
              ),
              textInputType: TextInputType.emailAddress,
              icon: CircleWithIcon(
                height: 25,
                onTap: () => Get.back(),
                color: AppColors.black,
                child: Icon(
                  Icons.close,
                  size: 15.sp,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 25.sp,
          ),
          BlueButton(
            text: "Save Change",
            onTap: () => ProfileController.to.saveChangeEmail(),
          )
        ],
      ),
    );
  }
}

class ChangeAlternativeNumberBottomSheet extends StatelessWidget {
  const ChangeAlternativeNumberBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.sp),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8.sp),
            topRight: Radius.circular(8.sp),
          )),
      child: ListView(
        shrinkWrap: true,
        children: [
          Text(
            "Alternative Number",
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 15.sp,
          ),
          Form(
            key: ProfileController.to.changeAlternativeNumber,
            child: AppTextFormField(
              controller: ProfileController.to.controllerAlternativeNumber,
              header: '',
              maxLength: 10,
              placeHolder: " e.g. xxxxxxxxxx",
              validator: (value) => Validators.isMobile(
                value: value,
              ),
              textInputType: TextInputType.phone,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              icon: CircleWithIcon(
                height: 25,
                onTap: () => Get.back(),
                color: AppColors.black,
                child: Icon(
                  Icons.close,
                  size: 15.sp,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 25.sp,
          ),
          BlueButton(
            text: "Save Change",
            onTap: () => ProfileController.to.saveChangeAlternativeNumber(),
          )
        ],
      ),
    );
  }
}

class ChangeWhatAppNumberBottomSheet extends StatelessWidget {
  const ChangeWhatAppNumberBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.sp),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8.sp),
            topRight: Radius.circular(8.sp),
          )),
      child: ListView(
        shrinkWrap: true,
        children: [
          Text(
            "WhatApp Number",
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 15.sp,
          ),
          Form(
            key: ProfileController.to.changeWhatsAppNumber,
            child: AppTextFormField(
              controller: ProfileController.to.controllerWhatsAppNumber,
              header: 'Whatsapp Number',
              maxLength: 10,
              placeHolder: " e.g. xxxxxxxxxx",
              validator: (value) => Validators.isMobile(
                value: value,
              ),
              textInputType: TextInputType.phone,
              readOnly: true,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              icon: CircleWithIcon(
                height: 25,
                onTap: () => Get.back(),
                color: AppColors.black,
                child: Icon(
                  Icons.close,
                  size: 15.sp,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 25.sp,
          ),
          BlueButton(
            text: "Save Change",
            onTap: () => ProfileController.to.saveChangeWhatsAppNumber(),
          )
        ],
      ),
    );
  }
}

class ChangeLicenseValidityDateBottomSheet extends StatelessWidget {
  const ChangeLicenseValidityDateBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.sp),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8.sp),
            topRight: Radius.circular(8.sp),
          )),
      child: ListView(
        shrinkWrap: true,
        children: [
          Text(
            "License Validity Date",
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 15.sp,
          ),
          Form(
            key: ProfileController.to.changeLicenseValidityDateNumber,
            child: AppDatePickerFormField(
              header: 'License validity date?',
              placeHolder: "Select",
              startDate: DateTime.now(),
              lastDate: DateTime.now().add(const Duration(days: 365 * 25)),
              validator: (value) => Validators.isEmpty(value: value),
              controller: ProfileController.to.controllerLicenseValidityDate,
              icon: CircleWithIcon(
                height: 25,
                onTap: () => Get.back(),
                color: AppColors.black,
                child: Icon(
                  Icons.close,
                  size: 15.sp,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 25.sp,
          ),
          BlueButton(
            text: "Save Change",
            onTap: () =>
                ProfileController.to.saveChangeLicenseValidityDateNumber(),
          )
        ],
      ),
    );
  }
}

class ProfilePhoto extends StatelessWidget {
  const ProfilePhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.sp),
      height: 100.sp,
      width: 100.sp,
      decoration:
          BoxDecoration(color: AppColors.grey155, shape: BoxShape.circle),
      child: Image.asset(
        AppIcons.user,
        color: AppColors.grey93,
      ),
    );
  }
}
