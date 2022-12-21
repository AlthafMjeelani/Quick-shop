import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:ecommerse/core/api/api_baseurl.dart';
import 'package:ecommerse/core/api/api_endpoints.dart';
import 'package:ecommerse/core/appconfi.dart';
import 'package:ecommerse/screens/home/model/carousal_model.dart';
import 'package:ecommerse/utils/exception/dio_exception.dart';

class CarousalService {
  static Future<CarousalsModel?> carousalService() async {
    final dio = Dio();
    try {
      log('called carousal api fetch fuction');

      /*  call api key   */

      final Response response = await dio.get(
        ApiBaseUrl.baseUrl + ApiEndPoints.carousal,
        options: Options(headers: AppConfig.getApiHeader(token: null)),
      );
      log('api called success');

      /*  check status code is Succes or bad requist   */

      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        log(response.data.toString());
        CarousalsModel carousals = CarousalsModel.fromJson(response.data);
        return carousals;
      }

      /*  Catch error   */

    } catch (e) {
      log(e.toString());
      log('Reg Error catched');
      DioExceptionhandler.errorHandler(e);
    }
    return null;
  }
}
