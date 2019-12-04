import 'package:flutter/material.dart';
import 'package:music_player_app_ui/components/curved_card.dart';
import 'package:music_player_app_ui/constants.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:music_player_app_ui/model/song.dart';

class SongDetailsScreen extends StatefulWidget {

  final Song song;

  const SongDetailsScreen({Key key, this.song}) : super(key: key);

  @override
  _SongDetailsScreenState createState() => _SongDetailsScreenState();
}

class _SongDetailsScreenState extends State<SongDetailsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Player",
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        children: <Widget>[
          Align(
            child: _buildBackgroundBox(),
            alignment: Alignment.center,
          ),
          Align(
            child: _buildMusicUI(),
            alignment: Alignment.center,
          ),
        ],
      ),
    );
  }

  Widget _buildBackgroundBox() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            color: kYellow,
            height: 200,
          ),
        ),
        Expanded(
          child: Container(
            color: kBlue,
            height: 200,
          ),
        ),
      ],
    );
  }


  Widget _buildMusicUI() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildSongInfo(),
              _buildArtistCoverPic(),
              _buildSongNameCard(),
              _buildSongProgress(),
              _buildMusicController(),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildSongInfo() {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      width: 200,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              textBaseline: TextBaseline.alphabetic,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Album",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: 4,),
                Text(widget.song.album,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            RatingBar(
              itemSize: 20,
              glowColor: Colors.white,
              allowHalfRating: true,
              unratedColor: Colors.grey,
              itemCount: 5,
              itemBuilder: (context, _) => Icon(Icons.star,),
              initialRating: widget.song.rating,
              direction: Axis.horizontal,
              onRatingUpdate: (d){},
            ),
          ],
        ),
      ),
    );
  }



  Widget _buildArtistCoverPic() {
    return ClipRRect(
      borderRadius: BorderRadius.only(topLeft: Radius.circular(24), bottomRight: Radius.circular(24),),
      child: Image.network(
        widget.song.artistCoverPic,
        height: 300,
        width: 100,
        fit: BoxFit.fill,
      ),
    );

  }

  Widget _buildSongNameCard() {

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: CurvedCard(
      bottomLeft: 24,
      topRight: 24,
      color: kRed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        width: 200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(widget.song.songName,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(Icons.file_download),
          ],
        ),
      )
      ),
    );

  }

  Widget _buildSongProgress() {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: <Widget>[
          Text("1:13"),
          Expanded(
            child: Slider(value: 30,
              onChanged: (_) {},
              min: 0,
              max: 100,
              activeColor: Colors.white,
              inactiveColor: Colors.grey,
            ),
          ),
          Text("3:36"),
        ],
      ),
    );

  }




  Widget _buildMusicController() {
    return CurvedCard(
      color: kGrey,
      topLeft: 24,
      bottomRight: 24,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(icon: Icon(Icons.shuffle), onPressed: () {}),
            IconButton(icon: Icon(Icons.skip_previous), onPressed: () {}),
            CurvedCard(child: IconButton(icon: Icon(Icons.pause), onPressed: () {}),
              color: Color(0xff302931),
              topLeft: 12,
              bottomRight: 12,
            ),
            IconButton(icon: Icon(Icons.skip_next), onPressed: () {}),
            IconButton(icon: Icon(Icons.loop), onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
