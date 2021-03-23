import 'src/homeScreen.dart';
import 'src/constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: HomeScreen()
    )
  );
}
