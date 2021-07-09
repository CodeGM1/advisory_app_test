import 'package:advisory_app_test/constants/styles.dart';
import 'package:advisory_app_test/views/pages/login_page/login_page.dart';
import 'package:advisory_app_test/views/widgets/appbar.dart';
import 'package:advisory_app_test/views/widgets/bottombar.dart';
import 'package:advisory_app_test/views/widgets/buttons.dart';
import 'package:advisory_app_test/views/widgets/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:advisory_app_test/constants/colors.dart';

class MainPage extends StatefulWidget {

  MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  var screenSize;
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {

    screenSize = MediaQuery.of(context).size;

    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: false,
      drawer: WidgetDrawer(),
      body:
      Stack(
        children: [
          Center(
            child: Container(
                width: double.infinity,
                height: double.infinity,
                child: Column(
                  children: [

                    Expanded(
                      flex: 1,
                      child: WidgetAppBar(),
                    ),

                    Expanded(
                      flex: 9,
                      child: Column(
                        children: [
                          Expanded(
                            flex: 6,
                            child: Container(),
                          ),
                          Expanded(
                            flex: 3,
                            child: WidgetButtons(
                              type:'normal',
                              buttonText: 'Login using Email',
                              onPressedButton: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) {
                                    return LoginPage();
                                  }),
                                );
                              },
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(),
                          ),
                          Expanded(
                            flex: 3,
                            child: WidgetButtons(
                              type:'normal',
                              buttonText: 'Login using GMail',
                              onPressedButton: (){},
                            ),
                          ),
                          Expanded(
                            flex: 11,
                            child: Container(),
                          ),

                        ],
                      ),
                    ),

                    Expanded(
                      flex: 1,
                      child: WidgetBottomBar(),
                    )


                  ],
                )
            ),
          ),
          Positioned(
              left: 10,
              top: 10,
              child: IconButton(
                icon: const Icon(Icons.menu, color: Colors.white),
                onPressed: (){
                  scaffoldKey.currentState!.openDrawer();
                },
              ),
          )
        ],

      ),


      /*Container(

        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Column(
          children: [

            Expanded(
              flex: 1,
              child: _buildCustomAppBar(),
            ),

            Expanded(
              flex: 10,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: bgBlueColor,
                ),
                width: double.infinity,
                height: double.infinity,
                margin: const EdgeInsets.only(top:50, left:10,right:10, bottom: 50),
                child: Column(
                  children: [

                    ButtonWidgets(type:'normal', buttonText: 'Login using e-mail', onPressedButton: (){},),

                  ],
                ),
              ),
            ),
          ],
        ),

      ),*/
    );
  }

  Widget _buildCustomAppBar(){
    return Container(
      decoration: const BoxDecoration(
        color: bgBlueColor,
      ),
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.topCenter,
                margin: const EdgeInsets.all(10),
                child: const Text('AdvisoryApps Flutter Test',
                  style: fontHeaderStyle,
                ),
              )
          ),
        ],
      )
    );
  }
}
