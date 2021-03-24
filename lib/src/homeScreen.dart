import 'constants.dart';
import 'apiHandler.dart';
import 'errorScreen.dart';
import 'loadingScreen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  final APIStorage apistorage;
  HomeScreen({Key key, @required this.apistorage}) : super(key: key);
  HomeScreenState createState() => HomeScreenState();
}
class HomeScreenState extends State<HomeScreen> {
  Future<Map<String, dynamic>> quotesMap;
  @override
  void initState() {
    super.initState();
    quotesMap = widget.apistorage.readCounter();
  }
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedTime = DateFormat('EEE d').format(now);
    String formattedDate = DateFormat('MMM Y').format(now);
    return FutureBuilder<Map<String, dynamic>>(
      future: quotesMap,
      builder: (BuildContext context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting){
          return LoadingScreen();
        }
        else {
          if (snapshot.hasError) {
            print(snapshot.error);
            return ErrorScreen();
          }
          else {
            Map<String, dynamic> quotes = snapshot.data;
            return Scaffold(
              body: new Stack(
                children: <Widget> [

                  new Container(
                    decoration: new BoxDecoration(
                      image: new DecorationImage(
                        image: new NetworkImage(
                          imageLink
                        ),
                        fit: BoxFit.cover
                      ),
                    ),
                  ),
                  new Padding(
                    padding: EdgeInsets.all(20),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget> [
                        new Padding(
                          padding: EdgeInsets.all(20),
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
                          padding: EdgeInsets.all(20),
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
                  new ListView.builder(
                    itemCount: quotes.length,
                    itemBuilder: (context, index) {
                      String key = quotes.keys.elementAt(index);
                      String quote = quotes[key];
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0)
                        ),
                        color: Color(0xFFFFFFFF),
                        margin: EdgeInsets.all(50),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget> [
                          new Padding(
                            padding: EdgeInsets.all(20),
                            child: new Text(
                              '$quote',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: quoteFont,
                                fontSize: quoteSize,
                                color: quoteColor
                              )
                            ),
                          ),
                          new Divider(
                            color: quoteColor,
                            thickness: 1
                          ),
                          new Padding(
                            padding: EdgeInsets.all(10),
                            child: new Text(
                              '$key',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: quoteFont,
                                fontSize: quoteSize,
                                color: quoteColor
                              )
                            )
                          ),
                        ]
                      )
                    );
                  },
                )
              ]
            ));
          }
        }
      }
    );
  }
}
