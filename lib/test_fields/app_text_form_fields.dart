import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_colors/app_colors.dart';

// ignore: must_be_immutable
class AppTextFormField extends StatelessWidget {
  final String header;
  final int? maxLInes;
  final int? minLines;
  final int? maxLength;
  final bool? readOnly;
  final String? placeHolder;
  final Widget? icon;
  String? errorText;
  final String? Function(String?)? validator;
  final void Function(String)? onChange;
  final TextEditingController controller;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatters;

  AppTextFormField(
      {super.key,
      required this.controller,
      this.validator,
      this.maxLInes,
      this.readOnly,
      this.icon,
      this.maxLength,
      this.minLines,
      this.errorText,
      this.onChange,
      this.placeHolder,
      required this.header,
      this.textInputType,
      this.inputFormatters});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        header.isNotEmpty
            ? Column(
                children: [
                  Text(
                    header,
                    style: TextStyle(
                        fontSize: 15.sp,
                        color: AppColors.black,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 7.sp,
                  )
                ],
              )
            : const SizedBox(),
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: controller,
          style: TextStyle(
              fontSize: 16.sp,
              color: (readOnly ?? false) ? AppColors.black : AppColors.grey93),
          readOnly: readOnly ?? false,
          validator: validator,
          onChanged: onChange,
          inputFormatters: inputFormatters,
          keyboardType: textInputType,
          smartDashesType: SmartDashesType.enabled,
          maxLines: maxLInes ?? 1,
          minLines: minLines ?? 1,
          maxLength: maxLength,
          decoration: InputDecoration(
            isDense: false,
            suffixIcon: Container(
              padding: EdgeInsets.only(right: 13.sp),
              child: icon,
            ),
            suffixIconConstraints: BoxConstraints(
              maxHeight: 25.sp,
              maxWidth: 65.sp,
            ),
            counterText: "",
            hintText: placeHolder,
            hintStyle: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.grey122),
            contentPadding:
                EdgeInsets.symmetric(horizontal: 15.sp, vertical: 13.sp),
            alignLabelWithHint: true,
            errorText: (errorText ?? "").isEmpty ? null : errorText,
            filled: true,
            fillColor:
                (readOnly ?? false) ? AppColors.grey249 : AppColors.white,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.sp),
                borderSide: BorderSide(
                    color: (readOnly ?? false)
                        ? AppColors.grey249
                        : AppColors.grey155)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.sp),
                borderSide: BorderSide(
                    color: (readOnly ?? false)
                        ? AppColors.grey249
                        : AppColors.grey155)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.sp),
                borderSide: BorderSide(
                    color: (readOnly ?? false)
                        ? AppColors.grey249
                        : AppColors.grey155)),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.sp),
                borderSide: BorderSide(
                    color: (readOnly ?? false)
                        ? AppColors.grey249
                        : AppColors.grey155)),
          ),
        )
      ],
    );
  }
}

class AppDropDownFormField<T> extends StatelessWidget {
  final String header;
  final String? placeHolder;
  final String? errorText;
  final bool? validationNeeded;
  final double? width;
  final bool? readOnly;
  final String? Function(T) label;
  T? value;
  final String? Function(T?)? validator;
  void Function(T?)? onChange;
  final List<T> itemList;

  AppDropDownFormField(
      {super.key,
      required this.header,
      required this.onChange,
      required this.value,
      required this.itemList,
      this.errorText,
      this.width,
      this.readOnly,
      this.placeHolder,
      required this.label,
      this.validationNeeded,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            header,
            style: TextStyle(
                fontSize: 15.sp,
                color: AppColors.black,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 7.sp,
          ),
          AbsorbPointer(
            absorbing: readOnly ?? false,
            child: DropdownButtonFormField<T>(
                iconSize: 0,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: validator ??
                    (value) {
                      if (value == null) {
                        return errorText ?? "This field is required";
                      } else {
                        return null;
                      }
                    },
                itemHeight: null,
                isExpanded: true,
                hint: Text(
                  placeHolder ?? "",
                  style: TextStyle(color: AppColors.grey122, fontSize: 14.sp),
                ),
                style: TextStyle(fontSize: 16.sp, color: AppColors.grey93),
                decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: 15.sp, vertical: 13.sp),
                    floatingLabelAlignment: FloatingLabelAlignment.start,
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    filled: true,
                    counterText: "",
                    fillColor: (readOnly ?? false)
                        ? AppColors.grey249
                        : AppColors.white,
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: (readOnly ?? false)
                                ? AppColors.grey249
                                : AppColors.grey155),
                        borderRadius: BorderRadius.circular(8.sp)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: (readOnly ?? false)
                                ? AppColors.grey249
                                : AppColors.grey155),
                        borderRadius: BorderRadius.circular(8.sp)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: (readOnly ?? false)
                                ? AppColors.grey249
                                : AppColors.grey155),
                        borderRadius: BorderRadius.circular(8.sp)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: (readOnly ?? false)
                                ? AppColors.grey249
                                : AppColors.grey155),
                        borderRadius: BorderRadius.circular(8.sp))),
                isDense: true,
                iconEnabledColor: AppColors.grey122,
                iconDisabledColor: AppColors.grey122,
                items: itemList
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(
                            label(e) ?? "",
                            style: TextStyle(
                                fontSize: 16.sp, color: AppColors.grey93),
                          ),
                        ))
                    .toList(),
                value: value,
                onChanged: onChange),
          ),
        ],
      ),
    );
  }
}
