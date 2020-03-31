import 'package:flutter/material.dart';

const kTextStyle = TextStyle(
  fontSize: 16,
);

class RepositoryWidget extends StatelessWidget {
  final String profilePic;
  final String username;
  final String repository;

  final String description;


  final String language;
  final int stars;

  const RepositoryWidget({Key key, this.profilePic, this.username, this.repository, this.description, this.language, this.stars}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      width: MediaQuery.of(context).size.width * 0.65,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300,),
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                child: Image.network(profilePic,
                  height: 15,
                  width: 15,
                ),
              ),
              SizedBox(width: 8,),
              Text(username,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey.shade700,
                ),
              ),
            ],
          ),
          Text(repository, style: kTextStyle.copyWith(fontWeight: FontWeight.w500),),
          Text(description,
            style: kTextStyle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 36,),
          Row(
            children: <Widget>[
              CircleAvatar(
                radius: 8,
                backgroundColor: Colors.cyan,
              ),
              SizedBox(width: 16,),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Text(language, style: kTextStyle.copyWith(color: Colors.grey.shade700),),
              ),
              Spacer(),
              Icon(Icons.star, color: Colors.amber,),
              SizedBox(width: 16,),
              Text(stars.toString()),
            ],
          )
        ],
      ),
    );
  }
}
