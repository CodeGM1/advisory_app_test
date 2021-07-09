import 'package:advisory_app_test/constants/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:advisory_app_test/constants/colors.dart';

class WidgetAppBar extends StatefulWidget {
  WidgetAppBar({Key? key}) : super(key: key);

  @override
  _WidgetAppBarState createState() => _WidgetAppBarState();
}

class _WidgetAppBarState extends State<WidgetAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgBlueColor,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child:
              Container()
          ),
          const Expanded(
            flex: 5,
            child: Text('AdvisoryApps Demo', style: fontHeaderStyle),
          )
        ],
      )

    );
  }
}
