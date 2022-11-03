class ForgotOtpVerifyModel {
  final String email;
  final String otp;

  ForgotOtpVerifyModel({
    required this.email,
    required this.otp,
  });

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "otp": otp,
    };
  }
}
