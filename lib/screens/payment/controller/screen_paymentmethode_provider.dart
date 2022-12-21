import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:ecommerse/screens/account/view/screen_account.dart';
import 'package:ecommerse/screens/bottomnavigation/view/bottom_navigation.dart';
import 'package:ecommerse/screens/home/view/screen_home.dart';
import 'package:ecommerse/screens/payment/service/razorpay_service.dart';
import 'package:ecommerse/screens/productdetails/view/product_details_view.dart';
import 'package:ecommerse/utils/app_popups.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class ScreenPaymentMethodeProvider with ChangeNotifier {
  String selectedType = 'razorpay';
  final razorpay = Razorpay();
  bool isSuccess = false;

  void razorPayInitFn() {
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    AppPopUps.showToast('Payment Success', Colors.green);
    Get.offAll(() => const ScreenBottomNavbar());
    isSuccess = true;
    notifyListeners();
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    AppPopUps.showToast('Payment Faild', Colors.red);
    log('Payment Faild');
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    log('Payment ExternalWallet');
  }

  void radionButtonChange(String newValue) {
    selectedType = newValue;
    notifyListeners();
  }

  void goToPayment(String amount) {
    final options = {
      'key': 'rzp_test_43WHhfpaRYMT5P',
      'amount':amount*100,
      'name': 'Quick Shope',
      'description': 'Online Shopping',
      'timeout': "300",
      'prefill': {
        'contact': '8086686886',
        'email': 'quickshope@gmail.com',
      }
    };
    if (selectedType == 'razorpay') {
      RazorPayService.razorPayService(razorpay, options);
    }
  }

  void navigatorPop() {
    Get.back();
  }
}
