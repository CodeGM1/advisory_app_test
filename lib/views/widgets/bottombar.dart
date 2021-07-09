import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:advisory_app_test/constants/colors.dart';

class WidgetBottomBar extends StatefulWidget {
  WidgetBottomBar({Key? key}) : super(key: key);

  @override
  _WidgetBottomBarState createState() => _WidgetBottomBarState();
}

class _WidgetBottomBarState extends State<WidgetBottomBar> {
  @override
  Widget build(BuildContext context) {
    return _buildBottomBar();
  }

  Widget _buildBottomBar(){
    return Container(
        color: bgBlueColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            SizedBox(
              width: 50,
              height: 50,
              child: InkWell(
                onTap: (){},
                child: const Icon(Icons.home, size: 30, color: Colors.white,),
              ),
            ),
          ],
        )
    );
  }
}
