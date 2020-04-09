import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_app/model/pokemon.dart';

import '../../constants.dart';


const kTextStyle = TextStyle(
  fontSize: 15,
  color: kPrimaryColor,
);

class PokemonListWidget extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonListWidget({Key key, this.pokemon}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 12,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(16), bottomRight: Radius.circular(16))),
      child: Row(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(8),
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            child: Hero(
              tag: pokemon.id,
              child: CachedNetworkImage(
                imageUrl: pokemon.img,
                fit: BoxFit.fill,
                placeholder: (context, url) => Container(child: Center(child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                )),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ),
          SizedBox(width: 12,),
          Wrap(
            spacing: 5,
            direction: Axis.vertical,
            children: <Widget>[
              Text(pokemon.name,
                maxLines: 1,
                style: kTextStyle.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text("Height ${pokemon.height}", style: kTextStyle,),
              Text("Weight ${pokemon.weight}", style: kTextStyle,),
            ],
          ),
        ],
      ),
    );
  }
}
