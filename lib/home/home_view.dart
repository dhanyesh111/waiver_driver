import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:waiver_driver/app_colors/app_colors.dart';
import 'package:waiver_driver/assets/icons.dart';
import 'package:waiver_driver/circle_with_gradient/circle_with_gradient.dart';
import 'package:waiver_driver/home/home_controller.dart';
import 'package:waiver_driver/left_menu/left_menu_view.dart';

import 'home_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const LeftMenu(),
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
                    Marker(
                        markerId: const MarkerId("2"),
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
              Positioned(bottom: 0, child: DashBoardData())
            ],
          ),
        ));
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
