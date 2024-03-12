import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:waiver_driver/app_bar/app_bar.dart';
import 'package:waiver_driver/app_buttons/app_buttons.dart';
import 'package:waiver_driver/app_colors/app_colors.dart';
import 'package:waiver_driver/app_routes/app_routes.dart';
import 'package:waiver_driver/assets/icons.dart';
import 'package:waiver_driver/circle_with_gradient/circle_with_gradient.dart';
import 'package:waiver_driver/fleet_home_page/fleet_home_page_controller.dart';
import 'package:waiver_driver/fleet_home_page/fleet_home_page_model.dart';

import '../left_menu_fleet/left_menu_fleet_view.dart';

class FleetHomePageScreen extends StatelessWidget {
  const FleetHomePageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.transparent,
          elevation: 0,
          isExtended: true,
          onPressed: () => Get.toNamed(AppRoutes.addVehicle),
          label: BlueButton(
            width: Get.width - 60.sp,
            icon: CircleWithIcon(
                color: AppColors.white,
                height: 25.sp,
                child: Icon(
                  Icons.add,
                  color: AppColors.blue,
                )),
            text: "Add New Vehicle",
          ),
        ),
        appBar: appBar(title: "", showMenuButton: true),
        drawer: LeftMenuFleet(),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 25.sp),
          children: FleetHomePageController.to.fleet
              .map((fleet) => FleetRegistrationListingItem(
                    fleet: fleet,
                  ))
              .toList(),
        ));
  }
}

class FleetRegistrationListingItem extends StatelessWidget {
  FleetListingModel fleet;
  FleetRegistrationListingItem({required this.fleet});
  @override
  Widget build(BuildContext context) {
    switch (fleet.status.value) {
      case CarRegistrationStatus.pending:
        return FleetRegistrationListingItemPending(fleet: fleet);
      case CarRegistrationStatus.active:
        return FleetRegistrationListingItemActive(
          fleet: fleet,
        );
      case CarRegistrationStatus.blocked:
        return FleetRegistrationListingItemBlocked(
          fleet: fleet,
        );
    }
  }
}

class FleetRegistrationListingItemPending extends StatelessWidget {
  FleetListingModel fleet;
  FleetRegistrationListingItemPending({required this.fleet});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.sp),
      margin: EdgeInsets.only(bottom: 20.sp),
      decoration: BoxDecoration(
          color: AppColors.grey249, borderRadius: BorderRadius.circular(8.sp)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    fleet.vehicleName,
                    style:
                        TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    fleet.registrationNumber,
                    style: TextStyle(fontSize: 11.sp, color: AppColors.grey93),
                  )
                ],
              ),
              FleetRegistrationStatusButton(
                text: "Pending",
                color: AppColors.golden,
              )
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 15.sp),
            height: 1.5.sp,
            width: 280.sp,
            color: AppColors.grey155,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => Get.toNamed(AppRoutes.addProofVehicle),
                child: FleetRegistrationStatusButton(
                  text: "Add Vehicle details",
                  color: AppColors.blue,
                ),
              ),
              SvgPicture.asset(
                AppIcons.arrowRight,
                height: 15.sp,
              )
            ],
          )
        ],
      ),
    );
  }
}

class FleetRegistrationListingItemActive extends StatelessWidget {
  FleetListingModel fleet;
  FleetRegistrationListingItemActive({required this.fleet});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.sp),
      margin: EdgeInsets.only(bottom: 20.sp),
      decoration: BoxDecoration(
          color: AppColors.grey249, borderRadius: BorderRadius.circular(8.sp)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    fleet.vehicleName,
                    style:
                        TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    fleet.registrationNumber,
                    style: TextStyle(fontSize: 11.sp, color: AppColors.grey93),
                  )
                ],
              ),
              FleetRegistrationStatusButton(
                text: "Active",
                color: AppColors.green40,
              )
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 15.sp),
            height: 1.5.sp,
            width: 280.sp,
            color: AppColors.grey155,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: fleet.driverName == ""
                ? [
                    FleetRegistrationStatusButton(
                      text: "Add Driver",
                      color: AppColors.blue,
                    )
                  ]
                : [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          fleet.driverName,
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "#${fleet.driverID}",
                          style: TextStyle(
                              fontSize: 11.sp, color: AppColors.grey93),
                        )
                      ],
                    ),
                    SvgPicture.asset(
                      AppIcons.arrowRight,
                      height: 15.sp,
                    )
                  ],
          )
        ],
      ),
    );
  }
}

class FleetRegistrationListingItemBlocked extends StatelessWidget {
  FleetListingModel fleet;
  FleetRegistrationListingItemBlocked({required this.fleet});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.sp),
      margin: EdgeInsets.only(bottom: 20.sp),
      decoration: BoxDecoration(
          color: AppColors.grey249, borderRadius: BorderRadius.circular(8.sp)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    fleet.vehicleName,
                    style:
                        TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    fleet.registrationNumber,
                    style: TextStyle(fontSize: 11.sp, color: AppColors.grey93),
                  )
                ],
              ),
              FleetRegistrationStatusButton(
                text: "Blocked",
                color: AppColors.red,
              )
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 15.sp),
            height: 1.5.sp,
            width: 280.sp,
            color: AppColors.grey155,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: fleet.driverName == ""
                ? [
                    FleetRegistrationStatusButton(
                      text: "Add Driver",
                      color: AppColors.blue,
                    )
                  ]
                : [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          fleet.driverName,
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "#${fleet.driverID}",
                          style: TextStyle(
                              fontSize: 11.sp, color: AppColors.grey93),
                        )
                      ],
                    ),
                    SvgPicture.asset(
                      AppIcons.arrowRight,
                      height: 15.sp,
                    )
                  ],
          )
        ],
      ),
    );
  }
}

class FleetRegistrationStatusButton extends StatelessWidget {
  String text;
  Color color;
  FleetRegistrationStatusButton({required this.text, required this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 5.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.sp),
        color: color,
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 12.sp, color: AppColors.white),
      ),
    );
  }
}
