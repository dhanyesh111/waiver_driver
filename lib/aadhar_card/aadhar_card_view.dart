import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:waiver_driver/aadhar_card/aadhar_card_controller.dart';
import 'package:waiver_driver/app_bar/app_bar.dart';

import '../app_buttons/app_buttons.dart';
import '../app_colors/app_colors.dart';
import '../circle_with_gradient/circle_with_gradient.dart';
import '../profile_photo/profile_photo_view.dart';
import '../upload_image_template/upload_image_template.dart';

class AadharCardScreen extends StatelessWidget {
  const AadharCardScreen({Key? key}) : super(key: key);

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
              "Aadhar Card",
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
            Container(
              height: 150.sp,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  GetX<AadharCardController>(builder: (controller) {
                    return UpLoadImageTemplate(
                        height: 150.sp,
                        width: 270.sp,
                        placeHolder: "Front Side",
                        isRectangle: true,
                        image: controller.aadharCardFrontSide.value,
                        onTap: (ImageSource source) => controller.uploadPhoto(
                            source: source, isFrontSide: true));
                  }),
                  SizedBox(
                    width: 10.sp,
                  ),
                  GetX<AadharCardController>(builder: (controller) {
                    return UpLoadImageTemplate(
                        height: 150.sp,
                        width: 270.sp,
                        isRectangle: true,
                        placeHolder: "Back Side",
                        image: controller.aadharCardSideBackSide.value,
                        onTap: (ImageSource source) => controller.uploadPhoto(
                            source: source, isFrontSide: false));
                  }),
                ],
              ),
            ),
            GetX<AadharCardController>(builder: (controller) {
              return controller.showErrorMessageAadharCard.value
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 5.sp,
                        ),
                        Text(
                          controller.errorMessageAadharCard.value,
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
              onTap: () => AadharCardController.to.uploadDocument(),
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
