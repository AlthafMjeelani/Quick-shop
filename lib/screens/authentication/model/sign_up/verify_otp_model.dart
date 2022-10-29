import 'package:ecommerse/screens/authentication/model/sign_up/sign_up_model.dart';

class UserVerifyOtpModel {
  UserModel? userModel;
  String? code;

  UserVerifyOtpModel({
    this.userModel,
    this.code,
  });

  factory UserVerifyOtpModel.fromJson(Map<String, dynamic> json) {
    return UserVerifyOtpModel(
      userModel: json['user'],
      code: json['code'],
    );
  }

  Map<String, dynamic> toJson() => {
        "code": code,
        "user": userModel,
      };
}
