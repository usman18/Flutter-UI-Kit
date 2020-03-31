import 'package:flutter/material.dart';
import 'package:github_ui/ui/profile_screen.dart';

import '../constants.dart';

const kTextStyle = TextStyle(
  fontSize: 16,
);

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        elevation: 0,
        title: Row(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => ProfileScreen()));
              },
              child: CircleAvatar(
                radius: 15,
                backgroundImage: NetworkImage(kProfilePic),
              ),
            ),
            SizedBox(width: 16,),
            Text("Home", style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),),
          ],
        ),
        actionsIconTheme: IconThemeData(
          color: kAccentColor,
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add_circle_outline), onPressed: () {}),
        ],
      ),
      body: _buildBody(),
    );
  }



  Widget _buildBody() {

    Widget buildLabel(String label, IconData icon, Color color) {
      return ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          child: Container(
            height: 30,
            width: 30,
            color: color,
            child: Icon(icon, size: 20 , color: Colors.white,),
          ),
        ),
        title: Text(label,
          style: kTextStyle,
        ),
      );
    }


    return Card(
      margin: EdgeInsets.zero,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text("My Work", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
          ),
          SizedBox(height: 12,),
          buildLabel("Issues", Icons.warning, Colors.green.shade500),
          buildLabel("Pull Requests", Icons.call_merge, Colors.indigoAccent),
          buildLabel("Repositories", Icons.book, Colors.purple),
          buildLabel("Organizations", Icons.people, Colors.deepOrange),
        ],
      ),
    );

  }



}
