import 'package:flutter/material.dart';

class SizeCard extends StatelessWidget {
  final String size;

  const SizeCard({Key key, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      margin: EdgeInsets.symmetric(horizontal: 8,),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Color(0xff11323B),
      ),
      child: Text(size,
        style: TextStyle(
          fontSize: 16,
          color: Colors.white,
        ),
      ),
    );
  }
}
