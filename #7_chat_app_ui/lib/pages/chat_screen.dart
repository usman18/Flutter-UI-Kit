import 'package:chat_app/model/chat.dart';
import 'package:chat_app/model/message.dart';
import 'package:flutter/material.dart';

import '../chats_provider.dart';

class ChatScreen extends StatelessWidget {

  final Chat chat;

  ChatScreen(this.chat);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: _buildAppBar(context),
      body: ListView.builder(itemBuilder: (_, position){
        Message message = chat.messages[position % chat.messages.length];

        if (message.uid == "ME") {
          return _buildMyMessage(context, message.message);
        } else {
          return _buildReceivedMessage(context, message.message);
        }

      },
        itemCount: chat.messages.length,
        physics: BouncingScrollPhysics(),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16),
          child: Icon(Icons.phone,
            color: Theme.of(context).accentColor,
          ),
        )
      ],
      title: Row(
        children: <Widget>[
          Stack(
            children: <Widget>[
              CircleAvatar(
                backgroundImage: NetworkImage(chat.profilePic),
                radius: 20,
              ),
              Positioned(
                bottom: 2,
                right: 0,
                child: CircleAvatar(
                  radius: 4,
                  backgroundColor: chat.isActive ? Colors.green[700] : Colors.transparent,
                ),
              )
            ],
          ),
          SizedBox(width: 8,),
          Expanded(
            child: Text(chat.userName,
              maxLines: 1,
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

        ],
      ),
    );
  }


  Widget _buildMyMessage(context, String msg) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).accentColor,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.65,
          ),
          child: Text(msg,
            style: TextStyle(
              fontSize: 15
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildReceivedMessage(BuildContext context, String msg) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Expanded(child: Container(
          child: Text(""),
        )),
        Container(
          decoration: BoxDecoration(
            color: Color(0xff535875),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.65,
          ),
          child: Text(msg,
            style: TextStyle(
            fontSize: 15
            ),
          ),
        ),
      ],
    );
  }
  
  
  
  Widget _buildBottomNavigationBar(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 18, top: 12),
      padding: EdgeInsets.only(left: 16),
      decoration: BoxDecoration(
        color: Color(0xff313244),
        borderRadius: BorderRadiusDirectional.horizontal(start: Radius.circular(56), end: Radius.circular(56)),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Type your message',
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  )
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.attach_file,
              color: Colors.grey,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(2.0),
            child: FloatingActionButton(onPressed: (){},
              backgroundColor: Theme.of(context).accentColor,
              child: Icon(Icons.send,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
  




}
