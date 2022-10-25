import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:ecommerse/core/api/api_baseurl.dart';
import 'package:ecommerse/core/api/api_endpoints.dart';
import 'package:ecommerse/screens/authentication/model/sign_up/verify_otp_model.dart';
import 'package:ecommerse/screens/bottomnavigation/view/bottom_navigation.dart';
import 'package:ecommerse/utils/app_popups.dart';
import 'package:ecommerse/utils/exception/dio_exception.dart';
import 'package:ecommerse/utils/securestorage/secure_storage.dart';
import 'package:flutter/material.dart';

class VerifyotpService {
  //------------------- Verify Otp ----------------------

  static Future<void> signUpVerifyOtp(UserVerifyOtpModel model, context) async {
    try {
      final response = await Dio().post(
        ApiBaseUrl.baseUrl + ApiEndPoints.verifyOtp,
        data: model.toJson(),
      );
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        //log(response.data.toString());

        await UserSecureStorage.setToken(response.data['token']);
        log(response.data['token']);
        final token = await UserSecureStorage.getToken();
        log('get token $token');

        AppPopUps.showToast('Created Successfully', Colors.green);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const ScreenBottomNavbar(),
            ),
            (route) => false);
      }
    } catch (e) {
      DioExceptionhandler.errorHandler(e);
    }
  }
}
