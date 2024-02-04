// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../app_colors/app_colors.dart';
// import '../text_style/test_style.dart';
//
// // ignore: must_be_immutable
// class ThaiTextFormField extends StatelessWidget {
//   final String header;
//   final int? maxLInes;
//   final int? minLines;
//   final int? maxLength;
//   final bool? readOnly;
//   final String? placeHolder;
//   String? errorText;
//   final String? Function(String?)? validator;
//   final void Function(String)? onChange;
//   final TextEditingController controller;
//   final TextInputType? textInputType;
//   final List<TextInputFormatter>? inputFormatters;
//
//   ThaiTextFormField(
//       {super.key,
//       required this.controller,
//       this.validator,
//       this.maxLInes,
//       this.readOnly,
//       this.maxLength,
//       this.minLines,
//       this.errorText,
//       this.onChange,
//       this.placeHolder,
//       required this.header,
//       this.textInputType,
//       this.inputFormatters});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         TextFormField(
//           autovalidateMode: AutovalidateMode.onUserInteraction,
//           controller: controller,
//           readOnly: readOnly ?? false,
//           validator: validator,
//           onChanged: onChange,
//           inputFormatters: inputFormatters,
//           keyboardType: textInputType,
//           smartDashesType: SmartDashesType.enabled,
//           maxLines: maxLInes ?? 1,
//           minLines: minLines ?? 1,
//           maxLength: maxLength,
//           decoration: InputDecoration(
//             isDense: false,
//             counterText: "",
//             contentPadding:
//                 EdgeInsets.symmetric(horizontal: 15.sp, vertical: 15.sp),
//             label: Text(header),
//             alignLabelWithHint: true,
//             errorText: (errorText ?? "").isEmpty ? null : errorText,
//             floatingLabelStyle: albertSansRegular.copyWith(
//                 fontSize: 14.sp, color: AppColors.black),
//             labelStyle: albertSansRegular.copyWith(
//                 fontSize: 14.sp, color: AppColors.grey102),
//             filled: true,
//             fillColor: AppColors.white,
//             border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(10.sp),
//                 borderSide: BorderSide(color: AppColors.grey187)),
//             enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(10.sp),
//                 borderSide: BorderSide(color: AppColors.grey187)),
//             focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(10.sp),
//                 borderSide: BorderSide(color: AppColors.grey187)),
//             disabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(10.sp),
//                 borderSide: BorderSide(color: AppColors.grey187)),
//           ),
//         )
//       ],
//     );
//   }
// }
