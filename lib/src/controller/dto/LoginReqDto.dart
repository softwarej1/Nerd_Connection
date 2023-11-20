class LoginReqDto {
  final String? email;
  final String? password;

  LoginReqDto(this.email, this.password);

  Map<String, dynamic> toJson() => {
        "username": email,
        "password": password,
      };
}
