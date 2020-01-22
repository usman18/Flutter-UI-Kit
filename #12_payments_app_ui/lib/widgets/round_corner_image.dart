import 'package:flutter/material.dart';

import '../constants.dart';

class RoundCornerImage extends StatelessWidget {
  final String imageUrl;

  const RoundCornerImage({Key key, @required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(16)),
      child: Image.network(imageUrl,
        fit: BoxFit.cover,
        height: 60,
        width: 60,
      ),
    );
  }
}
