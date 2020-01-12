import 'package:flutter/material.dart';
import 'package:instagram_ui_redesign/screens/home_screen.dart';

void main() => runApp(InstagramApp());

class InstagramApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
        accentColor: Color(0xffDB5867),
      ),
      home: HomeScreen(),
    );
  }
}


