import 'package:flutter/material.dart';
import 'package:instagram_ui_redesign/model/post.dart';
import 'package:instagram_ui_redesign/posts_provider.dart';
import 'package:instagram_ui_redesign/widgets/post_widget.dart';
import 'package:instagram_ui_redesign/widgets/profile_pic.dart';

class FeedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: Container(
            height: 100,
            child: ListView.builder(itemBuilder: (_, position) {
              Post post = PostsProvider.posts[position];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      ProfilePic(profilePic: post.profilePicUrl ?? "", radius: 20,),
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
        SliverToBoxAdapter(
          child: Divider(height: 4,),
        ),
        SliverList(delegate: SliverChildBuilderDelegate((_, position) {
          Post post = PostsProvider.posts[position];
          return PostWidget(post);
        },
          childCount: 10,
        ),),
      ],
    );
  }
}

