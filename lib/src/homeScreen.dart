import 'errorScreen.dart';
import 'loadingScreen.dart';
import 'package:flutter/material.dart';
import 'package:device_apps/device_apps.dart';

class HomeScreen extends StatefulWidget {
  HomeScreenState createState() => HomeScreenState();
}
class HomeScreenState extends State<HomeScreen> {
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
            return Scaffold(
              body: new Stack(
                children: <Widget> [

                new Container(
                  decoration: new BoxDecoration(
                    image: new DecorationImage(
                      image: new NetworkImage(
                        "https://iamtheblackunicorn.github.io/assets/images/posts/postEight.jpg"
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
                  var appIcon = Image.memory((app as ApplicationWithIcon).icon, width: 32);
                  return ListTile(
                    leading: appIcon,
                    title: Text('$clearName'),
                    onTap: () async {
                      app.openApp();
                      //print(appIcon.runtimeType);
                    },
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
