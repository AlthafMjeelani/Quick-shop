class SignInModel {
    SignInModel({
        this.password,
        this.email,
    });

    String? password;
    String? email;

    Map<String, dynamic> toJson() => {
        "password": password,
        "email": email,
    };
}