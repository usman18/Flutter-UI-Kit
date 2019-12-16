import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tour_info_app/components/label.dart';
import 'package:tour_info_app/components/transparent_button.dart';
import 'package:tour_info_app/tours_provider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'model/tour.dart';

void main() => runApp(TourApp());

class TourApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ToursProvider toursProvider = ToursProvider();
  Tour currentTour;

  @override
  void initState() {
    super.initState();
    currentTour = toursProvider.nextTour();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        _buildBackground(),
        _buildGradient(),
        Positioned(child: _buildContentUI(),
          top: MediaQuery.of(context).size.height * 0.45,
          left: 20,
          right: 20,
        ),
        Positioned(child: _buildControlButtons(),
          bottom: 20,
          left: 40,
          right: 40,
        ),

      ],
    ));
  }


  Widget _buildGradient() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.transparent, Colors.black.withOpacity(0.8)],
          stops: [0.3,1],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }


  Widget _buildBackground() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.transparent, Colors.black.withOpacity(0.8)],
          stops: [0.7,1],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: CachedNetworkImage(
        imageUrl: currentTour.coverPic,
        fit: BoxFit.cover,
        placeholder: (context, url) => Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.only(top: 64),
            child: CircularProgressIndicator(),
          ),
        ),
        errorWidget: (context, url, error) => Padding(
          padding: const EdgeInsets.only(top: 64),
          child: Align(
            alignment: Alignment.topCenter,
            child: Icon(Icons.error),
          ),
        ),
      ),
      height: double.infinity,
    );
  }


  Widget _buildControlButtons() {
    return Row(
      children: <Widget>[
        Expanded(
          child: TransparentButton(text: "Previous",
            onTap: () {
              setState(() {
                currentTour = toursProvider.previousTour();
              });
            },
          ),
        ),
        SizedBox(
          width: 12,
        ),
        Expanded(
          child: TransparentButton(text: "Next",
            onTap: () {
              setState(() {
                currentTour = toursProvider.nextTour();
              });
            },
          ),
        ),
      ],
    );
  }


  Widget _buildContentUI() {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(currentTour.tourName,
          style: TextStyle(
            fontSize: 42,
            fontWeight: FontWeight.bold,
          ),
        ),

        SizedBox(height: 4,),

        Row(
          children: <Widget>[
            RatingBarIndicator(
              itemCount: 5,
              rating: currentTour.rating,
              itemBuilder: (context, index) => Icon(Icons.star, color: Colors.amber,),
              itemSize: 20,
              itemPadding: EdgeInsets.all(6),
              direction: Axis.horizontal,
            ),
            SizedBox(
              width: 8,
            ),
            Text(currentTour.rating.toString(),
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600
              ),
            ),
          ],
        ),

        SizedBox(height: 12,),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Label(title: currentTour.tourTime,
              icon: Icons.timer,
              subTitle: "Tour time",
            ),
            Label(title: currentTour.price,
              icon: Icons.label,
              subTitle: "Price",
            ),
            Label(title: currentTour.placesCount,
              icon: Icons.place,
              subTitle: "Places",
            ),
            Label(title: currentTour.closeHrs,
              icon: Icons.fullscreen_exit,
              subTitle: "Close",
            ),



          ],
        ),

      ],
    );



  }
}
