import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waiver_driver/app_bar/app_bar.dart';
import 'package:waiver_driver/app_buttons/app_buttons.dart';
import 'package:waiver_driver/test_fields/app_test_form_field_calender.dart';
import 'package:waiver_driver/test_fields/app_text_form_fields.dart';
import 'package:waiver_driver/validators/validators.dart';

import 'add_vehicle_controller.dart';

class AddVehicleScreen extends StatelessWidget {
  const AddVehicleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(title: "Add Driver Details"),
        body: Form(
          key: AddVehicleController.to.formKeyForAddVehicle,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 25.sp),
            children: [
              AppTextFormField(
                controller:
                    AddVehicleController.to.controllerVehicleRegistrationNumber,
                header: "Vehicle registration number",
                placeHolder: "e.g. KL65 K505",
                validator: (value) => Validators.isEmpty(value: value),
              ),
              SizedBox(
                height: 15.sp,
              ),
              AppTextFormField(
                controller: AddVehicleController.to.controllerVehicleBrand,
                header: "Vehicle Brand",
                placeHolder: "e.g. Toyota",
                validator: (value) => Validators.isEmpty(value: value),
              ),
              SizedBox(
                height: 15.sp,
              ),
              AppTextFormField(
                controller: AddVehicleController.to.controllerVehicleName,
                header: "Vehicle Name",
                placeHolder: "e.g. Swift",
                validator: (value) => Validators.isEmpty(value: value),
              ),
              SizedBox(
                height: 15.sp,
              ),
              AppDropDownFormField(
                  header: "Vehicle type",
                  onChange: (vehicleType) {
                    AddVehicleController.to.selectedVehicleType = vehicleType;
                  },
                  value: AddVehicleController.to.selectedVehicleType,
                  itemList: AddVehicleController.to.vehicleType,
                  label: (vehicleType) => vehicleType),
              SizedBox(
                height: 15.sp,
              ),
              AppDropDownFormField(
                  header: "Vehicle Transmission type",
                  onChange: (vehicleTransmissionType) {
                    AddVehicleController.to.selectedVehicleTransmissionType =
                        vehicleTransmissionType;
                  },
                  value:
                      AddVehicleController.to.selectedVehicleTransmissionType,
                  itemList: AddVehicleController.to.vehicleTransmissionType,
                  label: (vehicleTransmissionType) => vehicleTransmissionType),
              SizedBox(
                height: 15.sp,
              ),
              AppDatePickerFormField(
                  header: "Permit End Date",
                  startDate: DateTime.now(),
                  controller:
                      AddVehicleController.to.controllerVehiclePermitEndDate),
              SizedBox(
                height: 15.sp,
              ),
              AppDatePickerFormField(
                  header: "Insurance End Date",
                  startDate: DateTime.now(),
                  controller: AddVehicleController
                      .to.controllerVehicleInsuranceEndDate),
              SizedBox(
                height: 30.sp,
              ),
              BlueButton(
                text: "Continue",
                onTap: () => AddVehicleController.to.addVehicle(),
              )
            ],
          ),
        ));
  }
}
