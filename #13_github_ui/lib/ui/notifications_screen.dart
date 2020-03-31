import 'package:flutter/material.dart';
import 'package:github_ui/providers/notification_provider.dart';
import 'package:github_ui/ui/profile_screen.dart';
import 'package:github_ui/ui/widgets/notification_widget.dart';
import 'package:github_ui/model/notification.dart';

import '../constants.dart';

class NotificationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
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
            Text("Inbox", style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),),
          ],
        ),
        actionsIconTheme: IconThemeData(
          color: kAccentColor,
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.filter_list), onPressed: () {}),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Card(
      margin: EdgeInsets.zero,
      child: ListView.builder(itemBuilder: (_, position) {
        var notification = NotificationProvider.notifications[position];
        return NotificationWidget(
          title: notification.title,
          description: notification.description,
          issue: notification.issue,
          timestamp: notification.timestamp,
          profilePic: notification.userProfilePic,
          notificationType: notification.notificationType,
        );
      },
        itemCount: NotificationProvider.notifications.length,
        shrinkWrap: true,
      )
    );
  }
}




