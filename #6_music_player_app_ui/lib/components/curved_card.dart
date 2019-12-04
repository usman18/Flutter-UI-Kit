import 'package:flutter/material.dart';

class CurvedCard extends StatelessWidget {
  final Widget child;

  final double topLeft;
  final double topRight;
  final double bottomLeft;
  final double bottomRight;

  final Color color;

  const CurvedCard({this.child, this.topLeft = 0, this.topRight = 0, this.bottomLeft = 0, this.bottomRight = 0, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(topRight: Radius.circular(topRight),
          topLeft: Radius.circular(topLeft),
          bottomLeft: Radius.circular(bottomLeft),
          bottomRight: Radius.circular(bottomRight),
        )
      ),
      child: child,
    );
  }
}


