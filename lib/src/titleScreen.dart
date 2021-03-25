import 'homeScreen.dart';
import 'appScreen.dart';
import 'apiHandler.dart';
import 'package:flutter/material.dart';
class TitleView extends StatefulWidget {
  final APIStorage apistorage;
  final WallpaperAPIStorage wallpaperapi;
  TitleView({Key key, @required this.apistorage, @required this.wallpaperapi}) : super(key: key);
  @override
  TitleViewState createState() => TitleViewState();
}
class TitleViewState extends State<TitleView> {
  PageController pageController = PageController(initialPage: 0,);
  Future<Map<String, dynamic> myWallpapers;
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
    myWallpapers = widget.wallpaperapi.readCounter();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: myWallpapers,
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
            Map<String, dynamic> wallpapers = snapshot.data;
            int wallpapersLength = wallpapers.length;
            int randomNumber = Random().nextInt(wallpapersLength);
            String key = wallpapers.keys.elementAt(randomNumber);
            String wallpaper = wallpapers[key];
            return PageView(
              controller: pageController,
              children: [
                HomeScreen(apistorage: APIStorage(), imageLink: wallpaper),
                AppScreen(imageLink: wallpaper),
              ],
            );
          }
        }
      }
    )
  }
}
