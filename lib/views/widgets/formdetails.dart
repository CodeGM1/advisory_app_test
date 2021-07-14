import 'package:advisory_app_test/constants/colors.dart';
import 'package:advisory_app_test/constants/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WidgetFormDetails extends StatefulWidget {

  final String type;
  final String? headerText;
  final String? hintText;
  final TextEditingController? textControl;

  WidgetFormDetails({Key? key, required this.type, this.headerText, this.hintText, this.textControl}) : super(key: key);

  @override
  _WidgetFormDetailsState createState() => _WidgetFormDetailsState();
}

class _WidgetFormDetailsState extends State<WidgetFormDetails> {

  bool _pwHide = true;

  @override
  Widget build(BuildContext context) {

    switch(widget.type){
      case 'normal':
        return _buildTextFieldNormalWidget(widget.headerText as String);
      case 'password':
        return _buildTextFieldPasswordWidget(widget.headerText as String);
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
              style: const TextStyle(fontFamily: 'Proxima Nova', fontSize: 20, fontWeight: FontWeight.w500),
              scrollPadding: EdgeInsets.zero,
              inputFormatters: [LengthLimitingTextInputFormatter(32)],
              controller: widget.textControl,
              cursorHeight: 22,

              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: fontHintStyle,
                contentPadding: const EdgeInsets.only(top:10,left:8,right:8,),
                fillColor: Colors.white,
                filled: true,
                prefixIcon: const Icon(Icons.account_circle, color: Colors.black45,size: 20,),
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
            style: const TextStyle(fontFamily: 'Proxima Nova', fontSize: 20, fontWeight: FontWeight.w500),
            obscureText: _pwHide,
            scrollPadding: EdgeInsets.zero,
            inputFormatters: [LengthLimitingTextInputFormatter(32)],
            controller: widget.textControl,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(top:0,left:10),
              hintText: widget.hintText,
              hintStyle: fontHintStyle,
              suffixIcon: IconButton(
                icon: Icon(_pwHide? Icons.visibility:Icons.visibility_off),
                onPressed: (){
                  setState(() {
                    _pwHide = !_pwHide;
                  });
                },
              ),
              prefixIcon: const Icon(Icons.lock, color: Colors.black45,size: 20,),
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
