import 'package:flutter/material.dart';
import 'package:instagram_ui_redesign/model/post.dart';
import 'package:instagram_ui_redesign/widgets/profile_pic.dart';

import '../posts_provider.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: Container(
            padding: EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    ProfilePic(
                      radius: 40,
                      profilePic: "https://images.hdqwalls.com/download/1/iron-man-mark-4-suit-5k-l0.jpg",
                    ),
                    SizedBox(
                      width: 24,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("crazy_username", style: TextStyle(fontWeight: FontWeight.w600),),
                        Text("Marvel | DC | \nRandom pics", style: TextStyle(fontSize: 13, color: Colors.grey.shade700),),
                        Text("www.someurl.com", style: TextStyle(fontSize: 13, color: Colors.grey.shade700),),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 24,),
                Divider(height: 1, ),
                Padding(
                  padding: const EdgeInsets.only(top: 26, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text("700", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                          SizedBox(height: 4,),
                          Text("Posts", style: TextStyle(fontSize: 13, color: Colors.grey.shade700),),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Text("18m", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                          SizedBox(height: 4,),
                          Text("Followers", style: TextStyle(fontSize: 13, color: Colors.grey.shade700),),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Text("10", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15,),),
                          SizedBox(height: 4,),
                          Text("Following", style: TextStyle(fontSize: 13, color: Colors.grey.shade700),),
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(height: 1, ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24, ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Card(
                    child: Container(
                      height: 56,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        gradient: LinearGradient(
                          colors: [Color(0xff5778DA), Color(0xff8970D8)],
                        ),
                      ),
                      child: Center(
                        child: Text("FOLLOW",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    elevation: 4,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                  ),
                ),
                SizedBox(width: 8,),
                IconButton(icon: Icon(Icons.send), onPressed: (){})
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            height: 100,
            child: ListView.builder(itemBuilder: (_, position) {
              Post post = PostsProvider.posts[position];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Container(
                  width: 55,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      ProfilePic(profilePic: post.profilePicUrl ?? "", radius: 25,),
                      SizedBox(height: 4,),
                      Text(post.username,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 6),
              scrollDirection: Axis.horizontal,
              itemCount: PostsProvider.posts.length,
            ),
          ),
        ),
        SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,
          ),
          delegate: SliverChildBuilderDelegate(
          (context, position) {
            Post post = PostsProvider.posts[position];
            return Image.network(post.imageUrl,
              fit: BoxFit.fill,
            );
          },
            childCount: PostsProvider.posts.length,
          ),
        ),
      ],
    );
  }
}
