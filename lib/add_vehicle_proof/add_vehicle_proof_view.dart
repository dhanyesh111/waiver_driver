import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:waiver_driver/app_bar/app_bar.dart';
import 'package:waiver_driver/app_routes/app_routes.dart';

import '../app_buttons/app_buttons.dart';
import '../app_colors/app_colors.dart';
import '../chauffeur_proof/chauffeur_proof_view.dart';
import '../circle_with_gradient/circle_with_gradient.dart';
import 'add_vehicle_proof_controller.dart';

class AddVehicleProofScreen extends StatelessWidget {
  const AddVehicleProofScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.transparent,
          elevation: 0,
          isExtended: true,
          onPressed: () => AddVehicleProofController.to.submit(),
          label: BlueButton(
            width: Get.width - 60.sp,
            icon: CircleWithIcon(
                color: AppColors.white,
                height: 25.sp,
                child: Icon(
                  Icons.add,
                  color: AppColors.blue,
                )),
            text: "Add Driver",
          ),
        ),
        appBar: appBar(title: "Add vehicle proof"),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 25.sp),
          children: [
            AddVehicleDetailsContainer(),
            SizedBox(
              height: 15.sp,
            ),
            TermsAndConditionsAddVehicle()
          ],
        ));
  }
}

class TermsAndConditionsAddVehicle extends StatelessWidget {
  const TermsAndConditionsAddVehicle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            GetX<AddVehicleProofController>(builder: (controller) {
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
            RichText(
                text: TextSpan(
                    text: "I agree to the ",
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: AppColors.grey93,
                    ),
                    children: [
                  TextSpan(
                      text: "Terms and Condition",
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: AppColors.blue,
                      ))
                ]))
          ],
        ),
        GetX<AddVehicleProofController>(builder: (controller) {
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

class AddVehicleDetailsContainer extends StatelessWidget {
  const AddVehicleDetailsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.grey155),
          borderRadius: BorderRadius.circular(8.sp)),
      child: Column(
        children: [
          AddProofItem(
            proof: AddVehicleProofController.to.registrationCertificate,
            onTap: () => Get.toNamed(AppRoutes.registrationCertificate),
          ),
          Container(
            height: 1,
            color: AppColors.grey155,
          ),
          AddProofItem(
            proof: AddVehicleProofController.to.vehicleInsurance,
            onTap: () => Get.toNamed(AppRoutes.vehicleInsurance),
          ),
          Container(
            height: 1,
            color: AppColors.grey155,
          ),
          AddProofItem(
            proof: AddVehicleProofController.to.vehiclePermit,
            onTap: () => Get.toNamed(AppRoutes.vehiclePermit),
          ),
          Container(
            height: 1,
            color: AppColors.grey155,
          ),
        ],
      ),
    );
  }
}
