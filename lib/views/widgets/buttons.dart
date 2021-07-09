import 'package:advisory_app_test/constants/colors.dart';
import 'package:advisory_app_test/constants/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WidgetButtons extends StatefulWidget {

  final String type;
  final String buttonText;
  final VoidCallback onPressedButton;

  WidgetButtons({Key? key, required this.type, this.buttonText = '', required this.onPressedButton}) : super(key: key);

  @override
  _WidgetButtonsState createState() => _WidgetButtonsState();
}

class _WidgetButtonsState extends State<WidgetButtons> {
  @override
  Widget build(BuildContext context) {
    switch(widget.type){
      case 'normal':
        return _buildNormalButton();
      case 'back':
        return _buildBackButton();
      default:
        return Container();
    }
  }

  Widget _buildNormalButton(){

    return Container(
        child: ElevatedButton(
          child: Text(widget.buttonText, style: fontNormalStyle),
          onPressed: widget.onPressedButton,
          style: ElevatedButton.styleFrom(
            primary: Colors.white12,
            padding: const EdgeInsets.all(20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            textStyle: fontNormalStyle,
          ),
        ),

      /*MaterialButton(
        highlightColor: Colors.red,
        onPressed: () {},
        child: const Text('Login using email', style: fontNormalStyle,),
      )*/

    );
  }

  Widget _buildBackButton(){

    return IconButton(
      icon: Icon(Icons.arrow_back_outlined, color: Colors.white, size: 30),
      onPressed: widget.onPressedButton,
    );

    /*ElevatedButton(
        child: Row(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Icon(Icons.arrow_back_outlined, color: mainFontColor, size: 30),
            *//*const SizedBox(width:10),
            Text(widget.buttonText, style: fontNormalStyle),*//*
          ],
        ),
        onPressed: widget.onPressedButton,
        style: ElevatedButton.styleFrom(
          primary: Colors.white70,
          padding: const EdgeInsets.only(top:5, bottom:5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          textStyle: fontNormalStyle,
        ),
      )*/

  }

}
