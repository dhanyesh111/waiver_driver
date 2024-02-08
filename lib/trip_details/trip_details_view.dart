import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:waiver_driver/app_bar/app_bar.dart';
import 'package:waiver_driver/app_buttons/app_buttons.dart';
import 'package:waiver_driver/app_routes/app_routes.dart';
import 'package:waiver_driver/rating/rating_view.dart';
import 'package:waiver_driver/trip_details/trip_details_controller.dart';

import '../app_colors/app_colors.dart';
import '../assets/icons.dart';

class TripDetailsView extends StatelessWidget {
  const TripDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: "Trip Details", actions: [
        GestureDetector(
            onTap: () => Get.toNamed(AppRoutes.help),
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15.sp),
                child: Text("Help")))
      ]),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 15.sp),
        children: [
          SizedBox(
            height: 25.sp,
          ),
          MyRideExpansionTileTripDetails(),
          SizedBox(
            height: 25.sp,
          ),
          Text(
            "₹${TripDetailsController.to.earnings}",
            style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.black),
            textAlign: TextAlign.center,
          ),
          Text(
              "Payment made successfully by cash ${TripDetailsController.to.paymentMode}",
              style: TextStyle(fontSize: 14.sp, color: AppColors.grey93),
              textAlign: TextAlign.center),
          SizedBox(
            height: 15.sp,
          ),
          Divider(
            height: 1,
            color: AppColors.grey155,
          ),
          SizedBox(
            height: 15.sp,
          ),
          TripDetailsItemView(
            text: "Date & Time",
            value: DateFormat("dd MMM yyyy 'at' hh : mm a")
                .format(TripDetailsController.to.rideTime),
          ),
          SizedBox(
            height: 15.sp,
          ),
          TripDetailsItemView(
              text: "Service", value: TripDetailsController.to.service),
          SizedBox(
            height: 15.sp,
          ),
          TripDetailsItemView(
            text: "Distance",
            value: TripDetailsController.to.distance,
          ),
          SizedBox(
            height: 15.sp,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("You rated ${TripDetailsController.to.passengerName} "),
              StarBuilder(count: TripDetailsController.to.rating)
            ],
          ),
          SizedBox(
            height: 15.sp,
          ),
          Container(
            width: Get.width,
            color: AppColors.grey249,
            padding: EdgeInsets.all(15.sp),
            child: Text(
              "Receipt",
              style: TextStyle(
                  fontWeight: FontWeight.w500, color: AppColors.black),
            ),
          ),
          SizedBox(
            height: 15.sp,
          ),
          ReceiptItemView(
            text: "Trip Fare",
            value: "₹ ${TripDetailsController.to.tipFare}",
          ),
          SizedBox(
            height: 15.sp,
          ),
          ReceiptItemView(
            text: "Promo",
            value: "-₹ ${TripDetailsController.to.promo}",
          ),
          SizedBox(
            height: 15.sp,
          ),
          ReceiptItemView(
            text: "Tax",
            value: "₹ ${TripDetailsController.to.tax}",
          ),
          SizedBox(
            height: 15.sp,
          ),
          Divider(
            height: 1,
            color: AppColors.grey155,
          ),
          SizedBox(
            height: 15.sp,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Payment",
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 14.sp,
                ),
              ),
              Text(
                TripDetailsController.to.payment,
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15.sp,
          ),
          BlueButton(
            text: "Done",
            onTap: () => Get.back(),
          ),
          SizedBox(
            height: 15.sp,
          ),
        ],
      ),
    );
  }
}

class TripDetailsItemView extends StatelessWidget {
  String text;
  String value;
  TripDetailsItemView({required this.text, required this.value});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(
            color: AppColors.black,
            fontSize: 14.sp,
          ),
        ),
        Text(
          text,
          style: TextStyle(
            color: AppColors.black,
            fontSize: 14.sp,
          ),
        ),
      ],
    );
  }
}

class ReceiptItemView extends StatelessWidget {
  String text;
  String value;
  ReceiptItemView({required this.text, required this.value});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(
            color: AppColors.black,
            fontSize: 14.sp,
          ),
        ),
        Text(
          text,
          style: TextStyle(
            color: AppColors.black,
            fontSize: 14.sp,
          ),
        ),
      ],
    );
  }
}

class MyRideExpansionTileTripDetails extends StatelessWidget {
  MyRideExpansionTileTripDetails();
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
                  TripDetailsController.to.tripStart,
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
                  TripDetailsController.to.tripEnd,
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
