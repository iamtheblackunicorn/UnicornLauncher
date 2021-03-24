import 'homeScreen.dart';
import 'appScreen.dart';
import 'apiHandler.dart';
import 'package:flutter/material.dart';
class TitleView extends StatefulWidget {
  @override
  TitleViewState createState() => TitleViewState();
}
class TitleViewState extends State<TitleView> {
  PageController pageController = PageController(initialPage: 0,);
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        HomeScreen(apistorage: APIStorage()),
        AppScreen(),
      ],
    );
  }
}
