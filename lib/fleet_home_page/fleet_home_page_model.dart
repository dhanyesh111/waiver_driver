import 'package:get/get.dart';

class FleetListingModel {
  String vehicleName;
  String registrationNumber;
  String driverName;
  String driverID;
  Rx<CarRegistrationStatus> status;
  FleetListingModel({
    required this.vehicleName,
    required this.registrationNumber,
    required this.driverName,
    required this.driverID,
    required this.status,
  });
}

enum CarRegistrationStatus {
  pending,
  active,
  blocked,
}
