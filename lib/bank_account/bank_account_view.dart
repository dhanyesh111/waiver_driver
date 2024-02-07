import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waiver_driver/app_bar/app_bar.dart';
import 'package:waiver_driver/app_buttons/app_buttons.dart';
import 'package:waiver_driver/bank_account/bank_account_controller.dart';

import '../app_colors/app_colors.dart';
import '../test_fields/app_text_form_fields.dart';
import '../validators/validators.dart';

class BankAccountScreen extends StatelessWidget {
  const BankAccountScreen({Key? key}) : super(key: key);

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
            "Bank Account",
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
          AppDropDownFormField(
            header: 'Bank Name',
            placeHolder: 'Select',
            itemList: BankAccountController.to.banks,
            onChange: (String? bank) {
              BankAccountController.to.selectedBank = bank;
            },
            value: BankAccountController.to.selectedBank,
            label: (String bank) => bank,
          ),
          SizedBox(
            height: 12.sp,
          ),
          AppTextFormField(
            controller: BankAccountController.to.controllerAccountHolderName,
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
            controller: BankAccountController.to.controllerBankAccountNumber,
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
            controller: BankAccountController.to.controllerBankIFSCNumber,
            header: 'IFSC',
            placeHolder: "e.g. AAAA0000000",
            validator: (value) => Validators.isBankISFCNumber(
              value: value,
            ),
          ),
          SizedBox(
            height: 30.sp,
          ),
          BlueButton(
            text: "Submit",
            onTap: () => BankAccountController.to.submit(),
          ),
        ],
      ),
    );
  }
}
