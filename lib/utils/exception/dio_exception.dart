import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ecommerse/utils/app_popups.dart';
import 'package:flutter/material.dart';

class DioExceptionhandler {
  static void errorHandler(Object e) {
    if (e is SocketException) {
      AppPopUps.showToast('No Internet Connection', Colors.red);
    }
    if (e is DioError) {
      if (e.response?.statusCode == 401) {
        AppPopUps.showToast('Server not found !', Colors.red);
      } else if (e.response?.statusCode == 400) {
        AppPopUps.showToast(e.response?.data['message'], Colors.red);
      } else if (e.response?.statusCode == 404) {
        AppPopUps.showToast(e.response?.data['message'], Colors.red);
      } else if (e.type == DioErrorType.connectTimeout) {
        AppPopUps.showToast('Connection Timout', Colors.red);
      } else if (e.type == DioErrorType.receiveTimeout) {
        AppPopUps.showToast('Recieve Timout', Colors.red);
      } else if (e.type == DioErrorType.cancel) {
        AppPopUps.showToast('Request cancelled', Colors.red);
      } else if (e.type == DioErrorType.sendTimeout) {
        AppPopUps.showToast('Url  sent timeout', Colors.red);
      } else if (e.type == DioErrorType.response) {
        AppPopUps.showToast('Incorrect Input', Colors.red);
      } else if (e.type == DioErrorType.other) {
        AppPopUps.showToast('Something went Wrong', Colors.red);
      }
    }
  }
}
