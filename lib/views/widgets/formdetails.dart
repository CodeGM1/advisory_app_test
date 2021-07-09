import 'package:advisory_app_test/constants/colors.dart';
import 'package:advisory_app_test/constants/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WidgetFormDetails extends StatefulWidget {

  final String type;
  final String? headerText;
  final TextEditingController? userControl;
  final TextEditingController? passControl;

  WidgetFormDetails({Key? key, required this.type, this.headerText, this.userControl, this.passControl}) : super(key: key);

  @override
  _WidgetFormDetailsState createState() => _WidgetFormDetailsState();
}

class _WidgetFormDetailsState extends State<WidgetFormDetails> {

  TextEditingController userControl = TextEditingController();
  TextEditingController passControl = TextEditingController();
  bool _pwHide = true;


  void dispose(){
    userControl.dispose();
    passControl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final String headerText = widget.headerText as String;

    switch(widget.type){
      case 'normal':
        return _buildTextFieldNormalWidget(headerText);
      case 'password':
        return _buildTextFieldPasswordWidget(headerText);
      default:
        return Container();
    }
  }

  Widget _buildTextFieldNormalWidget(String header){

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(header, style: fontNormalStyle),
        const SizedBox(height:5),
        SizedBox(
          height: 38,
          child: TextFormField(
              style: TextStyle(fontFamily: 'Proxima Nova', fontSize: 20, fontWeight: FontWeight.w500),
              scrollPadding: EdgeInsets.zero,
              inputFormatters: [LengthLimitingTextInputFormatter(20)],
              controller: userControl,
              cursorHeight: 22,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(top:10,left:8,right:8,),
                fillColor: Colors.white,
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: const BorderSide(
                    color: Colors.black,
                    width: 1.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: const BorderSide(
                    color: Colors.black,
                    width: 1.0,
                  ),
                ),
              )
          ),
        )
      ],
    );
  }

  Widget _buildTextFieldPasswordWidget(String header){

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(header, style: fontNormalStyle),
        const SizedBox(height:5),
        SizedBox(
          height: 38,
          child: TextFormField(
            style: TextStyle(fontFamily: 'Proxima Nova', fontSize: 20,letterSpacing: _pwHide? 3 : 0, fontWeight: FontWeight.w500),
            obscureText: _pwHide,
            scrollPadding: EdgeInsets.zero,
            controller: passControl,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(top:0,left:10),
              suffixIcon: IconButton(
                icon: Icon(_pwHide? Icons.visibility:Icons.visibility_off),
                onPressed: (){
                  setState(() {
                    _pwHide = !_pwHide;
                  });
                },
              ),
              fillColor: Colors.white,
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: const BorderSide(
                  color: Colors.black,
                  width: 1.0,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: const BorderSide(
                  color: Colors.black,
                  width: 1.0,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

}
