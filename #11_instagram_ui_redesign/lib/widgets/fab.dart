import 'package:flutter/material.dart';

class InstagramFab extends StatelessWidget {
  final IconData icon;
  final Function onTap;

  const InstagramFab({Key key, @required this.icon, @required this.onTap}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(56)),
      ),
      elevation: 8,
      child: Container(
        height: 56,
        width: 56,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [Color(0xffC45471), Color(0xffE77854),],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: IconButton(icon: Icon(icon,
          size: 30,
          color: Colors.white,
        ), onPressed: onTap,)
      ),
    );
  }
}
