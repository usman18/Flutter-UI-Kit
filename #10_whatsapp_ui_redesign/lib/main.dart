import 'package:flutter/material.dart';
import 'package:whatsapp_ui_redesign/ui/pages/home_screen.dart';

void main() => runApp(WhatsappUI());

class WhatsappUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        accentColor: Colors.greenAccent.shade700,
      ),
      initialRoute: '/',
      routes: {
        '/' : (_) => HomeScreen(),
      },
    );
  }
}
