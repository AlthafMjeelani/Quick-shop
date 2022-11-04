import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:ecommerse/core/api/api_baseurl.dart';
import 'package:ecommerse/core/api/api_endpoints.dart';
import 'package:ecommerse/utils/exception/dio_exception.dart';

class SaveNewpasswordService {
  static Future<String?> saveNewPassword(
    String email,
    String password,
  ) async {
    try {
      Dio dio = Dio();
      Response response = await dio
          .put(ApiBaseUrl.baseUrl + ApiEndPoints.forgotpassword, data: {
        "email": email,
        "password": password,
      });
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        log(response.data["message"]);
        return response.data["message"];
      }
    } catch (e) {
      DioExceptionhandler.errorHandler(e);
    }
    return null;
  }
}
