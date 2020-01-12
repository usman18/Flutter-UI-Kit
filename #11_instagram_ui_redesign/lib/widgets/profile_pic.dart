import 'package:flutter/material.dart';

class ProfilePic extends StatelessWidget {
  final String profilePic;
  final double radius;

  const ProfilePic({Key key, this.profilePic, this.radius}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Theme.of(context).accentColor),
      ),
      child: CircleAvatar(
        backgroundImage: NetworkImage(profilePic),
        radius: radius ?? 16,
      ),
    );
  }
}
