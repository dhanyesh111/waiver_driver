import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../api_services/urls.dart';
import '../app_colors/app_colors.dart';

class AppNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double? height;
  final double? width;
  final double? radius;
  final bool? isProfile;
  final BoxFit? fit;

  const AppNetworkImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.radius,
    this.fit,
    this.isProfile,
    this.height,
  });
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius ?? 0),
      child: Image.network(
        "${AppUrls.baseUrlForImage}/Images/$imageUrl",
        errorBuilder:
            (BuildContext context, Object exception, StackTrace? stackTrace) {
          return (isProfile ?? false)
              ? Container(
                  padding: EdgeInsets.all(7.sp),
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.white),
                      shape: BoxShape.circle),
                  child: SvgPicture.asset(
                    // AppIcons.user,
                    "",
                    color: AppColors.white,
                    height: (height ?? 50.sp) - 14,
                    width: (width ?? 50.sp) - 14,
                  ),
                )
              : Icon(
                  Icons.broken_image_rounded,
                  color: AppColors.black,
                );
        },
        loadingBuilder: (BuildContext context, Widget child,
            ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }
          return CircularProgressIndicator(
            color: AppColors.white,
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                    loadingProgress.expectedTotalBytes!
                : null,
          );
        },
        height: height,
        fit: fit ?? BoxFit.fill,
        width: width ?? 50.sp,
      ),
    );
  }
}
