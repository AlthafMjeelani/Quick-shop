class UserVerifyOtpModel {
  final String? userName;
  final String? email;
  final String? phone;
  final String? password;

  UserVerifyOtpModel({
    required this.userName,
    required this.email,
    required this.phone,
    required this.password,
  });

  factory UserVerifyOtpModel.fromJson(Map<String, dynamic> json) {
    return UserVerifyOtpModel(
      userName: json["username"] ?? "",
      email: json["email"] ?? "",
      phone: json["phone"] ?? "",
      password: json["password"] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "username": userName,
      "email": email,
      "phone": phone,
      "password": password,
    };
  }
}
