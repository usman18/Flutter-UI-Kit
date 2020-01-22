import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payments_app_ui/screens/payments_screen.dart';
import 'constants.dart';

void main() {
  runApp(PaymentsApp());
}

class PaymentsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        accentColor: kPrimaryColor,
        fontFamily: 'Gilroy',
        sliderTheme: SliderThemeData(
          activeTrackColor: kPrimaryColor,
          thumbColor: kPrimaryColor,
          inactiveTrackColor: Colors.grey.shade200,
        ),
      ),
      home: PaymentsScreen(),
      debugShowCheckedModeBanner: false,
    );
  }

}
