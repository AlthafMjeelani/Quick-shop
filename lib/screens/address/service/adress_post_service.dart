import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:ecommerse/core/api/api_baseurl.dart';
import 'package:ecommerse/core/api/api_endpoints.dart';
import 'package:ecommerse/core/appconfi.dart';
import 'package:ecommerse/screens/address/model/adddress_post_mode.dart';
import 'package:ecommerse/utils/exception/dio_exception.dart';
import 'package:ecommerse/utils/securestorage/secure_storage.dart';

class AddressPostService {
  static Future<bool> addressPostService(AddressPostModel model) async {
    final dio = Dio();
    try {
      log('called addto Address fuction');
      final token = await UserSecureStorage.getToken();
      log('get token :$token');
      /*  call api key   */

      final Response response = await dio.post(
        ApiBaseUrl.baseUrl + ApiEndPoints.address,
        data: model.toJson(),
        options: Options(headers: AppConfig.getApiHeader(token: token)),
      );
      log('api called success');

      /*  check status code is Succes or bad requist   */

      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        log(response.data.toString());

        return response.data['success'];
      }

      /*  Catch error   */

    } catch (e) {
      log('address add Error catched');
      DioExceptionhandler.errorHandler(e);
    }
    return false;
  }
}
