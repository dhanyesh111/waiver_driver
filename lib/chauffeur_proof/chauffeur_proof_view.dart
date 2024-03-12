import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:waiver_driver/app_bar/app_bar.dart';
import 'package:waiver_driver/app_routes/app_routes.dart';
import 'package:waiver_driver/assets/icons.dart';
import 'package:waiver_driver/chauffeur_proof/chauffeur_proof_controller.dart';
import 'package:waiver_driver/chauffeur_proof/chauffeur_proof_model.dart';
import 'package:waiver_driver/enums/enums.dart';

import '../app_buttons/app_buttons.dart';
import '../app_colors/app_colors.dart';
import '../circle_with_gradient/circle_with_gradient.dart';

class ChauffeurProofScreen extends StatelessWidget {
  const ChauffeurProofScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(title: ""),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 15.sp),
          children: [
            SizedBox(
              height: 20.sp,
            ),
            Text(
              "Welcome, ${ChauffeurProofController.to.chauffeurName}",
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
              "Please complete the required steps and start driving with Waiver",
              style: TextStyle(
                  color: AppColors.grey93,
                  fontSize: 16.sp,
                  height: 1,
                  fontWeight: FontWeight.w200),
            ),
            SizedBox(
              height: 30.sp,
            ),
            ChauffeurProofItemList(),
            SizedBox(
              height: 15.sp,
            ),
            TermsAndConditionsChauffeurProof(),
            SizedBox(
              height: 30.sp,
            ),
            BlueButton(
              text: "Continue",
              onTap: () => ChauffeurProofController.to.continueTo(),
            )
          ],
        ));
  }
}

class TermsAndConditionsChauffeurProof extends StatelessWidget {
  const TermsAndConditionsChauffeurProof({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            GetX<ChauffeurProofController>(builder: (controller) {
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
        GetX<ChauffeurProofController>(builder: (controller) {
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

class ChauffeurProofItemList extends StatelessWidget {
  const ChauffeurProofItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.sp),
          border: Border.all(color: AppColors.grey155)),
      child: Column(
        children: [
          AddProofItem(
            proof: ChauffeurProofController.to.profilePhoto,
            onTap: () => Get.toNamed(AppRoutes.profilePhoto),
          ),
          Container(
            height: 1,
            color: AppColors.grey155,
          ),
          AddProofItem(
            proof: ChauffeurProofController.to.aadharCard,
            onTap: () => Get.toNamed(AppRoutes.aadharCard),
          ),
          Container(
            height: 1,
            color: AppColors.grey155,
          ),
          AddProofItem(
            proof: ChauffeurProofController.to.drivingLicense,
            onTap: () => Get.toNamed(AppRoutes.drivingLicence),
          ),
          Container(
            height: 1,
            color: AppColors.grey155,
          ),
          AddProofItem(
            proof: ChauffeurProofController.to.policeClearanceCertificate,
            onTap: () => Get.toNamed(AppRoutes.policeClearanceCertificate),
          ),
          Container(
            height: 1,
            color: AppColors.grey155,
          ),
          AddProofItem(
            proof: ChauffeurProofController.to.bankAccount,
            onTap: () => Get.toNamed(AppRoutes.bankAccount),
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

class AddProofItem extends StatelessWidget {
  AddProofItemModel proof;
  Function()? onTap;
  AddProofItem({required this.proof, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.sp),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Hero(
              tag: proof.text,
              child: Text(proof.text,
                  style: TextStyle(
                      color: AppColors.black,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600)),
            ),
            GetX<ChauffeurProofController>(builder: (controller) {
              return ChauffeurProofItemContainer(
                status: proof.approvalStatus.value,
              );
            }),
          ],
        ),
      ),
    );
  }
}

class ChauffeurProofItemContainer extends StatelessWidget {
  ChauffeurProofApprovalStatus status;
  ChauffeurProofItemContainer({required this.status});

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case ChauffeurProofApprovalStatus.notUpload:
        return SvgPicture.asset(
          AppIcons.arrowRight,
          height: 15.sp,
        );
      case ChauffeurProofApprovalStatus.waitingForApproval:
        return CircleWithIcon(
          height: 20.sp,
          color: AppColors.blue,
          child: Icon(
            Icons.timelapse,
            size: 16.sp,
            color: AppColors.white,
          ),
        );

      case ChauffeurProofApprovalStatus.approved:
        return CircleWithIcon(
          height: 20.sp,
          color: AppColors.green40,
          child: Icon(
            Icons.check,
            size: 16.sp,
            color: AppColors.white,
          ),
        );
    }
  }
}
