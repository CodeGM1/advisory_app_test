import 'dart:async';

class LoginAuth{
  String? email;
  String? password;

  LoginAuth({
    this.email,
    this.password,
  });

  LoginAuth.fromData(Map<String, dynamic> data)
      : email = data['email'],
        password = data['password'];

  Map<String, dynamic> toJson() {
    return {
      'email':email,
      'password':password,
    };
  }

}