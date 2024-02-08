import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:waiver_driver/app_bar/app_bar.dart';
import 'package:waiver_driver/app_colors/app_colors.dart';
import 'package:waiver_driver/app_routes/app_routes.dart';
import 'package:waiver_driver/assets/icons.dart';
import 'package:waiver_driver/circle_with_gradient/circle_with_gradient.dart';
import 'package:waiver_driver/my_rides/my_rides_controller.dart';
import 'package:waiver_driver/my_rides/my_rides_model.dart';

class MyRidesScreen extends StatelessWidget {
  const MyRidesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(title: "My Rides"),
        body: ListView(
          padding: EdgeInsets.symmetric(vertical: 30.sp, horizontal: 15.sp),
          children: MyRidesController.to.myRides
              .map((ride) => MyRidesListingItem(ride: ride))
              .toList(),
        ));
  }
}

class MyRidesListingItem extends StatelessWidget {
  MyRidesModel ride;
  MyRidesListingItem({required this.ride});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(AppRoutes.tripDetails),
      child: Container(
        margin: EdgeInsets.only(bottom: 15.sp),
        decoration: BoxDecoration(
            color: AppColors.grey249,
            borderRadius: BorderRadius.circular(8.sp)),
        padding: EdgeInsets.all(16.sp),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyRideTopItem(
                  icon: CircleWithIcon(
                    height: 30.sp,
                    color: AppColors.black,
                    child: Image.asset(
                      AppIcons.location,
                      color: AppColors.white,
                      height: 15.sp,
                    ),
                  ),
                  text: ride.km,
                ),
                MyRideTopItem(
                  icon: CircleWithIcon(
                    height: 30.sp,
                    color: AppColors.black,
                    child: Image.asset(
                      AppIcons.clock,
                      color: AppColors.white,
                      height: 15.sp,
                    ),
                  ),
                  text: ride.time,
                ),
                MyRideTopItem(
                  icon: CircleWithIcon(
                    height: 30.sp,
                    color: AppColors.black,
                    child: Image.asset(
                      AppIcons.wallet,
                      color: AppColors.white,
                      height: 15.sp,
                    ),
                  ),
                  text: ride.earnings,
                ),
              ],
            ),
            SizedBox(
              height: 10.sp,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Date & Time",
                  style: TextStyle(fontSize: 14.sp),
                ),
                Text(
                  DateFormat("dd MMM yyyy 'at' hh:mm a").format(ride.rideStart),
                  style: TextStyle(fontSize: 14.sp),
                )
              ],
            ),
            SizedBox(
              height: 18.sp,
            ),
            MyRideExpansionTile(
              stops: ride.stops,
            )
          ],
        ),
      ),
    );
  }
}

class MyRideExpansionTile extends StatelessWidget {
  List<String> stops;
  MyRideExpansionTile({required this.stops});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.sp),
          border: Border.all(color: AppColors.grey155, width: 1.5.sp)),
      padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 15.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            AppIcons.startAndStop,
            height: 70.sp,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 230.sp,
                child: Text(
                  stops.first,
                  style: TextStyle(fontSize: 14.sp),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 12.sp, bottom: 5.sp),
                height: 1.5.sp,
                width: 250.sp,
                color: AppColors.grey155.withOpacity(0.5),
              ),
              SizedBox(
                width: 230.sp,
                child: Text(
                  stops.last,
                  style: TextStyle(fontSize: 14.sp),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MyRideTopItem extends StatelessWidget {
  Widget icon;
  String text;
  MyRideTopItem({
    required this.icon,
    required this.text,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        SizedBox(
          width: 5.sp,
        ),
        Text(
          text,
          style: const TextStyle(fontSize: 14),
        )
      ],
    );
  }
}
