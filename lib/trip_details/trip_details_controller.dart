import 'package:get/get.dart';

class TripDetailsControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TripDetailsController());
  }
}

class TripDetailsController extends GetxController {
  static TripDetailsController get to => Get.find();

  String tripStart = " CMBT Passenger Way, KoyamPassenger Way, Koyam be";
  String tripEnd = " Gandhi Irwin Rd Gandhi Irwin Rd, Egmore, Ch";
  double earnings = 5000;
  String paymentMode = "cash";
  DateTime rideTime = DateTime.now();
  String service = "Chauffeur (Driver)";
  String distance = "12 km";
  String passengerName = "Muna";
  int rating = 4;
  String tipFare = "5600";
  String promo = "500";
  String tax = "-₹100";
  String payment = " ₹5000";
}
