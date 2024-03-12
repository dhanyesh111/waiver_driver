import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:waiver_driver/app_bar/app_bar.dart';
import 'package:waiver_driver/registration_certificate/registration_certificate_controller.dart';

import '../app_buttons/app_buttons.dart';
import '../app_colors/app_colors.dart';
import '../circle_with_gradient/circle_with_gradient.dart';
import '../profile_photo/profile_photo_view.dart';
import '../upload_image_template/upload_image_template.dart';

class RegistrationCertificateScreen extends StatelessWidget {
  const RegistrationCertificateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(title: ""),
        body: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 15.sp),
          children: [
            SizedBox(
              height: 20.sp,
            ),
            Text(
              "Registration Certificate",
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
              "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumyLorem ipsum dolor sit amet, consetetur.",
              style: TextStyle(
                  color: AppColors.grey93,
                  fontSize: 16.sp,
                  height: 1,
                  fontWeight: FontWeight.w200),
            ),
            SizedBox(
              height: 30.sp,
            ),
            ChauffeurProofInstructionItem(
              text: "Photocopies and printout are not acceptable",
            ),
            SizedBox(
              height: 8.sp,
            ),
            ChauffeurProofInstructionItem(
              text:
                  "Uploaded document should be less than 10MB and it should belong to JPG, JPEG, PNG, PDF type only",
            ),
            SizedBox(
              height: 30.sp,
            ),
            SizedBox(
              height: 150.sp,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  GetX<RegistrationCertificateController>(
                      builder: (controller) {
                    return UpLoadImageTemplate(
                        height: 150.sp,
                        width: 270.sp,
                        placeHolder: "Front Side",
                        isRectangle: true,
                        image:
                            controller.registrationCertificateFrontSide.value,
                        onTap: (ImageSource source) => controller.uploadPhoto(
                            source: source, isFrontSide: true));
                  }),
                  SizedBox(
                    width: 10.sp,
                  ),
                  GetX<RegistrationCertificateController>(
                      builder: (controller) {
                    return UpLoadImageTemplate(
                        height: 150.sp,
                        width: 270.sp,
                        isRectangle: true,
                        placeHolder: "Back Side",
                        image: controller
                            .registrationCertificateSideBackSide.value,
                        onTap: (ImageSource source) => controller.uploadPhoto(
                            source: source, isFrontSide: false));
                  }),
                ],
              ),
            ),
            GetX<RegistrationCertificateController>(builder: (controller) {
              return controller.showErrorMessageRegistrationCertificate.value
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 5.sp,
                        ),
                        Text(
                          RegistrationCertificateController
                              .to.errorMessageRegistrationCertificate.value,
                          style: TextStyle(color: AppColors.red),
                        ),
                      ],
                    )
                  : SizedBox();
            }),
            SizedBox(
              height: 60.sp,
            ),
            BlueButton(
              text: "Upload",
              onTap: () =>
                  RegistrationCertificateController.to.uploadDocument(),
              icon: CircleWithIcon(
                height: 25.sp,
                color: AppColors.white,
                child: Icon(
                  Icons.add,
                  size: 20.sp,
                  color: AppColors.blue,
                ),
              ),
            )
          ],
        ));
  }
}
