class SaveNewPasswordModel {
  final String email;
  final String password;
  final String code;

  SaveNewPasswordModel({
    required this.email,
    required this.password,
    required this.code,
  });

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "password": password,
      "otp": code,
    };
  }
}