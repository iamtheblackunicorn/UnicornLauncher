import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

String appTitle = 'Unicorn Launcher';
Dio dio = Dio();
String quotesAPI = 'https://blckunicorn.art/assets/unicornlauncher/api/quotes.json';
String wallpapersAPI = 'https://blckunicorn.art/assets/unicornlauncher/api/wallpapers.json';
String defaultImage = 'https://raw.githubusercontent.com/iamtheblackunicorn/iamtheblackunicorn.github.io/main/assets/unicornlauncher/images/wallpaperSeven.jpg';

Color accentColor = Color(0xFFFFFFFF);
Color mainColor = Color(0xFF000000);
double stdFontSize = 20;
double miscScreenSpacing = 50;
double miscScreenIconSize = 150;
String quoteFont = 'Garamond';
String dateFont = 'Ostrich';
double quoteSize = 20;
double dateSize = 40;
double appNameSize = 20;
double appPadding = 15;
double defaultInterval = 300;
double blurRadius = 10.0;
double appIconSize = 35;
String errorAppMessage = 'Could not load apps!';
