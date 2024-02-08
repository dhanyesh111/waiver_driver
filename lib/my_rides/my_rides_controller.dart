import 'package:get/get.dart';

import 'my_rides_model.dart';

class MyRidesControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyRidesController());
  }
}

class MyRidesController extends GetxController {
  static MyRidesController get to => Get.find();
  List<MyRidesModel> myRides = <MyRidesModel>[
    MyRidesModel(
        km: '7.2',
        time: "24 mins",
        earnings: "5000",
        rideStart: DateTime.now(),
        stops: [
          "Lorem ipsum dolor amet consectetur ",
          "the cursus porttitor ultricies quis mission massa nibh suscipit."
        ]),
    MyRidesModel(
        km: '7.2',
        time: "24 mins",
        earnings: "5000",
        rideStart: DateTime.now(),
        stops: [
          "Lorem ipsum dolor amet consectetur ",
          "the cursus porttitor ultricies quis mission massa nibh suscipit."
        ]),
    MyRidesModel(
        km: '7.2',
        time: "24 mins",
        earnings: "5000",
        rideStart: DateTime.now(),
        stops: [
          "Lorem ipsum dolor amet consectetur ",
          "the cursus porttitor ultricies quis mission massa nibh suscipit."
        ]),
    MyRidesModel(
        km: '7.2',
        time: "24 mins",
        earnings: "5000",
        rideStart: DateTime.now(),
        stops: [
          "Lorem ipsum dolor amet consectetur ",
          "the cursus porttitor ultricies quis mission massa nibh suscipit."
        ]),
    MyRidesModel(
        km: '7.2',
        time: "24 mins",
        earnings: "5000",
        rideStart: DateTime.now(),
        stops: [
          "Lorem ipsum dolor amet consectetur ",
          "the cursus porttitor ultricies quis mission massa nibh suscipit."
        ]),
  ];
}
