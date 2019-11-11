import 'package:flutter/material.dart';

class FeatureRow extends StatelessWidget {
  final String feature;
  final IconData icon;

  const FeatureRow({Key key, this.feature, this.icon}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Icon(this.icon, color: Color(0xff799271),),
          SizedBox(width: 8,),
          Text(feature, style: TextStyle(color: Colors.white, fontSize: 14,),),
        ],
      ),
    );
  }
}
