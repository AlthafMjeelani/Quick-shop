class UserModel {
  UserModel({
    this.username,
    this.email,
    this.phone,
    this.password,
  });

  String? username;
  String? email;
  String? phone;
  String? password;

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['user']['email'],
      password: json['user']['password'],
      phone: json['user']['phone'],
      username: json['user']['username'],
    );
  }

  Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "phone": phone,
        "password": password,
      };
}
