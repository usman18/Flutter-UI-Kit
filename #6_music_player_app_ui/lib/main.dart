import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:music_player_app_ui/screens/song_details_screen.dart';
import 'package:music_player_app_ui/songs_provider.dart';
import 'components/curved_card.dart';
import 'components/song_item.dart';
import 'constants.dart';
import 'model/song.dart';

void main() => runApp(MusicApp());

class MusicApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      theme: ThemeData.dark().copyWith(
        primaryColor: kPrimaryColor,
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentBottomTab = 0;
  int currentSongPosition = -1;       //Initially no song selected

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Playlist",
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemBuilder: (_, position) {
          Song song = SongsProvider.songs[position % SongsProvider.songs.length];   //Handling out of bounds
          return GestureDetector(
            onTap: () {
              setState(() {
                currentSongPosition = position;
              });
            },
            onDoubleTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => SongDetailsScreen(song: song,)));
            },
            child: SongRow(
              songName: song.songName,
              album: song.album,
              artistCoverPic: song.artistCoverPic,
              duration: song.duration,
              rating: song.rating,
              isPlaying: currentSongPosition == position,
            ),
          );
        },
        itemCount: SongsProvider.songs.length * 2,      //just to populate more data
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildBottomBar() {

    Widget _buildCurrentSongSection() {

      if (currentSongPosition == -1)
        return Container();

      Song song = SongsProvider.songs[currentSongPosition % SongsProvider.songs.length];

      return Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 4,),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(12), bottomRight: Radius.circular(12),),
                  child: Image.network(
                    song.artistCoverPic,
                    height: 45,
                    width: 45,
                    fit: BoxFit.fill,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(song.songName,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(height: 6,),
                        Text(song.album,
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(height: 6,),
                        RatingBar(
                          onRatingUpdate: (d){},
                          itemSize: 12,
                          unratedColor: Colors.grey,
                          glowColor: Colors.white,
                          allowHalfRating: true,
                          initialRating: song.rating,
                          itemCount: 5,
                          itemBuilder: (context, _) => Icon(Icons.star,),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.skip_previous,),
                    SizedBox(width: 4,),
                    CurvedCard(
                      child: Container(
                        padding: EdgeInsets.all(8),
                        child: Icon(Icons.pause,),
                      ),
                      topLeft: 12,
                      bottomRight: 12,
                      color: Color(0xff342D35),
                    ),
                    SizedBox(width: 4,),
                    Icon(Icons.skip_next,),
                  ],
                )
              ],
            ),
            Slider(value: 30,
              onChanged: (d){},
              activeColor: Colors.white,
              inactiveColor: Colors.grey,
              min: 0,
              max: 100,
            ),
          ],
        ),
      );
    }


    return CurvedCard(
      color: Color(0xff574954),
      topLeft: kBottomNavCornerRadius,
      bottomRight: kBottomNavCornerRadius,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _buildCurrentSongSection(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
              icon: Icon(
                Icons.queue_music,
                color: currentBottomTab == 0 ? Colors.white : Colors.grey[400],
              ),
              padding: EdgeInsets.all(8),
              onPressed: () {
                setState(() {
                  currentBottomTab = 0;
                });
              }),
              IconButton(
              icon: Icon(
                Icons.search,
                color: currentBottomTab == 1 ? Colors.white : Colors.grey[400],
              ),
              padding: EdgeInsets.all(8),
              onPressed: () {
                setState(() {
                  currentBottomTab = 1;
                });
              }),
              IconButton(
              icon: Icon(
                Icons.person_outline,
                color: currentBottomTab == 2 ? Colors.white : Colors.grey[400],
              ),
              padding: EdgeInsets.all(8),
              onPressed: () {
                setState(() {
                  currentBottomTab = 2;
                });
              }),
            ],
          ),
        ],
      ),
    );
  }
}
