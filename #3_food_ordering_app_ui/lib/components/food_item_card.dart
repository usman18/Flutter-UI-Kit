import 'package:flutter/material.dart';

class FoodItemCard extends StatelessWidget {
  final String imageUrl;
  final String itemName;
  final String estimatedTime;
  final String rating;
  final String price;

  FoodItemCard({this.imageUrl, this.itemName, this.estimatedTime, this.rating, this.price});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(20,),),
        child: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 6,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(imageUrl),
                    )
                  ),
                 )
              ),
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4,),
                      child: Text(itemName, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14,),),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4,),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.watch_later, color: Colors.green, size: 18,),
                          SizedBox(width: 2,),
                          Text(estimatedTime, style: TextStyle(color: Colors.green, fontSize: 14,),),

                          SizedBox(width: 8,),

                          Icon(Icons.star_border, color: Colors.red, size: 18,),
                          SizedBox(width: 2,),
                          Text(rating, style: TextStyle(color: Colors.red, fontSize: 14,),),

                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8,),
                      child: Text("$price \$", style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),),
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }



}
