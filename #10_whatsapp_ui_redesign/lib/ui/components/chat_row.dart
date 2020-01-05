import 'package:flutter/material.dart';
import 'package:whatsapp_ui_redesign/model/chat_model.dart';

class ChatRow extends StatelessWidget {
  final Chat chat;

  const ChatRow({Key key, @required this.chat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Stack(
        children: <Widget>[
          _buildProfilePic(context),
          Visibility(
            visible: chat.unseenCount > 0,
            child: Positioned(
              top: 2,
              right: 0,
              child: _buildBadge(context, chat.unseenCount.toString()),
            ),
          ),
        ],
      ),
      title: Row(
        children: <Widget>[
          Expanded(child: Text(chat.name)),
          Visibility(
            visible: chat.unseenCount > 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: CircleAvatar(
                radius: 3,
                backgroundColor: Theme.of(context).accentColor,
              ),
            ),
          ),
        ],
      ),
      subtitle: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              chat.message,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
          Text(chat.timestamp,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfilePic(BuildContext context) {

    String placeHolder = "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP._BF2jL6kA3q44G3Wa81SzAHaFG%26pid%3DApi&f=1";

    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Theme.of(context).accentColor,
        ),
      ),
      padding: EdgeInsets.all(2),
      child: CircleAvatar(
        backgroundImage: NetworkImage(chat.profilePicUrl ?? placeHolder,
        scale: 1
        ),
      ),
    );
  }

  Widget _buildBadge(BuildContext context, String count) {
    return Container(
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: CircleAvatar(
        backgroundColor: Theme.of(context).accentColor,
        radius: 7,
        child: Text(
          count,
          style: TextStyle(
            color: Colors.white,
            fontSize: 10,
          ),
        ),
      ),
    );
  }
}
