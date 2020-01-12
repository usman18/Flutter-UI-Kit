import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instagram_ui_redesign/screens/feed_screen.dart';
import 'package:instagram_ui_redesign/screens/profile_screen.dart';
import 'package:instagram_ui_redesign/screens/notifications_screen.dart';
import 'package:instagram_ui_redesign/screens/search_screen.dart';
import 'package:instagram_ui_redesign/widgets/fab.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentBottomTab = 0;

  List<Widget> pages = [FeedScreen(), SearchScreen(), NotificationsScreen(), ProfileScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(FontAwesomeIcons.camera,
          color: Colors.grey.shade800,
        ),
        title: Text("𝕴𝖓𝖘𝖙𝖆𝖌𝖗𝖆𝖒",
          style: TextStyle(
            fontSize: 22
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Icon(Icons.send,),
          ),
        ],
      ),
      body: pages[_currentBottomTab],
      floatingActionButton: InstagramFab(
        icon: Icons.add,
        onTap: (){},
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {

    Color getColor(int index) {
      return _currentBottomTab == index ? Theme.of(context).accentColor : Colors.grey.shade700;
    }

    void refreshUI(int currentTab) {
      setState(() {
        _currentBottomTab = currentTab;
      });
    }


    return Container(
      height: 56,
      child: BottomAppBar(
        elevation: 8,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(icon: Icon(Icons.home, color: getColor(0),), onPressed: (){
              refreshUI(0);
            }),
            IconButton(icon: Icon(Icons.search), color: getColor(1), onPressed: () {
              refreshUI(1);
            }),
            SizedBox(width: 12,),
            IconButton(icon: Icon(Icons.favorite_border, color: getColor(2),), onPressed: () {
              refreshUI(2);
            }),
            IconButton(icon: Icon(Icons.person_outline, color: getColor(3),), onPressed: () {
              refreshUI(3);
            }),
          ],
        ),
      ),
    );
  }


}
