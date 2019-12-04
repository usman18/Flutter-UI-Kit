import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:music_player_app_ui/constants.dart';
import 'curved_card.dart';

class SongRow extends StatelessWidget {
  final String songName;
  final String album;
  final String artistCoverPic;
  final bool isPlaying;
  final double rating;
  final String duration;

  SongRow({this.songName, this.album, this.artistCoverPic, this.isPlaying = false, this.rating, this.duration});

  @override
  Widget build(BuildContext context) {
    return CurvedCard(
      color: isPlaying ? kGrey : Theme.of(context).primaryColor,
      topLeft: isPlaying ? 24 : 0,
      bottomRight: isPlaying ? 24 : 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Row(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(12), bottomRight: Radius.circular(12),),
              child: Image.network(
                artistCoverPic,
                height: 60,
                width: 60,
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
                    Text(songName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: 6,),
                    Text(album,
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
                      initialRating: rating,
                      itemCount: 5,
                      itemBuilder: (context, _) => Icon(Icons.star,),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 44, right: 8),
              child: Text(duration,),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Visibility(child: Icon(Icons.equalizer, size: 22,),
                  visible: isPlaying,
                ),
                SizedBox(height: 8,),
                Icon(Icons.more_vert, size: 22,),
              ],
            )
          ],
        ),
      ),
    );
  }

}
