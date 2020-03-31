import 'package:flutter/material.dart';
import 'package:github_ui/constants.dart';
import 'package:github_ui/ui/main_screen.dart';
import 'package:github_ui/ui/profile_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        accentColor: kAccentColor,
      ),
      home: MainScreen(),
    );

  }

}