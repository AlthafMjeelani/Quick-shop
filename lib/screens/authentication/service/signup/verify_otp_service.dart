import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:ecommerse/screens/authentication/model/sign_up/verify_otp_model.dart';
import 'package:ecommerse/screens/bottomnavigation/view/bottom_navigation.dart';
import 'package:ecommerse/utils/app_popups.dart';
import 'package:ecommerse/utils/exception/dio_exception.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class VerifyotpService {
  //------------------- Verify Otp ----------------------

  static Future<void> signUpVerifyOtp(
      UserVerifyOtpModel model, context, bool isLoading) async {
    const storage = FlutterSecureStorage();
    try {
      isLoading = true;
      final response = await Dio().post(
        "http://192.168.0.171:5000/api/v1/verifyOtp",
        data: model.toJson(),
      );
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        log(response.data.toString());

        storage.write(key: 'token', value: response.data);
        AppPopUps.showToast('Created Successfully', Colors.green);
        isLoading = false;
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const ScreenBottomNavbar(),
            ),
            (route) => false);
      }
    } catch (e) {
      isLoading = false;
      DioExceptionhandler.errorHandler(e);
    }
  }
}
