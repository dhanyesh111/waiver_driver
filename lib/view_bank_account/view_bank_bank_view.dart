import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waiver_driver/app_bar/app_bar.dart';
import 'package:waiver_driver/view_bank_account/view_bank_account_controller.dart';

import '../app_buttons/app_buttons.dart';
import '../test_fields/app_text_form_fields.dart';
import '../validators/validators.dart';

class ViewBankAccountScreen extends StatelessWidget {
  const ViewBankAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: "Add Bank Account"),
      body: Form(
        key: ViewBankAccountController.to.addBankAccountDetails,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 15.sp),
          children: [
            SizedBox(
              height: 30.sp,
            ),
            AppDropDownFormField(
              header: 'Bank Name',
              placeHolder: 'Select',
              itemList: ViewBankAccountController.to.banks,
              onChange: (String? bank) {
                ViewBankAccountController.to.selectedBank = bank;
              },
              value: ViewBankAccountController.to.selectedBank,
              label: (String bank) => bank,
            ),
            SizedBox(
              height: 12.sp,
            ),
            AppTextFormField(
              controller:
                  ViewBankAccountController.to.controllerAccountHolderName,
              header: 'Account Holder name',
              placeHolder: "e.g Muhammed",
              validator: (value) => Validators.isEMail(
                value: value,
              ),
              textInputType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: 12.sp,
            ),
            AppTextFormField(
              controller:
                  ViewBankAccountController.to.controllerBankAccountNumber,
              header: 'Account Number',
              placeHolder: "e.g 0123456789",
              validator: (value) => Validators.isBankAccountNumber(
                value: value,
              ),
              maxLength: 16,
              textInputType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
            SizedBox(
              height: 12.sp,
            ),
            AppTextFormField(
              controller: ViewBankAccountController.to.controllerBankIFSCNumber,
              header: 'IFSC',
              placeHolder: "e.g. AAAA0000000",
              validator: (value) => Validators.isBankISFCNumber(
                value: value,
              ),
            ),
            SizedBox(
              height: 50.sp,
            ),
            BlueButton(
              text: "Add",
              onTap: () => ViewBankAccountController.to.add(),
            ),
          ],
        ),
      ),
    );
  }
}
