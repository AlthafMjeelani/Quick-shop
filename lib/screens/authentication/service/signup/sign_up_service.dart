import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:ecommerse/core/api/api_baseurl.dart';
import 'package:ecommerse/core/api/api_endpoints.dart';
import 'package:ecommerse/screens/authentication/model/sign_up/sign_up_model.dart';
import 'package:ecommerse/utils/exception/dio_exception.dart';

class SignUpApiService {
  /*------------------- Create UserAccount ----------------------*/

  static Future<UserModel?> signUpService(
      UserModel model, phoneController) async {
    final dio = Dio();
    try {
      UserModel? userModel;
      log('called reg api fetch fuction');

      /*  call api key   */

      final Response response = await dio.post(
        ApiBaseUrl.baseUrl + ApiEndPoints.register,
        data: jsonEncode(model.toJson()),
        queryParameters: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
        },
      );
      log('api called success');

      /*  check status code is Success or bad requist   */

      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        userModel = UserModel.fromJson(response.data);
        log(response.data.toString());
        return userModel;
      }

      /*  Catch error   */

    } catch (e) {
      log('Reg Error catched');
      DioExceptionhandler.errorHandler(e);
    }
    return null;
  }
}
