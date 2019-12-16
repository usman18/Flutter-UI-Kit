import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  final String title;
  final IconData icon;
  final String subTitle;

  const Label({Key key, this.title, this.icon, this.subTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(title,
          style: TextStyle(
            fontSize: 26
          ),
        ),
        Row(
          children: <Widget>[
            Icon(icon,
              size: 15,
            ),
            SizedBox(width: 4,),
            Text(subTitle,
              style: TextStyle(
                fontSize: 12,
              ),
            )
          ],
        )
      ],
    );
  }
}

