import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:ecommerse/core/api/api_baseurl.dart';
import 'package:ecommerse/core/api/api_endpoints.dart';
import 'package:ecommerse/screens/authentication/model/sign_up/verify_otp_model.dart';
import 'package:ecommerse/utils/exception/dio_exception.dart';
import 'package:ecommerse/utils/securestorage/secure_storage.dart';

class VerifyotpService {
  /*------------------- Verify Otp ----------------------*/

  static Future<UserVerifyOtpModel?> signUpVerifyOtp(
      UserVerifyOtpModel model, context) async {
    try {
      /*  call api key   */
      UserVerifyOtpModel? userVerifyOtpModel;
      final response = await Dio().post(
        ApiBaseUrl.baseUrl + ApiEndPoints.verifyOtp,
        data: model.toJson(),
      );

      /*  check status code is Successs or Badrequist   */

      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        /*  store token into secure storage   */

        await UserSecureStorage.setToken(response.data['token']);
        log(response.data['token']);
        final token = await UserSecureStorage.getToken();
        log('get token :$token');

        userVerifyOtpModel = UserVerifyOtpModel.fromJson(response.data);
        return userVerifyOtpModel;
      }

      /*  Catch error   */

    } catch (e) {
      DioExceptionhandler.errorHandler(e);
    }
    return null;
  }
}
