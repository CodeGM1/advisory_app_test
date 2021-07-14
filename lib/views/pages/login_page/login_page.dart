import 'dart:math';

import 'package:advisory_app_test/services/login_service.dart';
import 'package:advisory_app_test/views/widgets/appbar.dart';
import 'package:advisory_app_test/views/widgets/buttons.dart';
import 'package:advisory_app_test/views/widgets/formdetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController userControl = TextEditingController();
  final TextEditingController passControl = TextEditingController();
  final LoginSvc = LoginServices();

  void dispose(){
    userControl.dispose();
    passControl.dispose();
    super.dispose();
  }

  Future<void> loginClick(String user, String pass) async {
    final prefs = await SharedPreferences.getInstance();
    final value = 42;
    const key = 'login_key';
    prefs.setInt(key, value);
    print('saved $value');
    /*await LoginSvc.retrieveLoginData(user,pass);*/
  }

  int randomizer(){
    var rng = new Random();
    return rng.nextInt(100);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Stack(
          children: [
            Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 60,
                    child: WidgetAppBar()
                  ),
                  const SizedBox(
                    height: 120,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left:30, right:30),
                        child: WidgetFormDetails(
                          type:'normal',
                          headerText: 'Username',
                          hintText: 'Enter Your Username',
                          textControl: userControl,
                        ),
                      ),
                      const SizedBox(
                        height:20,
                      ),
                      Container(
                        margin: EdgeInsets.only(left:30, right:30),
                        child: WidgetFormDetails(
                          type:'password',
                          headerText: 'Password',
                          hintText: 'Enter your password',
                          textControl: passControl,
                        ),
                      ),
                      const SizedBox(
                        height:40,
                      ),
                      Container(
                        margin: EdgeInsets.only(left:30, right:30),
                        child: WidgetButtons(
                          type: 'normal',
                          onPressedButton: () {
                            loginClick(userControl.text, passControl.text);
                          },
                          buttonText: 'Log in',
                        )
                      ),

                    ],
                  ),
                ],
              )
            ),
            Positioned(
              top: 10,
              left: 10,
              child: WidgetButtons(
                type: 'back',
                buttonText: 'back',
                onPressedButton: (){
                  Navigator.pop(context);
                },
              ),
            )
          ],
        )
      ),
    );
  }
}
