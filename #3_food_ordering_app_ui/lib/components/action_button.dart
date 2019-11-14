import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Function onTap;

  ActionButton({this.icon, this.iconColor = Colors.white, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap == null ? () {} : onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          borderRadius: BorderRadius.all(Radius.circular(10,))
        ),
        padding: EdgeInsets.all(8),
        child: Icon(this.icon, color: iconColor,),
      ),
    );
  }
}
