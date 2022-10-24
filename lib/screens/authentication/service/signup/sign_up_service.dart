import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:ecommerse/core/api/api_baseurl.dart';
import 'package:ecommerse/core/api/api_endpoints.dart';
import 'package:ecommerse/screens/authentication/model/sign_up/sign_up_model.dart';
import 'package:ecommerse/screens/authentication/view/screen_otp.dart';
import 'package:ecommerse/utils/exception/dio_exception.dart';
import 'package:flutter/material.dart';

class SignUpApiService {
  //------------------- Create UserAccount ----------------------

  static Future<void> signUpService(
      UserModel model, context, phoneController, bool isLoading) async {
    try {
      isLoading = true;
      final response = await Dio().post(
        ApiBaseUrl.baseUrl + ApiEndPoints.register,
        data: model.toJson(),
      );
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        isLoading = false;
        log(response.data.toString());
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ScreenOtp(otpNumber: phoneController),
          ),
        );
      }
    } catch (e) {
      isLoading = false;
      DioExceptionhandler.errorHandler(e);
    }
  }
}
