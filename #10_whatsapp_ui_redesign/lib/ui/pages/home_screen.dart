import 'package:flutter/material.dart';
import 'package:whatsapp_ui_redesign/ui/components/tab.dart';
import 'package:whatsapp_ui_redesign/ui/pages/calls_screen.dart';
import 'package:whatsapp_ui_redesign/ui/pages/chats_screen.dart';
import 'package:whatsapp_ui_redesign/ui/pages/status_screen.dart';

var activeTabTextStyle = TextStyle(
  fontSize: 16,
);

var inactiveTabTextStyle = TextStyle(
  fontSize: 13,
);



class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{
  TabController _tabController;
  int _currentTab = 1;
  GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.index = 1;

    _tabController.addListener(() {
      setState(() {
        _currentTab = _tabController.index;
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    print('Current index is $_currentTab');

    return Scaffold(
      key: _key,
      appBar: AppBar(
        title: Text("Whatsapp",
        ),
        bottom: TabBar(
          labelStyle: activeTabTextStyle,
          labelColor: Colors.black,
          unselectedLabelStyle: inactiveTabTextStyle,
          unselectedLabelColor: Colors.blueGrey,
          tabs: [
            TabWidget(label: "Status", unreadCount: 0,),
            TabWidget(label: "Chats", unreadCount: 20,),
            TabWidget(label: "Calls", unreadCount: 5,),
          ],
          controller: _tabController,
        ),
      ),
      body: TabBarView(children: [
        StatusScreen(),
        ChatsScreen(),
        CallsScreen(),
      ],
        controller: _tabController,
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
      },
        foregroundColor: Colors.white,
        child: Icon(Icons.comment,),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }


  Widget _buildBottomNavigationBar() {
    return BottomAppBar(
      notchMargin: 6,
      elevation: 16,
      shape: CircularNotchedRectangle(),
      child: Container(
        height: 56,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.photo_camera,
                  color: Colors.grey,
                ),
                Text("Add story",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            InkWell(
              onTap: () {
                _showBottomSheet(context);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.menu,
                    color: Colors.grey,
                  ),
                  Text("Menu",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {

    _key.currentState.showBottomSheet((context) {
      return Container(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.person_pin, color: Colors.blueGrey,),
              title: Text("My Profile", style: TextStyle(color: Colors.blueGrey),),
            ),
            ListTile(
              leading: Icon(Icons.chat, color: Colors.blueGrey,),
              title: Text("New Chat", style: TextStyle(color: Colors.blueGrey),),
            ),
            ListTile(
              leading: Icon(Icons.group, color: Colors.blueGrey,),
              title: Text("New Group Chat", style: TextStyle(color: Colors.blueGrey),),
            ),
            ListTile(
              leading: Icon(Icons.star, color: Colors.blueGrey,),
              title: Text("Starred Messages", style: TextStyle(color: Colors.blueGrey),),
            ),
          ],
        ),
      );
    });

  }



}










