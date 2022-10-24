class UserVerifyOtpModel {
  UserVerifyOtpModel({
    this.username,
    this.email,
    this.phone,
    this.password,
    this.code,
  });

  String? username;
  String? email;
  String? phone;
  String? password;
  String? code;

  Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "phone": phone,
        "password": password,
        "code": code,
      };
}
