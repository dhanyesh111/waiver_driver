import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:waiver_driver/app_colors/app_colors.dart';

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

    await getLocation();
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
      value: '2 %',
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

  getLocation() async {
    Geolocator.getPositionStream(
        locationSettings: const LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    )).listen((Position position) {
      currentPosition.value = position;
      polyline.value = addPolyline();
    });
  }
}
