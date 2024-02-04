import '../constants/get_storage_constants.dart';
import '../main.dart';

class ApiServices {
  static String getToken() {
    return "Bearer ${box.read(GetStorageConstants.token)}";
  }

  static Future loginCheck({required Map<String, String> body}) async {
    // http.Response response = await http.post(
    // Uri.https(AppUrls.base, AppUrls.rentalHistory, queryParameter),

    // headers: {'Content-Type': 'application/x-www-form-urlencoded'},
    // body: body);
    // log("${ThaiUrls.loginCheck}===============>$body");
    // log("${ThaiUrls.loginCheck}===============>${response.statusCode}");
    // log("${ThaiUrls.loginCheck}===============>${response.body}");
  }
}
