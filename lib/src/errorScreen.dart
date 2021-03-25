import 'constants.dart';
import 'package:flutter/material.dart';
class ErrorScreen extends StatefulWidget {
  final String imageLink;
  ErrorScreen({Key key, @required this.imageLink}) : super(key: key);
  ErrorScreenState createState() => ErrorScreenState();
}
class ErrorScreenState extends State<ErrorScreen> {
  String imageUrl;
  @override
  void initState() {
    super.initState();
    imageUrl = widget.imageLink;
  }
  @override
  Widget build(BuildContext context){
    return  Scaffold(
      backgroundColor: mainColor,
      body: Center(
        child: new Stack(
          children: <Widget> [
            new Container(
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new NetworkImage(
                    imageUrl
                  ),
                  fit: BoxFit.cover
                ),
              ),
            ),
            new Center(child:
            new Column(
              mainAxisSize: MainAxisSize.min,
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
                  fontSize: stdFontSize,
                  fontFamily: dateFont
                ),
              )
            ]
          ))
        ]
      ))
    );
  }
}
