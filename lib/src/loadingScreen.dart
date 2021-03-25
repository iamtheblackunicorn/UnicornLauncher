import 'constants.dart';
import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';

class LoadingScreenScreen extends StatefulWidget {
  final String imageLink;
  LoadingScreen({Key key, @required this.imageLink}) : super(key: key);
  LoadingScreenState createState() => LoadingScreenState();
}
class LoadingScreenState extends State<LoadingScreen> {
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
            new Column(
              children: <Widget> [
                new SizedBox(
                  height: miscScreenSpacing
                ),
                new LoadingBouncingGrid.circle(
                  size: miscScreenIconSize,
                  backgroundColor: accentColor,
                )
              ]
            )
          ]
        )
      )
    );
  }
}
