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
      Container(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            /*Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF17C6C3),
                    Color(0xFF15B6B4),
                    Color(0xFF129794),
                    Color(0xFF108785),

                  ],
                  stops: [0.1, 0.4, 0.7, 0.9],
                )
              )
            ),*/

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
                            flex: 7,
                            child: Container(),
                          ),
                          Expanded(
                            flex: 3,
                            child: ConstrainedBox(
                              constraints: BoxConstraints(maxWidth: screenSize.width/1.2),
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
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(),
                          ),
                          Expanded(
                            flex: 3,
                            child: ConstrainedBox(
                              constraints: BoxConstraints(maxWidth: screenSize.width/1.2),
                              child: Text('Or', style: fontNormalStyle,)
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: GestureDetector(
                              onTap: (){print('Login FB');},
                              child: Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.blue,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black45,
                                      offset: Offset(0,2),
                                      blurRadius: 6.0,
                                    ),
                                  ],
                                  image: DecorationImage(
                                    image: AssetImage('images/fb_logo.png'),
                                  ),
                                ),
                              ),
                            )
                          ),
                          Expanded(
                            flex: 10,
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

           /* SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 20,
              ),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: WidgetAppBar(),
                      ),
                      Expanded(
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
                              child: WidgetButtons(
                                type:'normal',
                                buttonText: 'Login using GMail',
                                onPressedButton: (){},
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: WidgetBottomBar(),
                      )
                    ],
                  ),
              ),
            ),*/
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
