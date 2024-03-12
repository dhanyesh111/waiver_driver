import 'package:get/get.dart';

import 'fleet_home_page_model.dart';

class FleetHomePageControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FleetHomePageController());
  }
}

class FleetHomePageController extends GetxController {
  static FleetHomePageController get to => Get.find();
  List<FleetListingModel> fleet = <FleetListingModel>[
    FleetListingModel(
        vehicleName: 'Fortuner',
        registrationNumber: 'kl 11 OO 1111',
        driverName: '',
        driverID: '',
        status: CarRegistrationStatus.pending.obs),
    FleetListingModel(
        vehicleName: 'Fortuner',
        registrationNumber: 'kl 11 OO 1111',
        driverName: '',
        driverID: '',
        status: CarRegistrationStatus.active.obs),
    FleetListingModel(
        vehicleName: 'Fortuner',
        registrationNumber: 'kl 11 OO 1111',
        driverName: 'John',
        driverID: '123456',
        status: CarRegistrationStatus.active.obs),
    FleetListingModel(
        vehicleName: 'Fortuner',
        registrationNumber: 'kl 11 OO 1111',
        driverName: 'John',
        driverID: '123456',
        status: CarRegistrationStatus.blocked.obs),
  ];
}
