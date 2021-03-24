import 'constants.dart';
import 'errorScreen.dart';
import 'loadingScreen.dart';
import 'package:flutter/material.dart';
import 'package:device_apps/device_apps.dart';

class AppScreen extends StatefulWidget {
  AppScreenState createState() => AppScreenState();
}
class AppScreenState extends State<AppScreen> {
  Future<List<Application>> apps;
  @override
  void initState() {
    super.initState();
    apps = DeviceApps.getInstalledApplications(
      onlyAppsWithLaunchIntent: true,
      includeSystemApps: true,
      includeAppIcons: true
    );
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Application>>(
      future: apps,
      builder: (BuildContext context, AsyncSnapshot<List<Application>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting){
          return LoadingScreen();
        }
        else {
          if (snapshot.hasError) {
            return ErrorScreen();
          }
          else {
            List<Application> userApps = snapshot.data;
            int rowNumber = userApps.length~/4;
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
                new ListView.builder(
                itemCount: rowNumber,
                itemBuilder: (context, index) {
                  Application appOne = userApps[index];
                  String clearNameOne = appOne.appName;
                  String packageNameOne = appOne.packageName;
                  var appIconOne = Image.memory((appOne as ApplicationWithIcon).icon, width: 32);

                  int newIndexTwo = index + 1;
                  Application appTwo = userApps[newIndexTwo];
                  String clearNameTwo = appTwo.appName;
                  String packageNameTwo = appTwo.packageName;
                  var appIconTwo = Image.memory((appTwo as ApplicationWithIcon).icon, width: 32);

                  int newIndexThree = index + 2;
                  Application appThree = userApps[newIndexThree];
                  String clearNameThree = appThree.appName;
                  String packageNameThree = appThree.packageName;
                  var appIconThree = Image.memory((appThree as ApplicationWithIcon).icon, width: 32);

                  int newIndexFour = index + 3;
                  Application appFour = userApps[newIndexFour];
                  String clearNameFour = appFour.appName;
                  String packageNameFour = appFour.packageName;
                  var appIconFour = Image.memory((appFour as ApplicationWithIcon).icon, width: 32);

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget> [

                      new Padding(
                        padding: EdgeInsets.all(appPadding),
                        child: new Column(
                          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget> [
                          appIconOne,
                            new Text(
                              '$clearNameOne',
                              style: TextStyle(
                                fontSize: appNameSize,
                                fontFamily: dateFont,
                                color: accentColor
                              )
                            )
                          ]
                        )
                      ),
                      new Padding(
                        padding: EdgeInsets.all(appPadding),
                        child: new Column(
                          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget> [
                          appIconTwo,
                            new Text(
                              '$clearNameTwo',
                              style: TextStyle(
                                fontSize: appNameSize,
                                fontFamily: dateFont,
                                color: accentColor
                              )
                            )
                          ]
                        )
                      ),
                      new Padding(
                        padding: EdgeInsets.all(appPadding),
                        child: new Column(
                          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget> [
                          appIconThree,
                            new Text(
                              '$clearNameThree',
                              style: TextStyle(
                                fontSize: appNameSize,
                                fontFamily: dateFont,
                                color: accentColor
                              )
                            )
                          ]
                        )
                      ),
                      new Padding(
                        padding: EdgeInsets.all(appPadding),
                        child: new Column(
                          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget> [
                          appIconFour,
                            new Text(
                              '$clearNameFour',
                              style: TextStyle(
                                fontSize: appNameSize,
                                fontFamily: dateFont,
                                color: accentColor
                              )
                            )
                          ]
                        )
                      ),

                    ]
                  );

                },
              )
            ]));
          }
        }
      }
    );
  }
}
