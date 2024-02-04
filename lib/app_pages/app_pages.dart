import 'package:get/get.dart';
import 'package:waiver_driver/Reason_for_cancel/reason_for_cancel_controller.dart';
import 'package:waiver_driver/Reason_for_cancel/reason_for_cancel_view.dart';
import 'package:waiver_driver/aadhar_card/aadhar_card_controller.dart';
import 'package:waiver_driver/aadhar_card/aadhar_card_view.dart';
import 'package:waiver_driver/account_related/account_related_controller.dart';
import 'package:waiver_driver/account_related/account_related_view.dart';
import 'package:waiver_driver/add_driver/add_driver_controller.dart';
import 'package:waiver_driver/add_driver/add_driver_view.dart';
import 'package:waiver_driver/add_vehicle/add_vehicle_controller.dart';
import 'package:waiver_driver/add_vehicle/add_vehicle_view.dart';
import 'package:waiver_driver/bank_account/bank_account_controller.dart';
import 'package:waiver_driver/bank_account/bank_account_view.dart';
import 'package:waiver_driver/chauffeur_proof/chauffeur_proof_controller.dart';
import 'package:waiver_driver/chauffeur_proof/chauffeur_proof_view.dart';
import 'package:waiver_driver/driver_profile/driver_profile_controller.dart';
import 'package:waiver_driver/driver_profile/driver_profile_view.dart';
import 'package:waiver_driver/driver_type_selection/driver_type_selection_controller.dart';
import 'package:waiver_driver/driver_type_selection/driver_type_selection_view.dart';
import 'package:waiver_driver/driving_licence/driving_licence_controller.dart';
import 'package:waiver_driver/driving_licence/driving_licence_view.dart';
import 'package:waiver_driver/earning/earning_controller.dart';
import 'package:waiver_driver/earning/earning_view.dart';
import 'package:waiver_driver/faq/faq_controller.dart';
import 'package:waiver_driver/faq/faq_view.dart';
import 'package:waiver_driver/faq_details/faq_details_controller.dart';
import 'package:waiver_driver/faq_details/faq_details_view.dart';
import 'package:waiver_driver/faq_listing/faq_listing_controller.dart';
import 'package:waiver_driver/faq_listing/faq_listing_view.dart';
import 'package:waiver_driver/fleet_home_page/fleet_home_page_controller.dart';
import 'package:waiver_driver/fleet_home_page/fleet_home_page_view.dart';
import 'package:waiver_driver/fleet_registration/fleet_registration_controller.dart';
import 'package:waiver_driver/fleet_registration/fleet_registration_view.dart';
import 'package:waiver_driver/help/help_controller.dart';
import 'package:waiver_driver/help/help_view.dart';
import 'package:waiver_driver/home/home_controller.dart';
import 'package:waiver_driver/home/home_view.dart';
import 'package:waiver_driver/location_not_enabled/location_not_enabled_controller.dart';
import 'package:waiver_driver/location_not_enabled/location_not_enabled_view.dart';
import 'package:waiver_driver/my_rides/my_rides_controller.dart';
import 'package:waiver_driver/my_rides/my_rides_view.dart';
import 'package:waiver_driver/notification/notification_controller.dart';
import 'package:waiver_driver/notification/notification_view.dart';
import 'package:waiver_driver/otp/otp_controller.dart';
import 'package:waiver_driver/otp/otp_view.dart';
import 'package:waiver_driver/police_clearance_certificate/police_clearance_certificate_controller.dart';
import 'package:waiver_driver/police_clearance_certificate/police_clearance_certificate_view.dart';
import 'package:waiver_driver/preferences/preferences_controller.dart';
import 'package:waiver_driver/preferences/preferences_view.dart';
import 'package:waiver_driver/profile/profile_controller.dart';
import 'package:waiver_driver/profile/profile_view.dart';
import 'package:waiver_driver/profile_photo/profile_photo_controller.dart';
import 'package:waiver_driver/profile_photo/profile_photo_view.dart';
import 'package:waiver_driver/rating/rating_controller.dart';
import 'package:waiver_driver/rating/rating_view.dart';
import 'package:waiver_driver/receipt/receipt_controller.dart';
import 'package:waiver_driver/receipt/receipt_view.dart';
import 'package:waiver_driver/refer_and_earn/refer_and_earn_controller.dart';
import 'package:waiver_driver/refer_and_earn/refer_and_earn_view.dart';
import 'package:waiver_driver/registration/registration_controller.dart';
import 'package:waiver_driver/registration/registration_view.dart';
import 'package:waiver_driver/setting/setting_controller.dart';
import 'package:waiver_driver/setting/setting_view.dart';
import 'package:waiver_driver/sign_in/sign_in_controller.dart';
import 'package:waiver_driver/sign_in/sign_in_view.dart';
import 'package:waiver_driver/splash/splash_controller.dart';
import 'package:waiver_driver/splash/splash_view.dart';
import 'package:waiver_driver/vehicle_details/vehicle_details_controller.dart';
import 'package:waiver_driver/vehicle_details/vehicle_details_view.dart';
import 'package:waiver_driver/vehicle_proof/vehicle_proof_controller.dart';
import 'package:waiver_driver/vehicle_proof/vehicle_proof_view.dart';
import 'package:waiver_driver/waiting_for_authorization/waiting_for_authorization_controller.dart';
import 'package:waiver_driver/waiting_for_authorization/waiting_for_authorization_view.dart';
import 'package:waiver_driver/welcome/welcome_controller.dart';
import 'package:waiver_driver/welcome/welcome_view.dart';

import '../app_routes/app_routes.dart';
import '../login/login_controller.dart';
import '../login/login_view.dart';

class AppPages {
  static List<GetPage> appPages = <GetPage>[
    GetPage(
        name: AppRoutes.splash,
        page: () => const SplashScreen(),
        binding: SplashControllerBinding()),
    GetPage(
        name: AppRoutes.driverTypeSelection,
        page: () => const DriverTypeSelectionScreen(),
        binding: DriverTypeSelectionControllerBinding()),
    GetPage(
        name: AppRoutes.signIn,
        page: () => const SignInScreen(),
        binding: SignInControllerBinding()),
    GetPage(
        name: AppRoutes.login,
        page: () => const LoginScreen(),
        binding: LoginControllerBinding()),
    GetPage(
        name: AppRoutes.otp,
        page: () => const OtpScreen(),
        binding: OtpControllerBinding()),
    GetPage(
        name: AppRoutes.welcome,
        page: () => const WelcomeScreen(),
        binding: WelcomeControllerBinding()),
    GetPage(
        name: AppRoutes.registration,
        page: () => const RegistrationScreen(),
        binding: RegistrationControllerBinding()),
    GetPage(
        name: AppRoutes.fleetRegistration,
        page: () => const FleetRegistrationScreen(),
        binding: FleetRegistrationControllerBinding()),
    GetPage(
        name: AppRoutes.chauffeurProof,
        page: () => const ChauffeurProofScreen(),
        binding: ChauffeurProofControllerBinding()),
    GetPage(
        name: AppRoutes.profilePhoto,
        page: () => const ProfilePhotoScreen(),
        binding: ProfilePhotoControllerBinding()),
    GetPage(
        name: AppRoutes.aadharCard,
        page: () => const AadharCardScreen(),
        binding: AadharCardControllerBinding()),
    GetPage(
        name: AppRoutes.bankAccount,
        page: () => const BankAccountScreen(),
        binding: BankAccountControllerBinding()),
    GetPage(
        name: AppRoutes.policeClearanceCertificate,
        page: () => const PoliceClearanceCertificateScreen(),
        binding: PoliceClearanceCertificateControllerBinding()),
    GetPage(
        name: AppRoutes.drivingLicence,
        page: () => const DrivingLicenceScreen(),
        binding: DrivingLicenceControllerBinding()),
    GetPage(
        name: AppRoutes.waitingForAuthorization,
        page: () => const WaitingForAuthorizationScreen(),
        binding: WaitingForAuthorizationControllerBinding()),
    GetPage(
        name: AppRoutes.locationNotEnabled,
        page: () => const LocationNotEnabledScreen(),
        binding: LocationNotEnabledControllerBinding()),
    GetPage(
        name: AppRoutes.home,
        page: () => const HomeScreen(),
        binding: HomeControllerBinding()),
    GetPage(
        name: AppRoutes.reasonForCancel,
        page: () => const ReasonForCancelScreen(),
        binding: ReasonForCancelControllerBinding()),
    GetPage(
        name: AppRoutes.profile,
        page: () => const ProfileScreen(),
        binding: ProfileControllerBinding()),
    GetPage(
        name: AppRoutes.earning,
        page: () => const EarningScreen(),
        binding: EarningControllerBinding()),
    GetPage(
        name: AppRoutes.rating,
        page: () => const RatingScreen(),
        binding: RatingControllerBinding()),
    GetPage(
        name: AppRoutes.myRides,
        page: () => const MyRidesScreen(),
        binding: MyRidesControllerBinding()),
    GetPage(
        name: AppRoutes.receipt,
        page: () => const ReceiptScreen(),
        binding: ReceiptControllerBinding()),
    GetPage(
        name: AppRoutes.referAndEarn,
        page: () => const ReferAndEarnScreen(),
        binding: ReferAndEarnControllerBinding()),
    GetPage(
        name: AppRoutes.notification,
        page: () => const NotificationScreen(),
        binding: NotificationControllerBinding()),
    GetPage(
        name: AppRoutes.help,
        page: () => const HelpScreen(),
        binding: HelpControllerBinding()),
    GetPage(
        name: AppRoutes.setting,
        page: () => const SettingScreen(),
        binding: SettingControllerBinding()),
    GetPage(
        name: AppRoutes.faq,
        page: () => const FaqScreen(),
        binding: FaqControllerBinding()),
    GetPage(
        name: AppRoutes.faqDetails,
        page: () => const FaqDetailsScreen(),
        binding: FaqDetailsControllerBinding()),
    GetPage(
        name: AppRoutes.faqListing,
        page: () => const FaqListingScreen(),
        binding: FaqListingControllerBinding()),
    GetPage(
        name: AppRoutes.preferences,
        page: () => const PreferencesScreen(),
        binding: PreferencesControllerBinding()),
    GetPage(
        name: AppRoutes.accountRelated,
        page: () => const AccountRelatedScreen(),
        binding: AccountRelatedControllerBinding()),
    GetPage(
        name: AppRoutes.fleetHomePage,
        page: () => const FleetHomePageScreen(),
        binding: FleetHomePageControllerBinding()),
    GetPage(
        name: AppRoutes.addDriver,
        page: () => const AddDriverScreen(),
        binding: AddDriverControllerBinding()),
    GetPage(
        name: AppRoutes.vehicleProof,
        page: () => const VehicleProofScreen(),
        binding: VehicleProofControllerBinding()),
    GetPage(
        name: AppRoutes.vehicleDetails,
        page: () => const VehicleDetailsScreen(),
        binding: VehicleDetailsControllerBinding()),
    GetPage(
        name: AppRoutes.addVehicle,
        page: () => const AddVehicleScreen(),
        binding: AddVehicleControllerBinding()),
    GetPage(
        name: AppRoutes.driverProfile,
        page: () => const DriverProfileScreen(),
        binding: DriverProfileControllerBinding()),
  ];
}
