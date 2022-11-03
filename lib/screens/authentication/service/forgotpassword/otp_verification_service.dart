import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ecommerse/core/api/api_baseurl.dart';
import 'package:ecommerse/core/api/api_endpoints.dart';
import 'package:ecommerse/screens/authentication/model/forgotpassword/forgot_otp_verification_model.dart';
import 'package:ecommerse/utils/exception/dio_exception.dart';

class ForgetPasswordOtpverificationServices {
  static Future<String?> forgetPasswordOtpverification(
     ForgotOtpVerifyModel model) async {
    try {
      Dio dio = Dio();
      Response response = await dio.post(
        ApiBaseUrl.baseUrl + ApiEndPoints.fogotOtpverification,
        data:jsonEncode(model.toJson())
      );
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        // log(response.data);
        return response.data["message"];
      }
    } catch (e) {
      DioExceptionhandler.errorHandler(e);
    }
    return null;
  }
}
