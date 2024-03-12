import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:waiver_driver/app_buttons/app_buttons.dart';
import 'package:waiver_driver/app_colors/app_colors.dart';
import 'package:waiver_driver/assets/icons.dart';
import 'package:waiver_driver/circle_with_gradient/circle_with_gradient.dart';
import 'package:waiver_driver/enums/enums.dart';
import 'package:waiver_driver/home/home_controller.dart';

import '../left_menu_driver/left_menu_driver_view.dart';
import 'home_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const LeftMenuDriver(),
        body: SizedBox(
          height: Get.height,
          width: Get.width,
          child: Stack(
            children: [
              GetX<HomeController>(builder: (controller) {
                return GoogleMap(
                  mapType: MapType.normal,
                  markers: {
                    Marker(
                        markerId: const MarkerId("1"),
                        position: LatLng(
                          controller.currentPosition.value?.latitude ?? 0,
                          controller.currentPosition.value?.longitude ?? 0,
                        )),
                    const Marker(
                        markerId: MarkerId("2"),
                        position: LatLng(11.254644, 75.837033))
                  },
                  initialCameraPosition: CameraPosition(
                    target: LatLng(
                      controller.currentPosition.value?.latitude ?? 0,
                      controller.currentPosition.value?.longitude ?? 0,
                    ),
                    zoom: 15,
                  ),
                  onMapCreated:
                      (GoogleMapController googleMapController) async {
                    controller.googleMapController = googleMapController;
                    await controller.onMapCreate();
                  },
                  polylines: controller.polyline.value != null
                      ? {controller.polyline.value!}
                      : {},
                );
              }),
              Positioned(
                top: MediaQuery.of(context).padding.top + 20.sp,
                child: const HomePageAppBar(),
              ),
              const Positioned(bottom: 0, child: DashBoardData())
            ],
          ),
        ));
  }
}

class IncomingOrderBottomSheet extends StatelessWidget {
  const IncomingOrderBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.sp),
      width: Get.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.sp), color: AppColors.white),
      child: ListView(
        shrinkWrap: true,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 20,
              ),
              Text(
                "₹8000",
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
              ),
              GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(Icons.close)),
            ],
          ),
          SizedBox(
            height: 15.sp,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextInsideBox(text: "34 min"),
              TextInsideBox(text: "5.7 km"),
              TextInsideBox(
                text: "4.9",
                icon: Image.asset(
                  AppIcons.star,
                  color: AppColors.black,
                  height: 16.sp,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15.sp,
          ),
          NewTripDetails(),
          SizedBox(
            height: 15.sp,
          ),
          GestureDetector(
              onTap: () async {
                HomeController.to.timer?.cancel();
                HomeController.to.driverState.value = DriverState.goingToPickUp;
                Get.back();
                Get.bottomSheet(BottomSheetWhileDriving(),
                    isScrollControlled: true);
                Future.delayed(Duration(seconds: 5), () async {
                  HomeController.to.driverState.value =
                      DriverState.arrivedAtPickUp;
                });
              },
              child: AcceptButton())
        ],
      ),
    );
  }
}

class BottomSheetWhileDriving extends StatelessWidget {
  const BottomSheetWhileDriving({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.sp),
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(8.sp)),
      child: ListView(
        shrinkWrap: true,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [CloseButtonForBottomSheet()],
          ),
          Text(
            "4 min 1.5km",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 10.sp,
          ),
          Text(
            "Picking up muhammed munas",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14.sp, color: AppColors.grey93),
          ),
          SizedBox(
            height: 15.sp,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.sp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BottomSheetWhileDrivingItem(
                  icon: CircleWithIcon(
                    height: 35.sp,
                    color: AppColors.blue,
                    child: Image.asset(
                      AppIcons.phone,
                      color: AppColors.white,
                      height: 20.sp,
                    ),
                  ),
                  text: 'Phone Call',
                ),
                BottomSheetWhileDrivingItem(
                  icon: CircleWithIcon(
                    height: 35.sp,
                    color: AppColors.blue,
                    child: Image.asset(
                      AppIcons.message,
                      color: AppColors.white,
                      height: 20.sp,
                    ),
                  ),
                  text: 'Message',
                ),
                BottomSheetWhileDrivingItem(
                  icon: CircleWithIcon(
                    height: 35.sp,
                    color: AppColors.blue,
                    child: Image.asset(
                      AppIcons.navigation,
                      color: AppColors.white,
                      height: 20.sp,
                    ),
                  ),
                  text: 'Navigation',
                ),
              ],
            ),
          ),
          GetX<HomeController>(builder: (controller) {
            switch (controller.driverState.value) {
              case DriverState.idle:
                return const SizedBox();

              case DriverState.goingToPickUp:
                return const SizedBox();

              case DriverState.arrivedAtPickUp:
                return const SizedBox();

              case DriverState.goingToDestination:
                return const SizedBox();
              case DriverState.pauseTrip:
                return const SizedBox();

              case DriverState.reachedDestination:
                return NewTripDetails();
            }
          }),
          GetX<HomeController>(builder: (controller) {
            switch (controller.driverState.value) {
              case DriverState.idle:
                return const SizedBox();

              case DriverState.goingToPickUp:
                return const SizedBox();

              case DriverState.arrivedAtPickUp:
                return Column(
                  children: [
                    SizedBox(
                      height: 25.sp,
                    ),
                    BlueButton(
                      text: "Arrived",
                      onTap: () => Get.bottomSheet(EnterOtpBottomSheet()),
                    ),
                  ],
                );

              case DriverState.goingToDestination:
                return Column(
                  children: [
                    SizedBox(
                      height: 25.sp,
                    ),
                    BlueButton(
                      text: "Pause trip",
                      onTap: () => HomeController.to.driverState.value =
                          DriverState.pauseTrip,
                    ),
                  ],
                );
              case DriverState.pauseTrip:
                return Column(
                  children: [
                    SizedBox(
                      height: 25.sp,
                    ),
                    BlueButton(
                      text: "Resume trip",
                      onTap: () => HomeController.to.driverState.value =
                          DriverState.goingToDestination,
                    ),
                  ],
                );

              case DriverState.reachedDestination:
                return Column(
                  children: [
                    SizedBox(
                      height: 25.sp,
                    ),
                    BlueButton(
                      text: "Complete",
                      onTap: () {
                        HomeController.to.driverState.value = DriverState.idle;
                        Get.back();
                      },
                    ),
                  ],
                );
            }
          }),
          SizedBox(
            height: 10.sp,
          ),
        ],
      ),
    );
  }
}

class EnterOtpBottomSheet extends StatelessWidget {
  const EnterOtpBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.sp),
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(8.sp)),
      child: ListView(
        shrinkWrap: true,
        children: [
          Text(
            "Enter OTP PIN",
            style: TextStyle(fontSize: 20.sp),
            textAlign: TextAlign.center,
          ),
          Text(
            " Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy",
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.grey93,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 15.sp,
          ),
          Form(
            key: HomeController.to.otpValidationFormKey,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 55.sp),
              height: 45.sp,
              child: PinFieldAutoFill(
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: BoxLooseDecoration(
                    textStyle:
                        TextStyle(fontSize: 16.sp, color: AppColors.black),
                    radius: Radius.circular(8.sp),
                    strokeColorBuilder: PinListenColorBuilder(
                        AppColors.black, AppColors.grey155),
                    gapSpace: 10.sp),
                currentCode: HomeController.to.code,
                onCodeSubmitted: (code) {
                  HomeController.to.code = code;
                },
                onCodeChanged: (code) {
                  HomeController.to.code = code ?? "";
                  HomeController.to.showIsOtpValid.value = false;
                },
                codeLength: 4,
              ),
            ),
          ),
          GetX<HomeController>(builder: (controller) {
            return controller.showIsOtpValid.value
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10.sp,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 55.sp),
                        child: Text(
                          "Please enter full Otp",
                          style:
                              TextStyle(fontSize: 14.sp, color: AppColors.red),
                        ),
                      ),
                    ],
                  )
                : SizedBox();
          }),
          SizedBox(
            height: 15.sp,
          ),
          BlueButton(
            text: "Confirm",
            onTap: () {
              HomeController.to.validateOtp();
              HomeController.to.driverState.value =
                  DriverState.goingToDestination;

              Future.delayed(Duration(seconds: 15), () async {
                HomeController.to.driverState.value =
                    DriverState.reachedDestination;
              });
            },
          )
        ],
      ),
    );
  }
}

class CancelTripBottomSheet extends StatelessWidget {
  const CancelTripBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.sp),
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(8.sp)),
      child: ListView(
        shrinkWrap: true,
        children: [
          Text(
            "Cancel Trip ? ",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 15.sp,
          ),
          RedButton(
            text: "Cancel",
            onTap: () => Get.bottomSheet(const CancelReasonsBottomSheet(),
                isScrollControlled: true),
          ),
          SizedBox(
            height: 15.sp,
          ),
          RedBorderedButton(text: "No", onTap: () => Get.back()),
          SizedBox(
            height: 15.sp,
          ),
        ],
      ),
    );
  }
}

class CancelReasonsBottomSheet extends StatelessWidget {
  const CancelReasonsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 10.sp),
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(8.sp)),
      child: ListView(
        shrinkWrap: true,
        children: [
          Text(
            "Cancel Trip ? ",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
          ),
          Column(
            children: HomeController.to.cancelReasons
                .map((reason) => CancelReasonItem(reason: reason))
                .toList(),
          ),
          SizedBox(
            height: 15.sp,
          ),
          BlueButton(
            text: "Done",
            onTap: () => Get.back(),
          )
        ],
      ),
    );
  }
}

class CancelReasonItem extends StatelessWidget {
  String reason;
  CancelReasonItem({required this.reason});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (HomeController.to.selectedCancelReason.value == reason) {
          HomeController.to.selectedCancelReason.value = "";
        } else {
          HomeController.to.selectedCancelReason.value = reason;
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.sp),
        child: Row(
          children: [
            GetX<HomeController>(builder: (controller) {
              return CircleWithIcon(
                  height: 25.sp,
                  enableBorder: controller.selectedCancelReason.value != reason,
                  color: controller.selectedCancelReason.value == reason
                      ? AppColors.green33
                      : AppColors.white,
                  child: Icon(
                    Icons.check,
                    color: AppColors.white,
                    size: 20.sp,
                  ));
            }),
            SizedBox(
              width: 15.sp,
            ),
            Text(
              reason,
              style: TextStyle(
                fontSize: 16.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomSheetWhileDrivingItem extends StatelessWidget {
  Widget icon;
  String text;
  BottomSheetWhileDrivingItem({required this.icon, required this.text});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        icon,
        SizedBox(
          height: 5.sp,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 14.sp,
          ),
        )
      ],
    );
  }
}

class AcceptButton extends StatelessWidget {
  const AcceptButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.sp),
      height: 50.sp,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.sp),
        color: AppColors.blue,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 30.sp,
          ),
          Text(
            "Accept",
            style: TextStyle(fontSize: 16.sp, color: AppColors.white),
          ),
          CircleWithIcon(
              height: 30.sp,
              child: GetX<HomeController>(builder: (controller) {
                return Text(
                  controller.time.value.toString(),
                  style: TextStyle(color: AppColors.white, fontSize: 16.sp),
                );
              }),
              color: AppColors.white.withOpacity(.2))
        ],
      ),
    );
  }
}

class NewTripDetails extends StatelessWidget {
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
            height: 100.sp,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 230.sp,
                child: Text(
                  HomeController.to.tripStart,
                  maxLines: 2,
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
                  HomeController.to.tripEnd,
                  maxLines: 2,
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

class TextInsideBox extends StatelessWidget {
  String text;
  Widget? icon;
  TextInsideBox({required this.text, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.sp,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 12.sp),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.grey155),
          borderRadius: BorderRadius.circular(8.sp)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              padding: EdgeInsets.symmetric(horizontal: 5.sp),
              child: icon ?? SizedBox()),
          Text(
            text,
            style: TextStyle(
              fontSize: 14.sp,
            ),
          ),
        ],
      ),
    );
  }
}

class DashBoardData extends StatelessWidget {
  const DashBoardData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ChangeOnlineStatusButton(),
        SizedBox(
          height: 15.sp,
        ),
        Container(
          width: Get.width,
          padding: EdgeInsets.symmetric(vertical: 16.sp),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.sp),
              topRight: Radius.circular(10.sp),
            ),
          ),
          child: Column(
            children: [
              GetX<HomeController>(builder: (controller) {
                return Text(
                  controller.isOnline.value
                      ? "You’re online"
                      : "You’re offline",
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                );
              }),
              SizedBox(
                height: 15.sp,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DashBoardItem(
                      item: HomeController.to.acceptance,
                    ),
                    DashBoardItem(
                      item: HomeController.to.rating,
                    ),
                    DashBoardItem(
                      item: HomeController.to.cancellation,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ChangeOnlineStatusButton extends StatelessWidget {
  const ChangeOnlineStatusButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        HomeController.to.isOnline.value = !HomeController.to.isOnline.value;
      },
      child: GetX<HomeController>(builder: (controller) {
        return Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color:
                  controller.isOnline.value ? AppColors.white : AppColors.blue),
          child: Container(
            padding: EdgeInsets.all(15.sp),
            margin: EdgeInsets.all(5.sp),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    color: controller.isOnline.value
                        ? AppColors.red
                        : AppColors.white),
                color: Colors.transparent),
            child: controller.isOnlineButtonLoading.value
                ? SizedBox(
                    height: 20.sp,
                    width: 20.sp,
                    child: CircularProgressIndicator(
                      color: controller.isOnline.value
                          ? AppColors.red
                          : AppColors.white,
                    ),
                  )
                : Text(
                    controller.isOnline.value ? "Stop" : "GO",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18.sp,
                        color: controller.isOnline.value
                            ? AppColors.red
                            : AppColors.white),
                  ),
          ),
        );
      }),
    );
  }
}

class DashBoardItem extends StatelessWidget {
  DashBoardItemModel item;
  DashBoardItem({
    required this.item,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * .25,
      padding: EdgeInsets.symmetric(vertical: 16.sp),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.sp),
          border: Border.all(width: 1.5.sp, color: AppColors.grey155)),
      child: Column(
        children: [
          CircleWithIcon(
              height: 30.sp, color: AppColors.blue, child: item.icon),
          SizedBox(
            height: 10.sp,
          ),
          Text(
            item.value,
            style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.black),
          ),
          Text(
            item.text,
            style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.grey93),
          )
        ],
      ),
    );
  }
}

class HomePageAppBar extends StatelessWidget {
  const HomePageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      padding: EdgeInsets.symmetric(horizontal: 20.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Scaffold.of(context).openDrawer(),
            child: Container(
                padding: EdgeInsets.all(5.sp),
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(12.sp),
                    boxShadow: [
                      BoxShadow(
                          color: AppColors.grey155.withOpacity(.80),
                          offset: const Offset(0, 0),
                          blurRadius: 15)
                    ]),
                child: SvgPicture.asset(
                  AppIcons.menu,
                  height: 30.sp,
                )),
          ),
          Container(
            decoration: BoxDecoration(
                color: AppColors.blue,
                borderRadius: BorderRadius.circular(50.sp)),
            padding: EdgeInsets.symmetric(vertical: 8.sp, horizontal: 30.sp),
            child: Row(
              children: [
                Image.asset(
                  AppIcons.wallet,
                  height: 18.sp,
                ),
                Text(
                  "₹ ${HomeController.to.walletBalance.value}",
                  style: TextStyle(
                      fontSize: 18.sp,
                      color: AppColors.white,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
          SizedBox(
            width: 30.sp,
          )
        ],
      ),
    );
  }
}

class CloseButtonForBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GetX<HomeController>(builder: (controller) {
        switch (HomeController.to.driverState.value) {
          case DriverState.idle:
            return SizedBox();
          case DriverState.goingToPickUp:
            return GestureDetector(
                onTap: () {
                  Get.bottomSheet(CancelTripBottomSheet());
                },
                child: Icon(Icons.close));
          case DriverState.arrivedAtPickUp:
            return GestureDetector(
                onTap: () {
                  Get.bottomSheet(CancelTripBottomSheet());
                },
                child: Icon(Icons.close));
          case DriverState.goingToDestination:
            return SizedBox();
          case DriverState.pauseTrip:
            return SizedBox();
          case DriverState.reachedDestination:
            return GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Icon(Icons.close));
        }
      }),
    );
  }
}
