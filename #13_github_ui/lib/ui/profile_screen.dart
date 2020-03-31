import 'package:flutter/material.dart';
import 'package:github_ui/constants.dart';
import 'package:github_ui/providers/repository_provider.dart';
import 'package:github_ui/ui/widgets/repository_widget.dart';

const kTextStyle = TextStyle(
  fontSize: 16,
);

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final String profilePic = kProfilePic;

  final String homeImage =
      "https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Ficons.iconarchive.com%2Ficons%2Fgoogle%2Fnoto-emoji-travel-places%2F1024%2F42486-house-icon.png&f=1&nofb=1";

  final String bio = "Flutter & Android Developper | Writer(Android) | Open Source | Freelancer | UI & UX Enthusiast";

  String twitterUrl = "https://twitter.com/khan_usman_18";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(
          color: kAccentColor,
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.share), onPressed: () {}),
          IconButton(icon: Icon(Icons.settings), onPressed: () {}),
        ],
      ),
      body: ListView(
        children: <Widget>[
          _buildInfoSection(),
          SizedBox(
            height: 16,
          ),
          _buildPinnedSection(),
          SizedBox(height: 16,),
        ],
      ),
    );
  }

  Widget _buildInfoSection() {
    return Card(
      margin: EdgeInsets.zero,
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: <Widget>[
                ClipRRect(
                  child: Container(
                    child: Image.network(
                      profilePic,
                      height: 60,
                      width: 60,
                    ),
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Container(
                  height: 60,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        "Usman Khan",
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "usman18",
                        style: kTextStyle.copyWith(color: Colors.grey.shade700),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              color: Colors.grey.shade200,
            ),
            child: Row(
              children: <Widget>[
                Image.network(
                  homeImage,
                  height: 30,
                  width: 30,
                ),
                SizedBox(
                  width: 16,
                ),
                Text(
                  "Working from home",
                  style: kTextStyle,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              bio,
              style: kTextStyle,
            ),
          ),
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.location_on,
                      color: Colors.grey.shade400,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Pune",
                      style: kTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.link,
                      color: Colors.grey.shade400,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      twitterUrl,
                      style: kTextStyle.copyWith(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.person,
                      color: Colors.grey.shade400,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "80 followers",
                      style: kTextStyle,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        "•",
                        style: kTextStyle,
                      ),
                    ),
                    Text(
                      "0 following",
                      style: kTextStyle,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }

  Widget _buildRepositoriesSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(
                Icons.label_important,
                color: Colors.grey.shade400,
              ),
              SizedBox(
                width: 16,
              ),
              Text(
                "Pinned",
                style: kTextStyle.copyWith(fontWeight: FontWeight.w500),
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: RepositoryProvider.repositories.map((repository) {
                    return RepositoryWidget(
                      profilePic: repository.profilePicUrl,
                      username: repository.username,
                      language: repository.language,
                      repository: repository.repository,
                      stars: repository.stars,
                      description: repository.description,
                    );
                  }).toList(),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }


  Widget _buildPinnedSection() {

    return Card(
      child: Column(
        children: <Widget>[
          _buildRepositoriesSection(),
          _buildSubSections(),
        ],
      ),
    );

  }


  Widget _buildSubSections() {

    return Column(
      children: <Widget>[
        ListTile(
          title: Text("Repositories", style: kTextStyle,),
          trailing: Text("39", style: kTextStyle.copyWith(color: Colors.grey.shade600),),
        ),
        Divider(),
        ListTile(
          title: Text("Organiations", style: kTextStyle,),
          trailing: Text("0", style: kTextStyle.copyWith(color: Colors.grey.shade600),),
        ),
        Divider(),

        ListTile(
          title: Text("Starred", style: kTextStyle,),
          trailing: Text("75", style: kTextStyle.copyWith(color: Colors.grey.shade600),),
        ),
        Divider(),
        ListTile(
          title: Text("Following", style: kTextStyle,),
          trailing: Text("0", style: kTextStyle.copyWith(color: Colors.grey.shade600),),
        ),
        Divider(),

      ],
    );


  }



}
