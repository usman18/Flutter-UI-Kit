import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/chats_provider.dart';
import 'package:chat_app/model/chat.dart';
import 'package:chat_app/pages/chat_screen.dart';
import 'package:chat_app/pictures_provider.dart';
import 'package:flutter/material.dart';

class ChatsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            title: Text(
              "Chats",
              style: TextStyle(color: Colors.white, fontSize: 21, fontWeight: FontWeight.bold),
            ),
            floating: true,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: Text(
                "Stories",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 180,
              child: ListView.builder(
                itemBuilder: (_, position) {
                  return Container(
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 0.5),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: CachedNetworkImage(
                        imageUrl: ProfilePicturesProvider.pics[position],
                        placeholder: (context, url) => Container(color: Colors.transparent,
                          child: Center(child: CircularProgressIndicator()),
                          height: 180,
                          width: 100,
                        ),
                        errorWidget: (context, url, error) => Container(
                          child: Center(child: Icon(Icons.error)),
                          height: 180,
                          width: 100,
                        ),
                      )
                    ),
                  );
                },
                physics: BouncingScrollPhysics(),
                itemCount: ProfilePicturesProvider.pics.length,
                scrollDirection: Axis.horizontal,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                "Messages",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, position) {
                Chat chat = ChatsProvider.chats[position % ChatsProvider.chats.length];
                String profilePic = ProfilePicturesProvider.pics[position % ChatsProvider.chats.length];
                chat.profilePic = profilePic;

                return InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => ChatScreen(chat)));
                  },
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Stack(
                            children: <Widget>[
                              CircleAvatar(
                                backgroundImage: NetworkImage(profilePic),
                                radius: 25,
                              ),
                              Positioned(
                                bottom: 1,
                                right: 4,
                                child: CircleAvatar(
                                  radius: 4,
                                  backgroundColor: chat.isActive ? Colors.green[700] : Colors.transparent,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(chat.userName),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          Text(
                                            chat.messages.last.message,
                                            style: TextStyle(color: Colors.grey, fontSize: 13),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      children: <Widget>[
                                        Text(
                                          chat.timestamp,
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        chat.unreadMessages == 0
                                            ? Text("")
                                            : CircleAvatar(
                                                backgroundColor: Color(0xff2489FF),
                                                child: Text(
                                                  "${chat.unreadMessages}",
                                                  style: TextStyle(fontSize: 10),
                                                ),
                                                radius: 8,
                                                foregroundColor: Colors.white,
                                              ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Divider(
                                  color: Colors.grey,
                                  thickness: 0.5,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              childCount: ChatsProvider.chats.length * 4,
            ),
          ),
        ],
      ),
    );
  }
}
