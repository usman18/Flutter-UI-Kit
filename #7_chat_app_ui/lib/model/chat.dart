import 'package:chat_app/model/message.dart';

class Chat {

  String userName;
  String profilePic;
  int unreadMessages;
  String timestamp;
  List<Message> messages;
  bool isActive;

  Chat({this.userName, this.profilePic, this.unreadMessages, this.timestamp, this.messages, this.isActive});


}