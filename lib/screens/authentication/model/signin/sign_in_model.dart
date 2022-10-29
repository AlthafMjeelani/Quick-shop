class SignInModel {
  SignInModel({
    this.password,
    this.email,
  });

  String? password;
  String? email;

  factory SignInModel.fromJson(Map<String, dynamic> json) {
    return SignInModel(
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() => {
        "password": password,
        "email": email,
      };
}
