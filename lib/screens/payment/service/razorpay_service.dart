import 'dart:developer';

import 'package:razorpay_flutter/razorpay_flutter.dart';

class RazorPayService {
  static void razorPayService(Razorpay razorpay, Map<String, Object> options) {
    try {
      razorpay.open(options);
    } catch (e) {
      log('catch called payment');
    }
  }
}
