// import 'dart:io';
// import 'package:dio/dio.dart';
// import 'package:ecommerse/utils/exception/interceptor/dio_connectivity_request.dart';

// class RetryOnConnectionChangeInterceptor extends Interceptor {
//   final DioConnectivityRequest request;

//   RetryOnConnectionChangeInterceptor(this.request);
//   @override
//   Future onError(DioError err, ErrorInterceptorHandler handler) async {
//     if (_shouldRetry(err)) {
//       try {
//         request.scheduleRequestRetry(err.requestOptions);
//       } catch (e) {
//         return e;
//       }
//     }
//     return err;
//   }

//   bool _shouldRetry(DioError err) {
//     return err.type == DioErrorType.other &&
//         err.error != null &&
//         err.error is SocketException;
//   }
// }
