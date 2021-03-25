import 'dart:ui';
import 'constants.dart';
import 'errorScreen.dart';
import 'loadingScreen.dart';
import 'package:flutter/material.dart';
import 'package:device_apps/device_apps.dart';

class AppScreen extends StatefulWidget {
  final String imageLink;
  AppScreen({Key key, @required this.imageLink}) : super(key: key);
  AppScreenState createState() => AppScreenState();
}
class AppScreenState extends State<AppScreen> {
  Future<List<Application>> apps;
  String imageUrl;
  @override
  void initState() {
    super.initState();
    imageUrl = widget.imageLink;
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
          return LoadingScreen(imageLink: imageUrl);
        }
        else {
          if (snapshot.hasError) {
            return ErrorScreen(imageLink: imageUrl);
          }
          else {
            List<Application> userApps = snapshot.data;
            return Scaffold(
              body: new Stack(
                children: <Widget> [

                new Container(
                  constraints: BoxConstraints.expand(),
                  decoration: new BoxDecoration(
                    image: new DecorationImage(
                      image: new NetworkImage(
                        imageUrl,
                      ),
                      fit: BoxFit.cover
                    ),
                  ),
                ),
                new ListView.builder(
                itemCount: userApps.length,
                itemBuilder: (context, index) {
                  Application app = userApps[index];
                  String clearName = app.appName;
                  String packageName = app.packageName;
                  var appIcon = Image.memory((app as ApplicationWithIcon).icon, width: appIconSize);
                  return ListTile(
                    leading: appIcon,
                    title: new Text(
                      '$clearName',
                      style: new TextStyle(
                        fontSize: appNameSize,
                        fontFamily: dateFont,
                        color: accentColor
                      )
                    ),
                    onTap: (){
                      app.openApp();
                    }
                  );
                },
              ),
            ]));
          }
        }
      }
    );
  }
}
