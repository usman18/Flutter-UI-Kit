import 'package:flutter/material.dart';
import 'package:whatsapp_ui_redesign/ui/components/chat_row.dart';

import '../../chats_provider.dart';

class ChatsScreen extends StatelessWidget {
  final ChatsProvider _provider = ChatsProvider();

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: <Widget>[
        SizedBox(height: 8,),
        _buildSearchField(),
        Column(
          children: _provider.chats.map((chat){
            return ChatRow(chat: chat);
          }).toList(),
        ),
      ],
    );
  }


  Widget _buildSearchField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4),
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.blueGrey[50],
        borderRadius: BorderRadius.all(Radius.circular(4),),
      ),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search,
            size: 20,
          ),
          labelText: "Search",
          labelStyle: TextStyle(
            fontSize: 14,
          ),
          contentPadding: EdgeInsets.zero,
        ),
      ),
    );
  }

}
