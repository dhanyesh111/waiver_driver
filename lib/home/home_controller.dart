import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:waiver_driver/app_colors/app_colors.dart';
import 'package:waiver_driver/enums/enums.dart';

import 'home_model.dart';

class HomeControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}

class HomeController extends GetxController {
  static HomeController get to => Get.find();
  Rx<Position?> currentPosition = Rx<Position?>(null);
  GoogleMapController? googleMapController;
  RxInt walletBalance = 2000.obs;
  @override
  void onInit() async {
    super.onInit();
    print(await FirebaseMessaging.instance.getToken());
    await getLocation();
  }

  Rx<DriverState> driverState = DriverState.idle.obs;
  validateOtp() {
    showIsOtpValid.value = code.length != 6;
    Get.back();
  }

  String code = "";
  RxBool showIsOtpValid = false.obs;
  GlobalKey<FormState> otpValidationFormKey = GlobalKey();
  RxString selectedCancelReason = "".obs;
  List<String> cancelReasons = [
    "Reason1",
    "Reason2",
    "Reason3",
    "Reason4",
    "Reason5",
    "Reason6",
    "Reason7",
    "Reason8",
    "Reason9",
    "Reason10",
    "Reason11",
    "Reason12",
  ];
  String tripStart =
      " CMBT Passenger Way, KoyamPassenger Way, Koyam be CMBT Passenger Way, KoyamPassenger Way, Koy";
  String tripEnd =
      " Gandhi Irwin Rd Gandhi Irwin Rd, Egmore, ChCMBT Passenger Way, KoyamPassenger Way, Koy ";

  RxInt time = 0.obs;
  Timer? timer;
  turnOnTimer() {
    const oneSec = Duration(seconds: 1);
    time.value = 15;
    timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (time.value == 0) {
          timer.cancel();
          if (Get.isBottomSheetOpen ?? false) {
            Get.back();
            Get.defaultDialog(
                content: const Text(
                    "The order #1234 has been timed out and was passed to another driver"));
          }
        } else {
          time = time - 1;
        }
      },
    );
  }

  RxBool isOnline = true.obs;
  RxBool isOnlineButtonLoading = false.obs;
  DashBoardItemModel acceptance = DashBoardItemModel(
      icon: Icon(
        Icons.check,
        color: AppColors.white,
      ),
      value: '98 %',
      text: 'Acceptance');
  DashBoardItemModel rating = DashBoardItemModel(
      icon: Icon(Icons.star, color: AppColors.white),
      value: '4.9',
      text: 'Rating');
  DashBoardItemModel cancellation = DashBoardItemModel(
      icon: Icon(Icons.close, color: AppColors.white),
      value: '2.0%',
      text: 'Cancellation');
  Rx<Polyline?> polyline = Rx<Polyline?>(null);
  Polyline addPolyline() {
    return Polyline(
      polylineId: const PolylineId('route'),
      color: AppColors.blue,
      width: 5,
      points: [
        const LatLng(11.254644, 75.837033),
        LatLng(11.2802109, 75.7856938),
      ],
    );
  }

  onMapCreate() async {
    Position position = await Geolocator.getCurrentPosition();
    currentPosition.value = position;
    print(currentPosition.value);
    polyline.value = addPolyline();
    googleMapController!.animateCamera(
      CameraUpdate.newLatLng(LatLng(
        position.latitude,
        position.longitude,
      )),
    );
  }

  Timer? checkLocationChange;
  int checkLocationChangeTimer = 0;
  getLocation() async {
    Geolocator.getPositionStream(
        locationSettings: const LocationSettings(
      accuracy: LocationAccuracy.bestForNavigation,
      distanceFilter: 10,
    )).listen((Position position) {
      print("position.latitude${position.latitude}");
      print("position.longitude${position.longitude}");
      print("currentPosition.latitude${currentPosition.value?.latitude ?? 0}");
      print("currentPosition.latitude${currentPosition.value?.latitude ?? 0}");

      checkLocationChange =
          Timer.periodic(const Duration(seconds: 30), (timer) {
        double distanceInMeters = Geolocator.distanceBetween(
          position.latitude,
          position.longitude,
          currentPosition.value?.latitude ?? 0,
          currentPosition.value?.longitude ?? 0,
        );
        if (distanceInMeters < 1) {
          print(distanceInMeters);
          print("Something....");
          checkLocationChange?.cancel();
        }
      });

      currentPosition.value = position;
      polyline.value = addPolyline();
      print(currentPosition.value?.latitude);
      print(currentPosition.value?.longitude);
    });
  }
}
