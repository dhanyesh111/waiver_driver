import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:waiver_driver/app_bar/app_bar.dart';
import 'package:waiver_driver/app_buttons/app_buttons.dart';
import 'package:waiver_driver/otp/otp_controller.dart';

import '../app_colors/app_colors.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(title: ""),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 15.sp),
          shrinkWrap: true,
          children: [
            SizedBox(
              height: 25.sp,
            ),
            Text(
              "Verify it’s you",
              style: TextStyle(
                  color: AppColors.black,
                  height: 1,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 14.sp,
            ),
            Text(
              "We send a code to ( ${OtpController.to.mobileCode} ${OtpController.to.mobileNumber} ).Enter it here to verify your identity",
              style: TextStyle(
                  color: AppColors.grey93,
                  fontSize: 16.sp,
                  height: 1,
                  fontWeight: FontWeight.w200),
            ),
            SizedBox(
              height: 30.sp,
            ),
            SizedBox(
              height: 52.sp,
              child: PinFieldAutoFill(
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: BoxLooseDecoration(
                    textStyle:
                        TextStyle(fontSize: 16.sp, color: AppColors.black),
                    radius: Radius.circular(8.sp),
                    strokeColorBuilder: PinListenColorBuilder(
                        AppColors.black, AppColors.grey155),
                    gapSpace: 10.sp),
                currentCode: OtpController.to.code,
                onCodeSubmitted: (code) {
                  OtpController.to.code = code;
                },
                onCodeChanged: (code) {
                  OtpController.to.code = code ?? "";
                  OtpController.to.showIsOtpValid.value = false;
                },
                codeLength: 6,
              ),
            ),
            GetX<OtpController>(builder: (controller) {
              return controller.showIsOtpValid.value
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10.sp,
                        ),
                        Text(
                          "Please enter full Otp",
                          style:
                              TextStyle(fontSize: 14.sp, color: AppColors.red),
                        ),
                      ],
                    )
                  : SizedBox();
            }),
            SizedBox(
              height: 50.sp,
            ),
            BlueButton(
              text: "Confirm",
              onTap: () => OtpController.to.confirm(),
            )
          ],
        ));
  }
}
