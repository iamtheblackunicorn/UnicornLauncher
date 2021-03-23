import 'errorScreen.dart';
import 'loadingScreen.dart';
import 'package:flutter/material.dart';
import 'package:device_apps/device_apps.dart';
import 'package:wallpaper_manager/wallpaper_manager.dart';

class HomeScreen extends StatefulWidget {
  HomeScreenState createState() => HomeScreenState();
}
class HomeScreenState extends State<HomeScreen> {
  Future<List<Application>> apps;
  @override
  void initState() {
    super.initState();
    apps = DeviceApps.getInstalledApplications(onlyAppsWithLaunchIntent: true, includeSystemApps: true);
  }
  @override
  Widget build(BuildContext context) {
    WallpaperManager wallpaperManager = WallpaperManager.getInstance(this);
    Drawable wallpaperDrawable = wallpaperManager.getDrawable();
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
              body:ListView.builder(
              itemCount: userApps.length,
              itemBuilder: (context, index) {
                String app = userApps[index].appName;
                return ListTile(
                  title: Text('$app'),
                );
              },
            )
          );
          }
        }
      }
    );
  }
}
