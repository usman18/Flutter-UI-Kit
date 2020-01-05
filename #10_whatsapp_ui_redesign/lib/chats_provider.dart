import 'model/chat_model.dart';

class ChatsProvider {
  int chatIndex = 0;

  final List<Chat> chats = [
    Chat(
        name: "Christina Gomez",
        message: "Hey how are you doing?",
        unseenCount: 2,
        timestamp: "Just Now"),
    Chat(
        name: "Selena Andres",
        message: "Still waiting for him...?",
        unseenCount: 5,
        timestamp: "Just Now"),
    Chat(name: "Jackie Essien", message: "Hello!", unseenCount: 0, timestamp: "30 minutes ago"),
    Chat(
        name: "Appiah Cynthia",
        message: "That was all tho...",
        unseenCount: 12,
        timestamp: "50 minutes ago"),
    Chat(
        name: "Marvellous Joseph",
        message: "Africa Foresight G...",
        unseenCount: 2,
        timestamp: "56 minutes ago"),
    Chat(
        name: "Christina Gomez",
        message: "Hey how are you doing?",
        unseenCount: 2,
        timestamp: "Just Now"),
    Chat(
        name: "Selena Andres",
        message: "Still waiting for him...?",
        unseenCount: 5,
        timestamp: "Just Now"),
    Chat(name: "Jackie Essien", message: "Hello!", unseenCount: 0, timestamp: "30 minutes ago"),
    Chat(
        name: "Appiah Cynthia",
        message: "That was all tho...",
        unseenCount: 12,
        timestamp: "50 minutes ago"),
    Chat(
        name: "Marvellous Joseph",
        message: "Africa Foresight G...",
        unseenCount: 2,
        timestamp: "56 minutes ago"),
  ];

  Chat getChat() {
    Chat chat = chats[chatIndex];
    chatIndex = ++chatIndex % chats.length;
    return chat;
  }
}
