import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instagram_ui_redesign/model/post.dart';


class PostWidget extends StatelessWidget {
  final Post post;

  const PostWidget(this.post);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8,),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                _buildProfilePic(context),
                SizedBox(width: 8,),
                Expanded(
                  child: Text(post.username,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Icon(Icons.more_vert,
                  color: Colors.grey.shade600,
                )
               ],
            ),
          ),
          Image.network(
            post.imageUrl ?? "",
            fit: BoxFit.cover,
          ),
          Row(
            children: <Widget>[
              IconButton(icon: Icon(Icons.favorite_border), onPressed: () {},
              ),
              IconButton(icon: Icon(FontAwesomeIcons.comment), onPressed: () {},
              ),
              IconButton(icon: Icon(Icons.send), onPressed: () {},
              ),
              Expanded(child: Text("")),
              IconButton(icon: Icon(Icons.bookmark_border), onPressed: () {}),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, bottom: 4),
            child: Text("${post.likes} likes",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(post.description),
          ),
          SizedBox(height: 12,)
        ],
      ),
    );
  }

  Widget _buildProfilePic(BuildContext context) {

    return Container(
      padding: EdgeInsets.all(2),
     decoration: BoxDecoration(
       shape: BoxShape.circle,
      border: Border.all(color: Theme.of(context).accentColor),
     ),
      child: CircleAvatar(
        radius: 16,
        backgroundImage: NetworkImage(post.profilePicUrl ?? ""),
      ),
    );


  }


}
