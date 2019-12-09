import 'package:chat_app/pages/chats_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(ChatApp());

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xff22232A),
        accentColor: Color(0xff2489FF),
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: ChatsScreen(),
      bottomNavigationBar: _buildBottomNavigationBar(),
      floatingActionButton: FloatingActionButton(onPressed: (){},
        backgroundColor: Theme.of(context).accentColor,
        child: Icon(Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16, top: 18, bottom: 18),
      color: Color(0xff313340),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Icon(Icons.comment,),
          Icon(Icons.people_outline,
            color: Colors.grey,
          ),
          Icon(Icons.settings,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }


}




