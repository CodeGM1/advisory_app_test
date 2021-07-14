import 'dart:async';
import 'dart:convert';

import 'package:advisory_app_test/models/login.dart';
import 'package:http/http.dart' as http;

const url = "http://interview.advisoryapps.com/index.php/login";

final loginAuth = LoginAuth();

class LoginServices{

  retrieveLoginData(String email, String password,)async{

    print(email);
    print(password);

    String bodyF = jsonEncode(<String, dynamic>{
      'email': email,
      'password': password,
    });

    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: bodyF,
    );

    if (response.statusCode == 200) {
      print(response.body);
    } else {
      throw Exception('Failed to load album with code of ${response.statusCode}');
    }
  }

}