import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:ecommerse/core/api/api_baseurl.dart';
import 'package:ecommerse/core/api/api_endpoints.dart';
import 'package:ecommerse/core/appconfi.dart';
import 'package:ecommerse/screens/address/model/address_get_model.dart';
import 'package:ecommerse/utils/exception/dio_exception.dart';
import 'package:ecommerse/utils/securestorage/secure_storage.dart';

class AddressGetService {
  static Future<List<AddressGetModel>?> addressGetService() async {
    final dio = Dio();
    try {
      log('called add to Address get fuction');
      final token = await UserSecureStorage.getToken();
      log('get token :$token');

      /*  call api key   */

      final Response response = await dio.get(
        ApiBaseUrl.baseUrl + ApiEndPoints.address,
        options: Options(headers: AppConfig.getApiHeader(token: token)),
      );
      log('api called success');

      /*  check status code is Succes or bad requist   */

      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        log('response of get address :${response.data}');
        final List<AddressGetModel> addressModel =
            (response.data as List).map((e) {
          return AddressGetModel.fromJson(e);
        }).toList();
        return addressModel;
      }

      /*  Catch error   */

    } catch (e) {
      log('get address Error catched');
      DioExceptionhandler.errorHandler(e);
    }
    return null;
  }
}
