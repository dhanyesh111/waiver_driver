import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:waiver_driver/aadhar_card/aadhar_card_model.dart';
import 'package:waiver_driver/api_services/urls.dart';

import '../bank_account/bank_account_model.dart';
import '../chauffeur_proof/chauffeur_proof_model.dart';
import '../constants/get_storage_constants.dart';
import '../earning/earning_model.dart';
import '../faq_topics/faq_topic_model.dart';
import '../help/help_model.dart';
import '../login/login_model.dart';
import '../main.dart';
import '../my_rides/my_rides_model.dart';
import '../notification/notification_model.dart';
import '../otp/otp_model.dart';
import '../preferences/preferences_model.dart';
import '../profile/profile_model.dart';
import '../profile_photo/profile_photo_model.dart';
import '../rating/rating_model.dart';
import '../registration/registration_model.dart';
import '../setting/setting_model.dart';
import '../trip_details/trip_details_model.dart';
import '../view_bank_account/view_bank_model.dart';

class ApiServices {
  static String getToken() {
    print("Bearer ${box.read(BoxConstants.token)}");
    return "Bearer ${box.read(BoxConstants.token)}";
  }

  static Future<SendPhoneOtpResponseModel> sendPhoneOtp(
      {required Map<String, String> body}) async {
    http.Response response = await http.post(
        Uri.https(AppUrls.base, AppUrls.sendPhoneOtp),
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: body);
    log("${Uri.https(AppUrls.base, AppUrls.sendPhoneOtp)}===============>$body");
    log("${Uri.https(AppUrls.base, AppUrls.sendPhoneOtp)}===============>${response.statusCode}");
    log("${Uri.https(AppUrls.base, AppUrls.sendPhoneOtp)}===============>${response.body}");
    if (response.statusCode == 200) {
      return sendPhoneOtpResponseModelFromJson(response.body);
    } else {
      throw Exception(response.body);
    }
  }

  static Future<VerifyOtpResponseModel> phoneAuth(
      {required Map<String, String> body}) async {
    http.Response response = await http.post(
        Uri.https(AppUrls.base, AppUrls.phoneAuth),
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: body);
    log("${Uri.https(AppUrls.base, AppUrls.phoneAuth)}===============>$body");
    log("${Uri.https(AppUrls.base, AppUrls.phoneAuth)}===============>${response.statusCode}");
    log("${Uri.https(AppUrls.base, AppUrls.phoneAuth)}===============>${response.body}");
    if (response.statusCode == 200) {
      return verifyOtpResponseModelFromJson(response.body);
    } else {
      throw Exception(response.body);
    }
  }

  static Future<CreateDriverProfileResponseModel> createProfile(
      {required Map<String, String> body}) async {
    http.Response response = await http.post(
        Uri.https(AppUrls.base, AppUrls.createProfile),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          "Authorization": getToken()
        },
        body: body);
    log("${Uri.https(AppUrls.base, AppUrls.createProfile)}===============>$body");
    log("${Uri.https(AppUrls.base, AppUrls.createProfile)}===============>${response.statusCode}");
    log("${Uri.https(AppUrls.base, AppUrls.createProfile)}===============>${response.body}");
    if (response.statusCode == 200) {
      return createDriverProfileResponseModelFromJson(response.body);
    } else {
      throw Exception(response.body);
    }
  }

  static Future<GetAllStatesResponseModel> getAllStates() async {
    http.Response response = await http.get(
      Uri.https(AppUrls.base, AppUrls.states),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        "Authorization": getToken()
      },
    );
    log("${Uri.https(AppUrls.base, AppUrls.states)}===============>${response.statusCode}");
    log("${Uri.https(AppUrls.base, AppUrls.states)}===============>${response.body}");
    if (response.statusCode == 200) {
      return getAllStatesResponseModelFromJson(response.body);
    } else {
      throw Exception(response.body);
    }
  }

  static Future<GetAllDistrictsResponseModel> getAllDistricts(
      {required Map<String, String> queryParameter}) async {
    http.Response response = await http.get(
      Uri.https(AppUrls.base, AppUrls.districts, queryParameter),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        "Authorization": getToken()
      },
    );
    log("${Uri.https(AppUrls.base, AppUrls.districts)}===============>$queryParameter");
    log("${Uri.https(AppUrls.base, AppUrls.districts)}===============>${response.statusCode}");
    log("${Uri.https(AppUrls.base, AppUrls.districts)}===============>${response.body}");
    if (response.statusCode == 200) {
      return getAllDistrictsResponseModelFromJson(response.body);
    } else {
      throw Exception(response.body);
    }
  }

  static Future<GetAllWorkLocationsResponseModel> getWorkLocation() async {
    http.Response response = await http.get(
      Uri.https(AppUrls.base, AppUrls.workLocations),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        "Authorization": getToken()
      },
    );
    log("${Uri.https(AppUrls.base, AppUrls.workLocations)}===============>${response.statusCode}");
    log("${Uri.https(AppUrls.base, AppUrls.workLocations)}===============>${response.body}");
    if (response.statusCode == 200) {
      return getAllWorkLocationsResponseModelFromJson(response.body);
    } else {
      throw Exception(response.body);
    }
  }

  static Future<GetAllWorkExperienceResponseModel> getWorkExperience() async {
    http.Response response = await http.get(
      Uri.https(AppUrls.base, AppUrls.workExperience),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        "Authorization": getToken()
      },
    );
    log("${Uri.https(AppUrls.base, AppUrls.workExperience)}===============>${response.statusCode}");
    log("${Uri.https(AppUrls.base, AppUrls.workExperience)}===============>${response.body}");
    if (response.statusCode == 200) {
      return getAllWorkExperienceResponseModelFromJson(response.body);
    } else {
      throw Exception(response.body);
    }
  }

  static Future<GetVehicleTypeResponseModel> getVehicleTypes() async {
    http.Response response = await http.get(
      Uri.https(AppUrls.base, AppUrls.vehicleTypes),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        "Authorization": getToken()
      },
    );
    log("${Uri.https(AppUrls.base, AppUrls.vehicleTypes)}===============>${response.statusCode}");
    log("${Uri.https(AppUrls.base, AppUrls.vehicleTypes)}===============>${response.body}");
    if (response.statusCode == 200) {
      return getVehicleTypeResponseModelFromJson(response.body);
    } else {
      throw Exception(response.body);
    }
  }

  static Future<GetTransmissionTypeResponseModel> getTransmissionTypes() async {
    http.Response response = await http.get(
      Uri.https(AppUrls.base, AppUrls.transmissionTypes),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        "Authorization": getToken()
      },
    );
    log("${Uri.https(AppUrls.base, AppUrls.transmissionTypes)}===============>${response.statusCode}");
    log("${Uri.https(AppUrls.base, AppUrls.transmissionTypes)}===============>${response.body}");
    if (response.statusCode == 200) {
      return getTransmissionTypeResponseModelFromJson(response.body);
    } else {
      throw Exception(response.body);
    }
  }

  static Future<GetDocumentsResponseModel> getDocument() async {
    http.Response response = await http.get(
      Uri.https(AppUrls.base, AppUrls.document),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        "Authorization": getToken()
      },
    );
    log("${Uri.https(AppUrls.base, AppUrls.document)}===============>${response.statusCode}");
    log("${Uri.https(AppUrls.base, AppUrls.document)}===============>${response.body}");
    if (response.statusCode == 200) {
      return getDocumentsResponseModelFromJson(response.body);
    } else {
      throw Exception(response.body);
    }
  }

  static Future<UploadAadharResponseModel> uploadDocument(
      {required List<http.MultipartFile> files,
      required Map<String, String> fields}) async {
    var request =
        http.MultipartRequest("PUT", Uri.https(AppUrls.base, AppUrls.document));
    request.files.addAll(files);
    request.fields.addAll(fields);
    request.headers.addAll({"Authorization": getToken()});
    http.StreamedResponse response = await request.send();
    print(response.statusCode);
    if (response.statusCode == 200) {
      String responseString = await response.stream.bytesToString();
      log("${Uri.https(AppUrls.base, AppUrls.document)}===============>${response.statusCode}");
      log("${Uri.https(AppUrls.base, AppUrls.document)}===============>$responseString");
      log("${Uri.https(AppUrls.base, AppUrls.document)}===============>$fields");
      log("${Uri.https(AppUrls.base, AppUrls.document)}===============>$files");
      return uploadAadharResponseModelFromJson(responseString);
    } else {
      throw Exception(await response.stream.bytesToString());
    }
  }

  static Future<UploadProfilePhotoResponseModel> profileImage(
      http.MultipartFile file) async {
    var request = http.MultipartRequest(
        "PUT", Uri.https(AppUrls.base, AppUrls.profileImage));
    request.files.add(file);
    request.headers.addAll({"Authorization": getToken()});
    http.StreamedResponse response = await request.send();
    print(response.statusCode);
    if (response.statusCode == 200) {
      String responseString = await response.stream.bytesToString();
      log("${Uri.https(AppUrls.base, AppUrls.profileImage)}===============>${response.statusCode}");
      log("${Uri.https(AppUrls.base, AppUrls.profileImage)}===============>$responseString");
      return uploadProfilePhotoResponseModelFromJson(responseString);
    } else {
      throw Exception(await response.stream.bytesToString());
    }
  }

  static Future<GetProfilePhotoResponseModel> getProfileImage() async {
    http.Response response = await http.get(
      Uri.https(AppUrls.base, AppUrls.profileImage),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        "Authorization": getToken()
      },
    );
    log("${Uri.https(AppUrls.base, AppUrls.profileImage)}===============>${response.statusCode}");
    log("${Uri.https(AppUrls.base, AppUrls.profileImage)}===============>${response.body}");
    if (response.statusCode == 200) {
      return getProfilePhotoResponseModelFromJson(response.body);
    } else {
      throw Exception(response.body);
    }
  }

  static Future<GetBankAccountResponseModel> getBankAccount() async {
    http.Response response = await http.get(
      Uri.https(AppUrls.base, AppUrls.bankAccount),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        "Authorization": getToken()
      },
    );
    log("${Uri.https(AppUrls.base, AppUrls.bankAccount)}===============>${response.statusCode}");
    log("${Uri.https(AppUrls.base, AppUrls.bankAccount)}===============>${response.body}");
    if (response.statusCode == 200) {
      return getBankAccountResponseModelFromJson(response.body);
    } else {
      throw Exception(response.body);
    }
  }

  static Future<UpdateBanksResponseModel> updateBankAccount(
      {required Map<String, String> body}) async {
    http.Response response = await http.put(
        Uri.https(AppUrls.base, AppUrls.bankAccount),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          "Authorization": getToken()
        },
        body: body);
    log("${Uri.https(AppUrls.base, AppUrls.bankAccount)}===============>$body");
    log("${Uri.https(AppUrls.base, AppUrls.bankAccount)}===============>${response.statusCode}");
    log("${Uri.https(AppUrls.base, AppUrls.bankAccount)}===============>${response.body}");
    if (response.statusCode == 200) {
      return updateBanksResponseModelFromJson(response.body);
    } else {
      throw Exception(response.body);
    }
  }

  static Future<GetBanksResponseModel> getBanks() async {
    http.Response response = await http.get(
      Uri.https(AppUrls.base, AppUrls.banks),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        "Authorization": getToken()
      },
    );
    log("${Uri.https(AppUrls.base, AppUrls.banks)}===============>${response.statusCode}");
    log("${Uri.https(AppUrls.base, AppUrls.banks)}===============>${response.body}");
    if (response.statusCode == 200) {
      return getBanksResponseModelFromJson(response.body);
    } else {
      throw Exception(response.body);
    }
  }

  static Future<GetProfileResponseModel> getProfile() async {
    http.Response response = await http.get(
      Uri.https(AppUrls.base, AppUrls.profile),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        "Authorization": getToken()
      },
    );
    log("${Uri.https(AppUrls.base, AppUrls.profile)}===============>${response.statusCode}");
    log("${Uri.https(AppUrls.base, AppUrls.profile)}===============>${response.body}");
    if (response.statusCode == 200) {
      return getProfileResponseModelFromJson(response.body);
    } else {
      throw Exception(response.body);
    }
  }

  static Future<UpdateProfileResponseModel> upDateProfile(
      {required Map<String, String> body}) async {
    http.Response response = await http.put(
      Uri.https(AppUrls.base, AppUrls.profile),
      body: body,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        "Authorization": getToken()
      },
    );
    log("${Uri.https(AppUrls.base, AppUrls.profile)}===============>${response.statusCode}");
    log("${Uri.https(AppUrls.base, AppUrls.profile)}===============>${response.body}");
    if (response.statusCode == 200) {
      return updateProfileResponseModelFromJson(response.body);
    } else {
      throw Exception(response.body);
    }
  }

  static Future<AddBankAccountResponseModel> addBankAccount(
      {required Map<String, String> body}) async {
    var response = await http.post(
      Uri.https(AppUrls.base, AppUrls.bankAccount),
      headers: {"Authorization": getToken()},
      body: body,
    );
    log("${Uri.https(AppUrls.base, AppUrls.bankAccount)}===============>${response.statusCode}");
    log("${Uri.https(AppUrls.base, AppUrls.bankAccount)}===============>${response.body}");
    log("${Uri.https(AppUrls.base, AppUrls.bankAccount)}===============>$body");

    if (response.statusCode == 200) {
      return addBankAccountResponseModelFromJson(response.body);
    } else {
      throw Exception(response.body);
    }
  }

  static Future<GetEarningStatusResponseModel> getEarningStatus(
      {required Map<String, String> queryParameter}) async {
    var response = await http.get(
      Uri.https(AppUrls.base, AppUrls.earningStatus, queryParameter),
      headers: {"Authorization": getToken()},
    );
    log("${Uri.https(AppUrls.base, AppUrls.earningStatus)}===============>$queryParameter");
    log("${Uri.https(AppUrls.base, AppUrls.earningStatus)}===============>${response.statusCode}");
    log("${Uri.https(AppUrls.base, AppUrls.earningStatus)}===============>${response.body}");

    if (response.statusCode == 200) {
      return getEarningStatusResponseModelFromJson(response.body);
    } else {
      throw Exception(response.body);
    }
  }

  static Future<GetReviewStatusResponseModel> getReviewsStatus() async {
    http.Response response = await http.get(
      Uri.https(AppUrls.base, AppUrls.reviewsStatus),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        "Authorization": getToken()
      },
    );
    log("${Uri.https(AppUrls.base, AppUrls.reviewsStatus)}===============>${response.statusCode}");
    log("${Uri.https(AppUrls.base, AppUrls.reviewsStatus)}===============>${response.body}");
    if (response.statusCode == 200) {
      return getReviewStatusResponseModelFromJson(response.body);
    } else {
      throw Exception(response.body);
    }
  }

  static Future<GetReviewResponseModel> getReviews() async {
    http.Response response = await http.get(
      Uri.https(AppUrls.base, AppUrls.reviews),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        "Authorization": getToken()
      },
    );
    log("${Uri.https(AppUrls.base, AppUrls.reviews)}===============>${response.statusCode}");
    log("${Uri.https(AppUrls.base, AppUrls.reviews)}===============>${response.body}");
    if (response.statusCode == 200) {
      return getReviewResponseModelFromJson(response.body);
    } else {
      throw Exception(response.body);
    }
  }

  static Future<GetRidesResponseModel> getRides() async {
    http.Response response = await http.get(
      Uri.https(AppUrls.base, AppUrls.rides),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        "Authorization": getToken()
      },
    );
    log("${Uri.https(AppUrls.base, AppUrls.rides)}===============>${response.statusCode}");
    log("${Uri.https(AppUrls.base, AppUrls.rides)}===============>${response.body}");
    if (response.statusCode == 200) {
      return getRidesResponseModelFromJson(response.body);
    } else {
      throw Exception(response.body);
    }
  }

  static Future<GetRidesDetailsResponseModel> getRideDetails(
      {required Map<String, String> queryParameter}) async {
    http.Response response = await http.get(
      Uri.https(AppUrls.base, AppUrls.rideDetails, queryParameter),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        "Authorization": getToken()
      },
    );
    log("${Uri.https(AppUrls.base, AppUrls.rideDetails)}===============>${response.statusCode}");
    log("${Uri.https(AppUrls.base, AppUrls.rideDetails)}===============>${response.body}");
    if (response.statusCode == 200) {
      return getRidesDetailsResponseModelFromJson(response.body);
    } else {
      throw Exception(response.body);
    }
  }

  static Future<GetNotificationsResponseModel> getNotifications() async {
    http.Response response = await http.get(
      Uri.https(AppUrls.base, AppUrls.notifications),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        "Authorization": getToken()
      },
    );
    log("${Uri.https(AppUrls.base, AppUrls.notifications)}===============>${response.statusCode}");
    log("${Uri.https(AppUrls.base, AppUrls.notifications)}===============>${response.body}");
    if (response.statusCode == 200) {
      return getNotificationsResponseModelFromJson(response.body);
    } else {
      throw Exception(response.body);
    }
  }

  static Future<GetHelpCategoriesResponseModel> getHelpCategories() async {
    http.Response response = await http.get(
      Uri.https(AppUrls.base, AppUrls.helpCategories),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        "Authorization": getToken()
      },
    );
    log("${Uri.https(AppUrls.base, AppUrls.helpCategories)}===============>${response.statusCode}");
    log("${Uri.https(AppUrls.base, AppUrls.helpCategories)}===============>${response.body}");
    if (response.statusCode == 200) {
      return getHelpCategoriesResponseModelFromJson(response.body);
    } else {
      throw Exception(response.body);
    }
  }

  static Future<FaqResponseModel> getFaqs(
      {required Map<String, String> queryParameter}) async {
    http.Response response = await http.get(
      Uri.https(AppUrls.base, AppUrls.faqs, queryParameter),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        "Authorization": getToken()
      },
    );
    log("${Uri.https(AppUrls.base, AppUrls.faqs)}===============>$queryParameter");
    log("${Uri.https(AppUrls.base, AppUrls.faqs)}===============>${response.statusCode}");
    log("${Uri.https(AppUrls.base, AppUrls.faqs)}===============>${response.body}");
    if (response.statusCode == 200) {
      return faqResponseModelFromJson(response.body);
    } else {
      throw Exception(response.body);
    }
  }

  static Future<GetEarningListResponseModel> getEarnings(
      {required Map<String, String> queryParameter}) async {
    http.Response response = await http.get(
      Uri.https(AppUrls.base, AppUrls.earnings, queryParameter),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        "Authorization": getToken()
      },
    );
    log("${Uri.https(AppUrls.base, AppUrls.earnings)}===============>$queryParameter");
    log("${Uri.https(AppUrls.base, AppUrls.earnings)}===============>${response.statusCode}");
    log("${Uri.https(AppUrls.base, AppUrls.earnings)}===============>${response.body}");
    if (response.statusCode == 200) {
      return getEarningListResponseModelFromJson(response.body);
    } else {
      throw Exception(response.body);
    }
  }

  static Future<UpdatePreferenceResponseModel> savePreference(
      {required Map<String, String> body}) async {
    http.Response response = await http.put(
      Uri.https(
        AppUrls.base,
        AppUrls.savePreference,
      ),
      body: body,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        "Authorization": getToken()
      },
    );
    log("${Uri.https(AppUrls.base, AppUrls.savePreference)}===============>$body");
    log("${Uri.https(AppUrls.base, AppUrls.savePreference)}===============>${response.statusCode}");
    log("${Uri.https(AppUrls.base, AppUrls.savePreference)}===============>${response.body}");
    if (response.statusCode == 200) {
      return updatePreferenceResponseModelFromJson(response.body);
    } else {
      throw Exception(response.body);
    }
  }

  static Future<UpdatePreferenceResponseModel> getPreference() async {
    http.Response response = await http.get(
      Uri.https(
        AppUrls.base,
        AppUrls.savePreference,
      ),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        "Authorization": getToken()
      },
    );
    log("${Uri.https(AppUrls.base, AppUrls.savePreference)}===============>${response.statusCode}");
    log("${Uri.https(AppUrls.base, AppUrls.savePreference)}===============>${response.body}");
    if (response.statusCode == 200) {
      return updatePreferenceResponseModelFromJson(response.body);
    } else {
      throw Exception(response.body);
    }
  }

  static Future<LogoutResponseModel> logout(
      {required Map<String, String> body}) async {
    http.Response response = await http.post(
      Uri.https(
        AppUrls.base,
        AppUrls.logout,
      ),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        "Authorization": getToken()
      },
    );
    log("${Uri.https(AppUrls.base, AppUrls.logout)}===============>${response.statusCode}");
    log("${Uri.https(AppUrls.base, AppUrls.logout)}===============>${response.body}");
    if (response.statusCode == 200) {
      return logoutResponseModelFromJson(response.body);
    } else {
      throw Exception(response.body);
    }
  }

  static Future<LogoutResponseModel> deleteAccount(
      {required Map<String, String> body}) async {
    http.Response response = await http.post(
      Uri.https(
        AppUrls.base,
        AppUrls.deleteAccount,
      ),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        "Authorization": getToken()
      },
    );
    log("${Uri.https(AppUrls.base, AppUrls.deleteAccount)}===============>${response.statusCode}");
    log("${Uri.https(AppUrls.base, AppUrls.deleteAccount)}===============>${response.body}");
    if (response.statusCode == 200) {
      return logoutResponseModelFromJson(response.body);
    } else {
      throw Exception(response.body);
    }
  }
}
