import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:waiver_driver/app_bar/app_bar.dart';
import 'package:waiver_driver/app_colors/app_colors.dart';
import 'package:waiver_driver/assets/icons.dart';
import 'package:waiver_driver/circle_with_gradient/circle_with_gradient.dart';
import 'package:waiver_driver/constants/get_storage_constants.dart';
import 'package:waiver_driver/empty_page/empty_page.dart';
import 'package:waiver_driver/error_page/error_page.dart';
import 'package:waiver_driver/loading_animation/loading_animation.dart';
import 'package:waiver_driver/notification/notification_controller.dart';
import 'package:waiver_driver/notification/notification_model.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(title: "Notification"),
        body: GetX<NotificationController>(builder: (controller) {
          return controller.isLoading.value
              ? const LoadingBarsAnimation()
              : controller.isError.value
                  ? ErrorPage()
                  : controller.notification.isNotEmpty
                      ? EmptyPage(
                          text: "No Notification found",
                        )
                      : ListView(
                          controller: controller.scrollController,
                          padding: EdgeInsets.symmetric(horizontal: 15.sp),
                          children: [
                            SizedBox(
                              height: 20.sp,
                            ),
                            Column(
                              children: NotificationController.to.notification
                                  .map((notification) =>
                                      NotificationListingItem(
                                          notification: notification))
                                  .toList(),
                            ),
                            GetX<NotificationController>(builder: (controller) {
                              return controller.isListCompeted.value
                                  ? LoadingBarsAnimation(
                                      height: 200.sp,
                                    )
                                  : const SizedBox();
                            })
                          ],
                        );
        }));
  }
}

class NotificationListingItem extends StatelessWidget {
  NotificationModel notification;
  NotificationListingItem({required this.notification});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.sp),
      padding: EdgeInsets.all(15.sp),
      decoration: BoxDecoration(
          color: AppColors.grey249, borderRadius: BorderRadius.circular(8.sp)),
      child: Row(
        children: [
          CircleWithIcon(
              height: 43.sp,
              color: AppColors.black,
              child: Image.asset(
                notification.notificationType == NotificationType.cashBack
                    ? AppIcons.offers
                    : notification.notificationType == NotificationType.payment
                        ? AppIcons.wallet
                        : AppIcons.calender,
                color: AppColors.white,
                height: 25.sp,
              )),
          SizedBox(
            width: 12.sp,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                notification.title ?? "",
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 2.sp,
              ),
              Text(
                notification.content ?? "",
                style: TextStyle(fontSize: 12.sp, color: AppColors.grey93),
              ),
            ],
          )
        ],
      ),
    );
  }
}
