import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:ecommerse/core/api/api_baseurl.dart';
import 'package:ecommerse/core/api/api_endpoints.dart';
import 'package:ecommerse/core/appconfi.dart';
import 'package:ecommerse/screens/address/model/address_remove_model.dart';
import 'package:ecommerse/utils/exception/dio_exception.dart';
import 'package:ecommerse/utils/securestorage/secure_storage.dart';

class AddressDeteteService {
  static Future<AddressRemoveModel?> addressDeteteService(
      String addressId) async {
    final dio = Dio();
    try {
      log('called add to WishList Detete fuction');
      final token = await UserSecureStorage.getToken();
      log('get token :$token');
      final Response response = await dio.delete(
        ApiBaseUrl.baseUrl + ApiEndPoints.removeaddress + addressId,
        options: Options(headers: AppConfig.getApiHeader(token: token)),
      );
      log('api called success');

      /*  check status code is Succes or bad requist   */

      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        log(response.data['message']);
        return AddressRemoveModel.fromJson(response.data);
      }

      /*  Catch error   */

    } catch (e) {
      log('Reg Error catched');
      DioExceptionhandler.errorHandler(e);
    }
    return null;
  }
}
