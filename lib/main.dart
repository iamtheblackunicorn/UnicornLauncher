import 'src/constants.dart';
import 'src/apiHandler.dart';
import 'src/titleScreen.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: TitleView(
        apistorage: APIStorage(),
        wallpaperapi:WallpaperAPIStorage()
      )
    )
  );
}
