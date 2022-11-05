import 'dart:developer';

import 'package:ecommerse/screens/payment/service/razorpay_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class ScreenPaymentMethodeProvider with ChangeNotifier {
  String selectedType = 'online';
  final razorpay = Razorpay();

  var options = {
    'key': 'rzp_test_43WHhfpaRYMT5P',
    'amount': 10000,
    'name': 'Quick Shope',
    'description': 'Dresses',
    'timeout': 300,
    'prefill': {
      'contact': '8086686886',
      'email': 'quickshope@gmail.com',
    }
  };

  void razorPayInitFn() {
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    log('Payment Success');
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    log('Payment Faild');
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    log('Payment ExternalWallet');
  }

  void radionButtonChange(String newValue) {
    selectedType = newValue;
    notifyListeners();
  }

  void goToPayment() {
    if (selectedType == 'online') {
      RazorPayService.razorPayService(razorpay, options);
    }
  }
}
