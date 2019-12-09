
import 'package:chat_app/model/chat.dart';

import 'model/message.dart';

class ChatsProvider {

  static final List<Chat> chats = [
    Chat(userName: "Rayhaan Bashir", timestamp: "1:50", unreadMessages: 3, isActive: true,
      messages: [
        Message(id: 0, uid: "ME", message: "Cool, I'll pass on the details hopefully it will go through the database. Btw how's your family?"),
        Message(id: 1, uid: "OTHER", message: "Good night. Thank you"),
        Message(id: 2, uid: "OTHER", message: "Yoo bro. I need a favour"),
        Message(id: 3, uid: "ME", message: "Yoo How's it going ?"),
        Message(id: 4, uid: "ME", message: "Been a while"),
        Message(id: 5, uid: "ME", message: "Def. Whats up ? "),
      ],
    ),

    Chat(userName: "Christof John", timestamp: "1:23", unreadMessages: 3, isActive: false,
      messages: [
        Message(id: 0, uid: "ME", message: "Cool, I'll pass on the details hopefully it will go through the database. Btw how's your family?"),
        Message(id: 1, uid: "OTHER", message: "Good night. Thank you"),
        Message(id: 3, uid: "ME", message: "Yoo How's it going ?"),
        Message(id: 4, uid: "ME", message: "Been a while"),
        Message(id: 5, uid: "ME", message: "Def. Whats up ?"),
        Message(id: 2, uid: "OTHER", message: "Yoo bro. I need a favour"),
      ],
    ),

    Chat(userName: "Aiman Khan", timestamp: "1:05", unreadMessages: 0, isActive: true,
      messages: [
        Message(id: 0, uid: "ME", message: "Cool, I'll pass on the details hopefully it will go through the database. Btw how's your family?"),
        Message(id: 1, uid: "OTHER", message: "Good night. Thank you"),
        Message(id: 2, uid: "OTHER", message: "Yoo bro. I need a favour"),
        Message(id: 5, uid: "ME", message: "Def. Whats up ? "),
        Message(id: 3, uid: "ME", message: "Yoo How's it going ?"),
        Message(id: 4, uid: "ME", message: "Been a while"),
      ],
    ),
  ];

}