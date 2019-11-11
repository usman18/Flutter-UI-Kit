import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  final String label;
  final Color color;


  Label({this.label, this.color = Colors.amber});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 6),
      child: Text(label, style: TextStyle(
          color: Colors.white,
          fontSize: 12,
        ),
        textAlign: TextAlign.center,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
