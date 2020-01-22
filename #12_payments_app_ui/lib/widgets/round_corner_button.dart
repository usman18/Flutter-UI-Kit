import 'package:flutter/material.dart';

class RoundCornerButton extends StatelessWidget {
  final String text;
  final Function onTap;

  const RoundCornerButton({Key key, @required this.text, @required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 18),
        child: Text(text,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: Colors.grey.shade600,
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: Colors.grey.shade300
        ),
      ),
    );
  }
}
