import 'package:advisory_app_test/views/widgets/appbar.dart';
import 'package:advisory_app_test/views/widgets/buttons.dart';
import 'package:advisory_app_test/views/widgets/formdetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                  Expanded(
                    flex: 1,
                    child: WidgetAppBar(),
                  ),
                  Expanded(
                    flex: 10,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 6,
                          child: Container(),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            margin: EdgeInsets.only(left:30, right:30),
                            child: WidgetFormDetails(
                              type:'normal',
                              headerText: 'Username',
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            margin: EdgeInsets.only(left:30, right:30),
                            child: WidgetFormDetails(
                              type:'password',
                              headerText: 'Password',
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 14,
                          child: Container(),
                        ),
                      ],
                    )
                  )
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
