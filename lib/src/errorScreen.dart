import 'constants.dart';
import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return  Scaffold(
      appBar:AppBar(
        iconTheme: IconThemeData(
          color: accentColor,
        ),
        title: new Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Text(
              'ERROR!',
              style: TextStyle(
                color: accentColor,
                fontSize: stdFontSize
              ),
            ),
          ]
        ),
        backgroundColor: mainColor
      ),
      backgroundColor: mainColor,
      body: Center(
        child: Column(
          children: <Widget> [
            new SizedBox(
              height: miscScreenSpacing
            ),
            new Icon(
              Icons.warning,
              color: accentColor,
              size: miscScreenIconSize,
            ),
            new Text(
              'Could not load apps!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: accentColor,
                fontWeight: FontWeight.bold,
                fontSize: stdFontSize
              ),
            )
          ]
        )
      )
    );
  }
}
