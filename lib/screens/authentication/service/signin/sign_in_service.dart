import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecommerse/core/api/api_baseurl.dart';
import 'package:ecommerse/core/api/api_endpoints.dart';
import 'package:ecommerse/screens/authentication/model/signin/sign_in_model.dart';
import 'package:ecommerse/screens/bottomnavigation/view/bottom_navigation.dart';
import 'package:ecommerse/utils/exception/dio_exception.dart';
import 'package:flutter/material.dart';

class SignInService {
  /*------------------- Sign In  UserAccount ----------------------*/

  static Future<void> signUpService(SignInModel model, context) async {
    final dio = Dio();
    try {
      log('called login api fetch fuction');

      /*  call api key   */

      final Response response = await dio.post(
        ApiBaseUrl.baseUrl + ApiEndPoints.login,
        data: model.toJson(),
        queryParameters: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
        },
      );
      log('api called success');

      /*  check status code is Succes or bad requist   */

      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        log(response.data.toString());
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const ScreenBottomNavbar(),
            ),
            (route) => false);
      }

      /*  Catch error   */

    } catch (e) {
      log('Reg Error catched');
      DioExceptionhandler.errorHandler(e);
    }
  }
}
