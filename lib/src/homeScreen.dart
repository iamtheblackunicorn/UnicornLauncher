import 'dart:math';
import 'constants.dart';
import 'apiHandler.dart';
import 'errorScreen.dart';
import 'loadingScreen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  final APIStorage apistorage;
  final String imageLink;
  HomeScreen({Key key, @required this.apistorage, @required this.imageLink}) : super(key: key);
  HomeScreenState createState() => HomeScreenState();
}
class HomeScreenState extends State<HomeScreen> {
  Future<Map<String, dynamic>> quotesMap;
  String imageUrl;
  @override
  void initState() {
    super.initState();
    quotesMap = widget.apistorage.readCounter();
    imageUrl = widget.imageLink;
  }
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedTime = DateFormat('$dayDay').format(now);
    String formattedDate = DateFormat('$monthYear').format(now);
    return FutureBuilder<Map<String, dynamic>>(
      future: quotesMap,
      builder: (BuildContext context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting){
          return LoadingScreen(imageLink: imageUrl);
        }
        else {
          if (snapshot.hasError) {
            print(snapshot.error);
            return ErrorScreen(imageLink: imageUrl);
          }
          else {
            Map<String, dynamic> quotes = snapshot.data;
            int quoteLength = quotes.length;
            int randomNumber = Random().nextInt(quoteLength);
            String key = quotes.keys.elementAt(randomNumber);
            String quote = quotes[key];
            return Scaffold(
              body: new Stack(
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
                    new SizedBox(height: miscScreenSpacing),
                    new Padding(
                      padding: EdgeInsets.all(stdPadding),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget> [
                          new Padding(
                            padding: EdgeInsets.all(stdPadding),
                            child: new Text(
                              '$formattedTime',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: dateFont,
                                fontSize: dateSize,
                                color: accentColor
                              )
                            ),
                          ),
                          new Padding(
                            padding: EdgeInsets.all(stdPadding),
                            child: new Text(
                              '$formattedDate',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: dateFont,
                                fontSize: dateSize,
                                color: accentColor
                              )
                            )
                          )
                        ]
                      )
                    ),
                    new SizedBox(height: spacerHeight),
                  new SizedBox(
                    height: 300,
                    child: new Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(stdRounding)
                      ),
                      color: mainColor,
                      margin: EdgeInsets.all(miscScreenSpacing),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget> [
                          new Padding(
                            padding: EdgeInsets.all(stdPadding),
                            child: new Text(
                              '$quote',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: quoteFont,
                                fontSize: quoteSize,
                                color: accentColor
                              )
                            ),
                          ),
                          new Divider(
                            color: accentColor,
                            thickness: stdThickness
                          ),
                          new Padding(
                            padding: EdgeInsets.all(minPadding),
                            child: new Text(
                              '$key',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: quoteFont,
                                fontSize: quoteSize,
                                color: accentColor
                              )
                            )
                          ),
                        ]
                      )
                    )
                  )])
                ]
              )
            );
          }
        }
      }
    );
  }
}
