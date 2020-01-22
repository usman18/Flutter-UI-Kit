import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final IconData icon;
  final Function onTap;

  const RoundButton({Key key, @required this.icon, @required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(onPressed: onTap,
      child: CircleAvatar(
        backgroundColor: Colors.grey.shade300,
        foregroundColor: Colors.grey,
        child: Icon(icon),
      ),
    );
  }
}
