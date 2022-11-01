import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecommerse/core/api/api_baseurl.dart';
import 'package:ecommerse/core/api/api_endpoints.dart';
import 'package:ecommerse/utils/exception/dio_exception.dart';

class ForgetPasswordServices {
static  Future<String?> getOtp(String email) async {
    try {
      Dio dio = Dio();
      Response response = await dio.post(
        ApiBaseUrl.baseUrl + ApiEndPoints.forgotpassword,
        data: {"email": email},
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
