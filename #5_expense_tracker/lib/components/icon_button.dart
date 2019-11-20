import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final IconData icon;
  final Function onTap;

  ActionButton({this.onTap, this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16,),
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xff6F6D92), width: 0.3),
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: Color(0xff1B192F),
        ),
        child: Icon(icon, color: Color(0xff5643D5),),
      ),
    );
  }
}
