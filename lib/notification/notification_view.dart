import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waiver_driver/app_bar/app_bar.dart';
import 'package:waiver_driver/app_colors/app_colors.dart';
import 'package:waiver_driver/assets/icons.dart';
import 'package:waiver_driver/circle_with_gradient/circle_with_gradient.dart';
import 'package:waiver_driver/notification/notification_controller.dart';
import 'package:waiver_driver/notification/notification_model.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(title: "Notification"),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 15.sp),
          children: [
            SizedBox(
              height: 20.sp,
            ),
            Column(
              children: NotificationController.to.notification
                  .map((notification) =>
                      NotificationListingItem(notification: notification))
                  .toList(),
            )
          ],
        ));
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
                notification.type == "offer"
                    ? AppIcons.offers
                    : notification.type == "payment"
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
                notification.header,
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 2.sp,
              ),
              Text(
                notification.text,
                style: TextStyle(fontSize: 12.sp, color: AppColors.grey93),
              ),
            ],
          )
        ],
      ),
    );
  }
}
