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

  Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "phone": phone,
        "password": password,
      };
}
