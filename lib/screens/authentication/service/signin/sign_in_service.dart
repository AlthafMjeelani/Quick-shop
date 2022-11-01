import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ecommerse/core/api/api_baseurl.dart';
import 'package:ecommerse/core/api/api_endpoints.dart';
import 'package:ecommerse/screens/authentication/model/signin/sign_in_model.dart';
import 'package:ecommerse/utils/app_popups.dart';
import 'package:ecommerse/utils/exception/dio_exception.dart';
import 'package:ecommerse/utils/securestorage/secure_storage.dart';
import 'package:flutter/material.dart';

class SignInService {
  /*------------------- Sign In  UserAccount ----------------------*/

  static Future<SignInModel?> signUpService(SignInModel model) async {
    final dio = Dio();
    try {
      SignInModel? signInModel;
      log('called login api fetch fuction');

      /*  call api key   */

      final Response response = await dio.post(
        ApiBaseUrl.baseUrl + ApiEndPoints.login,
        data: jsonEncode(model.toJson()),
        queryParameters: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
        },
      );
      log('api called success');

      /*  check status code is Succes or bad requist   */

      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        /*  store the token in secure storage   */

        await UserSecureStorage.setToken(response.data['token']);
        log(response.data['token']);
        final token = await UserSecureStorage.getToken();
        log('get token :$token');
        signInModel = SignInModel.fromJson(response.data);
        log(response.data.toString());
        return signInModel;
      }

      /*  Catch error   */

    } on SocketException catch (_) {
      AppPopUps.showToast('No Internet Connection', Colors.red);
    } catch (e) {
      log('Reg Error catched');
      DioExceptionhandler.errorHandler(e);
    }
    return null;
  }
}
