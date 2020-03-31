import 'package:flutter/material.dart';
import 'package:github_ui/ui/notifications_screen.dart';
import 'package:github_ui/ui/search_screen.dart';

import '../constants.dart';
import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentPage = 0;

  List<Widget> pages = [
    HomeScreen(),
    NotificationsScreen(),
    SearchScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _buildBottomNavigationBar(),
      body: pages[currentPage],
    );
  }


  Widget _buildBottomNavigationBar() {

    return BottomNavigationBar(
      selectedItemColor: kAccentColor,
      items: [
      BottomNavigationBarItem(icon: Icon(Icons.home, color: Colors.grey.shade600,), title: Text("Home"),
      activeIcon: Icon(Icons.home, color: kAccentColor,)
      ),
      BottomNavigationBarItem(icon: Icon(Icons.notifications_none, color: Colors.grey.shade600,), title: Text("Notifications"),
      activeIcon: Icon(Icons.notifications, color: kAccentColor,)
      ),
      BottomNavigationBarItem(icon: Icon(Icons.search, color: Colors.grey.shade600,), title: Text("Search",),
      activeIcon: Icon(Icons.search, color: kAccentColor,),
      ),
    ],
      currentIndex: currentPage,
      onTap: (int newSelected) {
        setState(() {
          currentPage = newSelected;
        });
      },
    );

  }

}

